
package com.blossom_project.showcase;

import com.google.common.io.Resources;
import com.blossom_project.showcase.initializr.model.Initializr;
import com.blossom_project.showcase.initializr.model.ProjectGenerator;
import com.blossom_project.ui.menu.MenuItem;
import com.blossom_project.ui.menu.MenuItemBuilder;
import org.elasticsearch.client.Client;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.core.io.ResourceLoader;

@SpringBootApplication
public class Application {

  public final static void main(String... args) {
    SpringApplication.run(Application.class, args);
  }

  @Bean
  public Initializr initializr() {
    return new Initializr();
  }

  @Bean
  public ProjectGenerator projectGenerator(Initializr initializr, ResourceLoader resourceLoader) {
    return new ProjectGenerator(initializr, resourceLoader);
  }

  @Bean
  public MenuItem generationMenuItem(MenuItemBuilder builder){
    return builder.key("generations").label("menu.generations").icon("fa fa-bar-chart").link("/blossom/generations").leaf(true).build();
  }

  @Bean
  public CommandLineRunner initIndex(final Client client, final ResourceLoader resourceLoader){
    return args ->{
      if (!client.admin().indices().prepareExists("generations").get().isExists()) {
        client.admin().indices().prepareCreate("generations")
          .setSource(Resources.toByteArray(resourceLoader.getResource("classpath:/generations.json").getURL()))
          .get();
      }
    };
  }
}
