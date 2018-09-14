package com.blossomproject.showcase.initializr.model.properties;

import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;
import java.util.Optional;

/**
 * Created by Maël Gargadennnec on 14/06/2017.
 */
@ConfigurationProperties("initializr")
public class Initializr {
  private List<Version> versions;
  private List<Group> groups;
  private List<InitializrFile> initializrFiles;
  private String defaultPackagingMode;

  public List<Version> getVersions() {
    return versions;
  }

  public void setVersions(List<Version> versions) {
    this.versions = versions;
  }

  public List<Group> getGroups() {
    return groups;
  }

  public void setGroups(List<Group> groups) {
    this.groups = groups;
  }

  public List<InitializrFile> getInitializrFiles() {
    return initializrFiles;
  }

  public void setInitializrFiles(List<InitializrFile> initializrFiles) {
    this.initializrFiles = initializrFiles;
  }

  public String getDefaultPackagingMode() {
    return defaultPackagingMode;
  }

  public void setDefaultPackagingMode(String defaultPackagingMode) {
    this.defaultPackagingMode = defaultPackagingMode;
  }

  public Optional<Version> findVersion(String blossomVersion) {
    return this.versions.stream().filter(v -> v.getBlossom().equals(blossomVersion)).findFirst();
  }

  public Optional<Dependency> findDependency(String dependencyId) {
    return this.groups.stream().flatMap(g -> g.getDependencies().stream()).filter(d -> d.getId().equals(dependencyId))
        .findFirst();
  }

}
