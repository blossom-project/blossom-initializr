<#import "/master.ftl" as master/>

<@master.feature title="Database versionning">
<section class="container">
  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">Liquibase</h2>
      <p><a href="http://www.liquibase.org/" target="_blank">Liquibase</a> is used as a Database source control.</p>
      <p>A Blossom project must contains a root changelog containing the following includes.</p>
      <textarea class="code" data-cm-mode="yaml">
databaseChangeLog:
    - includeAll:
        path: classpath*:/db/changelog/blossom
    - includeAll:
        path: classpath*:/db/changelog/blossom/modules
        errorIfMissingOrEmpty: false
    - includeAll:
        path: classpath:/db/changelog/generated
        errorIfMissingOrEmpty: false
          </textarea>
      <p>The <code>classpath*:</code> will be searched for all changesets files in all jars present on the classpath, while <code>classpath:</code> prefixed includes will only look for changeset inside your application.</p>
    </div>
  </div>
</section>
</@master.feature>
