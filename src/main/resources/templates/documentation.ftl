<#import "master.ftl" as master>
<#import "/blossom/utils/modal.ftl" as modal>

<#macro widgetFeature title link icon>
<div class="col-md-6 col-lg-4">
  <a data-toggle="modal" href="#${title?replace(' ', '-')}">
    <div class="widget widget-feature p-lg text-center">
      <div class="m-b-md">
        <i class="${icon}"></i>
        <h3 class="font-bold">
         ${title}
        </h3>
      </div>
    </div>
  </a>
</div>
<@modal.large id="${title?replace(' ', '-')}" href="${link}"/>
</#macro>

<@master.default>
<link href="/css/style-documentation.css" rel="stylesheet">

<section id="headline" class="container">
  <div class="row">
    <div class="col-lg-12 text-center">
      <h1>Blossom</h1>
      <p>Blossom is a Java framework based on Spring-Boot which enables you to realize your projects quickly and smoothly.</p>
      <p>It contains a responsive back-office which includes several modules and tools made to ease and speed up your development process.</p>
    </div>
  </div>
</section>

<section id="features" class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line"></div>
      <h2 class="text-center m-b-xl">Features</h2>

      <div class="row">
        <@widgetFeature title="User interface" link="/documentation/features/interface" icon="fa fa-window-restore fa-4x" />
        <@widgetFeature title="Rest API" link="/documentation/features/rest_api" icon="fa fa-bolt fa-4x" />
        <@widgetFeature title="Basic functionnalities" link="/documentation/features/basic_functionalities" icon="fa fa-user fa-4x" />
        <@widgetFeature title="Security" link="/documentation/features/security" icon="fa fa-lock fa-4x" />
        <@widgetFeature title="Generic implementations" link="/documentation/features/generic_impl" icon="fa fa-puzzle-piece fa-4x" />
        <@widgetFeature title="Application events" link="/documentation/features/application_event" icon="fa fa-random fa-4x" />
        <@widgetFeature title="Cache" link="/documentation/features/cache" icon="fa fa-magnet fa-4x" />
        <@widgetFeature title="Database versionning" link="/documentation/features/database_versionning" icon="fa fa-database fa-4x" />
        <@widgetFeature title="Exception Handling" link="/documentation/features/exception" icon="fa fa-warning fa-4x" />
        <@widgetFeature title="Internationalization" link="/documentation/features/i18n" icon="fa fa-language fa-4x" />
        <@widgetFeature title="Indexation and search" link="/documentation/features/indexation" icon="fa fa-search fa-4x" />
        <@widgetFeature title="Mailing" link="/documentation/features/mail" icon="fa fa-envelope fa-4x" />
        <@widgetFeature title="Monitoring" link="/documentation/features/monitoring" icon="fa fa-dashboard fa-4x" />
        <@widgetFeature title="Plugin system" link="/documentation/features/plugin_system" icon="fa fa-plug fa-4x" />
        <@widgetFeature title="Template engine" link="/documentation/features/templating" icon="fa fa-html5 fa-4x" />
        <@widgetFeature title="Themes" link="/documentation/features/themes" icon="fa fa-paint-brush fa-4x" />
        <@widgetFeature title="Validation" link="/documentation/features/validation" icon="fa fa-check-circle fa-4x" />
        <@widgetFeature title="Entity generator" link="/documentation/features/module_generator" icon="fa fa-magic fa-4x" />
      </div>
    </div>
  </div>
</section>

<section id="howtos" class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line"></div>
      <h2 class="text-center m-b-xl">How-tos</h2>
      <div class="row">
        <@widgetFeature title="Start a project" link="/documentation/howtos/start_a_project" icon="fa fa-play fa-4x" />
        <@widgetFeature title="Manage the menu" link="/documentation/howtos/manage_the_menu" icon="fa fa-bars fa-4x" />
        <@widgetFeature title="Schedule a task" link="/documentation/howtos/schedule_a_task" icon="fa fa-calendar fa-4x" />
        <@widgetFeature title="Add custom entities" link="/documentation/howtos/add_custom_entities" icon="fa fa-plus-circle fa-4x" />
        <@widgetFeature title="Index and search entities" link="/documentation/howtos/index_and_search_entities" icon="fa fa-search-plus fa-4x" />
        <@widgetFeature title="Change the theme" link="/documentation/howtos/change_theme" icon="fa fa-paint-brush fa-4x" />
        <@widgetFeature title="Deploy as WAR" link="/documentation/howtos/deploy_as_war" icon="fa icon-tomcat fa-4x" />
      </div>
    </div>
  </div>
</section>


<section id="starters" class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line"></div>
      <h2 class="text-center m-b-xl">Starters</h2>
      <div class="row">
        <@widgetFeature title="blossom-starter-basic" link="/documentation/starters/blossom-starter-basic" icon="fa fa-cube fa-4x" />
        <@widgetFeature title="blossom-starter-ui-web" link="/documentation/starters/blossom-starter-ui-web" icon="fa fa-desktop fa-4x" />
        <@widgetFeature title="blossom-starter-ui-api" link="/documentation/starters/blossom-starter-ui-api" icon="fa fa-desktop fa-4x" />
        <@widgetFeature title="blossom-starter-filemanager" link="/documentation/starters/blossom-starter-filemanager" icon="fa fa-cubes fa-4x" />
        <@widgetFeature title="blossom-starter-articles" link="/documentation/starters/blossom-starter-articles" icon="fa fa-cubes fa-4x" />
        <@widgetFeature title="blossom-starter-bpmn" link="/documentation/starters/blossom-starter-bpmn" icon="fa fa-cubes fa-4x" />
      </div>
    </div>
  </div>
</section>
</@master.default>
