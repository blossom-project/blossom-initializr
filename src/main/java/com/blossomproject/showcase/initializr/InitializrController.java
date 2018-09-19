package com.blossomproject.showcase.initializr;

import com.blossomproject.showcase.initializr.model.PACKAGING_MODE;
import com.blossomproject.showcase.initializr.model.ProjectConfiguration;
import com.blossomproject.showcase.initializr.model.ProjectGenerator;
import com.blossomproject.showcase.initializr.model.SOURCE_LANGUAGE;
import com.blossomproject.showcase.initializr.model.properties.Dependency;
import com.blossomproject.showcase.initializr.model.properties.Group;
import com.blossomproject.showcase.initializr.model.properties.Initializr;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.elasticsearch.action.bulk.BulkProcessor;
import org.elasticsearch.action.index.IndexRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Maël Gargadennnec on 14/06/2017.
 */
@Controller
@RequestMapping("/initializr")
public class InitializrController {
  private final Logger logger = LoggerFactory.getLogger(InitializrController.class);

  private final Initializr initializr;
  private final ProjectGenerator projectGenerator;
  private final ObjectMapper mapper;
  private final BulkProcessor bulkProcessor;

  private final String[] defaultDependencies;
  private final List<String> requiredDependencies;

  @Autowired
  public InitializrController(Initializr initializr, ProjectGenerator projectGenerator,
                              ObjectMapper mapper, BulkProcessor bulkProcessor) {
    this.initializr = initializr;
    this.projectGenerator = projectGenerator;
    this.mapper = mapper;
    this.bulkProcessor = bulkProcessor;

    defaultDependencies = initializr.getGroups()
        .stream()
        .map(Group::getDependencies)
        .flatMap(List::stream)
        .filter(Dependency::isDefault)
        .map(Dependency::getId)
        .collect(Collectors.toList())
        .toArray(new String[]{});

    requiredDependencies = initializr.getGroups()
        .stream()
        .map(Group::getDependencies)
        .flatMap(List::stream)
        .filter(Dependency::isRequired)
        .map(Dependency::getId)
        .collect(Collectors.toList());
  }

  @GetMapping
  public ModelAndView main(Model model) {
    model.addAttribute("project", new ProjectConfiguration(defaultDependencies));
    model.addAttribute("initializr", initializr);
    model.addAttribute("packagingModes", PACKAGING_MODE.values());
    model.addAttribute("sourceLanguages", SOURCE_LANGUAGE.values());

    return new ModelAndView("initializr");
  }

  @PostMapping(produces = "application/zip")
  public void generate(@ModelAttribute("form") ProjectConfiguration projectConfiguration,
                       HttpServletResponse res)
      throws Exception {

    if (projectConfiguration.getDependencies().size() == 0) {
      projectConfiguration.getDependencies().add("blossom-starter-basic");
    }

    for (String requiredDependency : requiredDependencies) {
      if (!projectConfiguration.getDependencies().contains(requiredDependency)) {
        projectConfiguration.getDependencies().add(requiredDependency);
      }
    }

    res.addHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + projectConfiguration.getArtifactId() + ".zip\"");
    projectGenerator.generateProject(projectConfiguration, res.getOutputStream());

    ObjectNode document = mapper.valueToTree(projectConfiguration);
    document.put("timestamp", System.currentTimeMillis());

    bulkProcessor.add(new IndexRequest("generations", "generation").source(mapper.writeValueAsString(document)));
  }
}
