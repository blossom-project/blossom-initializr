package com.blossomproject.showcase.documentation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({"/","/documentation"})
public class DocumentationController
{

  @GetMapping
  public ModelAndView main() {
    return new ModelAndView("documentation");
  }

  @GetMapping("/features/{feature}")
  public ModelAndView feature(@PathVariable String feature) {
    return new ModelAndView("documentation/features/feature-"+feature);
  }

  @GetMapping("/howtos/{howto}")
  public ModelAndView howto(@PathVariable String howto) {
    return new ModelAndView("documentation/howtos/howto-"+howto);
  }

  @GetMapping("/starters/{starter}")
  public ModelAndView starter(@PathVariable String starter) {
    return new ModelAndView("documentation/starters/starter-"+starter);
  }

}
