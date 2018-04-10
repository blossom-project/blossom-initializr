<#import "master.ftl" as master/>

<@master.default>
<style>
  .CodeMirror{
    margin-top:10px;
    margin-bottom:10px;
  }
</style>

<section id="headline" class="container">
  <div class="row">
    <div class="col-lg-12 text-center">
      <div class="navy-line"></div>
      <h1>Blossom</h1>
      <p>Blossom is a Java framework based on Spring-Boot which enables you to realize your projects
        quickly and smoothly.</p>
      <p>It comes with several modules and tools made to ease and speed up your development
        process.</p>
    </div>
  </div>
</section>

<section id="quickstart" class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line"></div>
      <h2>Quick start</h2>
        <ol>
          <li>Go to <a href="/initializr" target="_blank">the initializr</a></li>
          <li>Choose the modules you want and generate your app' !</li>
          <li>Unzip the generated project and import it in your favorite IDE</li>
          <li>Run the main <code>Application</code> class</li>
        </ol>
    </div>
  </div>
</section>


<section id="features" class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line"></div>
      <h2>Features</h2>
      <ul>
        <li><a href="/documentation/features/interfaces">User interfaces</a></li>
        <li><a href="/documentation/features/application_event">Application events</a></li>
        <li><a href="/documentation/features/cache">Cache</a></li>
        <li><a href="/documentation/features/database_versionning">User interfaces</a></li>
        <li><a href="/documentation/features/exception">Exception Handling</a></li>
        <li><a href="/documentation/features/generic_impl">Generic implementation</a></li>
        <li><a href="/documentation/features/i18n">I18n</a></li>
        <li><a href="/documentation/features/indexation">Indexation and search</a></li>
        <li><a href="/documentation/features/mail">Mailing</a></li>
        <li><a href="/documentation/features/monitoring">Monitoring</a></li>
        <li><a href="/documentation/features/plugin_system">Plugin system</a></li>
        <li><a href="/documentation/features/security">Security</a></li>
        <li><a href="/documentation/features/templating">Template engine</a></li>
        <li><a href="/documentation/features/themes">Themes</a></li>
        <li><a href="/documentation/features/validation">Validation</a></li>
      </ul>
      </div>
    </div>
  </div>
</section>

<section id="howtos" class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line"></div>
      <h2>How-tos</h2>

      <div class="row">
        <div class="col-lg-12">
          <div class="navy-line-light"></div>
          <h3>Log in a default Blossom application</h3>
          <p>Blossom comes with a default admin account with identifier <strong>system</strong> and
            password <strong>system</strong>.</p>
          <p>This default configuration can be configured with the following properties</p>
          <div class="row m-t-xs m-b-xs">
            <div class="col-lg-12">
                <textarea class="code" data-cm-mode="properties">
blossom.security.default.account.identifier=system
blossom.security.default.account.password=system</textarea>
            </div>
          </div>
          <p>This default account can be disabled using this property :</p>
          <div class="row m-t-xs m-b-xs">
            <div class="col-lg-12">
<textarea class="code" data-cm-mode="properties">blossom.security.default.account.enabled=false</textarea>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="navy-line-light"></div>
          <h3>Manage the menu</h3>
          <div class="row">
            <div class="col-lg-12">
              <h4 class="m-t-lg">Add a new menu entry</h4>
              <p>To add a new menu entry, juste add a <code>MenuItem</code> bean to your <code>ApplicationContext</code>.</p>
              <p>You can inject in your <code>@Bean</code> annotated method the provided prototype-scoped <code>MenuItemBuilder</code> to simplifies it's creation.</p>

              <ul class="list-unstyled">
                <li><code>key()</code> is mandatory and represents the id of the menu.</li>
                <li><code>label()</code> is the i18n key or not static text</li>
                <li><code>icon()</code> is the css class that will be applied on the icon</li>
                <li><code>link()</code> is the relative url of the page the menu should lead to.</li>
                <li><code>privilege()</code> set the right the logged user should have to see the menu</li>
                <li><code>order()</code> allow to sort the menu entries. (values ranging from Integer.MIN_VALUE to Integer.MAX_VALUE)</li>
                <li><code>leaf()</code> indicates that the menu is a leaf in the hierarchy. If a non-leaf menu has no submenu, it'll not be displayed.</li>
              </ul>
              <div class="row m-t-xs m-b-xs">
                <div class="col-lg-12">
                 <p>The snippet below shows an example <code>MenutItem</code> declaration.</p>
<textarea class="code" data-cm-mode="text/x-java">
@Bean
public MenuItem exampleMenu(MenuItemBuilder builder) {
    return builder
            .key("exampleMenu")
            .label("menu.example.label.key")
            .icon("fa fa-photo")
            .link("/blossom")
            .build();
}</textarea>
              </div>
              </div>

            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Add a new menu subentry</h4>
              <p>To add a submenu entry, use the same process than to add a menu, but set the <code>parent()</code> property by injecting the parent <code>MenuItem</code> using the <code>@Qualifier</code> annotation.</p>
              <div class="row m-t-xs m-b-xs">
                <div class="col-lg-12">
                  <p>The snippet below shows an example of a child <code>MenuItem</code> declaration.</p>
<textarea class="code" data-cm-mode="text/x-java">
@Bean
public MenuItem exampleSubmenu(MenuItemBuilder builder, @Qualifier("exampleMenu") MenuItem testMenuItem) {
    return builder
              .key("exampleSubmenu")
              .label("menu.example.label.key.submenu")
              .link("/blossom")
              .icon("fa fa-picture")
              .parent(testMenuItem) // Setting the parent MenuItem
              .build();
}</textarea>
                </div>
              </div>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Open a specific menu on a page</h4>
              <p>Opening a specific menu on a back-office page is easy : add an <code>@OpenedMenu("menuKey")</code> annotation on the <code>@BlossomController</code> class containing the handler or <code>@RequestMapping</code> annotated method.</p>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Ordering menus</h4>
              <p>Menus and sub-menus can be ordered relatively to their siblings with the <code>order()</code> method on the MenuItemBuilder</code>.</p>
              <p>Possible values are the whole Integer values, from <code>Integer.MIN_VALUE</code> (highest precedence) to <code>Integer.MAX_VALUE</code> (lowest precedence)</p>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="navy-line-light"></div>
          <h3>Schedule tasks</h3>
          <div class="row">
            <div class="col-lg-12">
              <h4 class="m-t-lg">Configuring the scheduler</h4>
              <p>Blossom uses Quartz Scheduler by default.</p>
              <p>A file name `quartz.properties` can be added to your project to configure it further.</p>
              <p>See all available configurations <a href="http://www.quartz-scheduler.org/documentation/quartz-2.2.x/configuration/" target="_blank">here</a></p>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Add a scheduled task</h4>
              <div class="row">
                <div class="col-lg-12">
                  <h5 class="m-t-md">Creating a job</h5>
                  <p>To create a new job, do the following :</p>
                  <ol>
                    <li>Create a class implementing the `org.quartz.Job` interface.</li>
                    <li>Add annotations if necessary (see the example)</li>
                    <li>Autowire existing beans if they are needed by the job</li>
                  </ol>

                  <p>An example is provided below.</p>
                  <textarea class="code" data-cm-mode="text/x-java">
import org.quartz.Job;

@DisallowConcurrentExecution
@PersistJobDataAfterExecution
public class SampleJob implements Job {
  private final Logger LOGGER = LoggerFactory.getLogger(SampleJob.class);

  @Autowired // Jobs can be Autowired with beans from context
  private ApplicationContext applicationContext;

  @Override
  public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        // Do something here ...
  }
}
                  </textarea>
                </div>
                <div class="col-lg-12">
                  <h5 class="m-t-md">Creating a job detail factory</h5>
                  <p>The job definition and execution being created, you know need to reference it with Quartz in order to schedule it.</p
                  <p>It requires the creation of a `JobDetailFactoryBean` in your application context.</p>
                  <p>This factory doesn't schedule anything, it's a definition of your job.</p>
                  <p>You can configure it by setting :</p>
                  <ul>
                    <li>a group name to regroup jobs that are related (e.g : Indexation).</li>
                    <li>a job name</li>
                    <li>a job description</li>
                    <li>a durability (should the job definition be kept even if it's not scheduled ?)</li>
                  </ul>
                  <p>An example is provided below.</p>

                  <textarea class="code" data-cm-mode="text/x-java">
@Bean
public JobDetailFactoryBean sampleJobDetail() {
  JobDetailFactoryBean factoryBean = new JobDetailFactoryBean();
  factoryBean.setJobClass(SampleJob.class);
  factoryBean.setGroup("Sample");
  factoryBean.setName("Sample Job");
  factoryBean.setDescription("Sample job for demonstration purpose");
  factoryBean.setDurability(true);
  return factoryBean;
}
                  </textarea>
                </div>
                <div class="col-lg-12">
                  <h5 class="m-t-md">Creating triggers</h5>
                  <p>Trigger are what really schedule the jobs at given times.</p>
                  <p>They can be named and described.</p>
                  <p>Multiple triggers of different types can be configured for each job detail.</p>

                  <p class="m-t-lg">The <code>SimpleTriggerFactoryBean</code> allows you to define a repeat interval in milliseconds, and a repeat count (possibly indefinitely).</p>
                  <p>This trigger can also be used as a "fire once" trigger with a repeat count of zero.</p>
                  <p>(Note: the "fire once" trigger will be stored and not triggered again when the application restarts. See below for on-application-start trigger)</p>
                  <textarea class="code" data-cm-mode="text/x-java">
@Bean
public SimpleTriggerFactoryBean sampleJobCronTrigger(@Qualifier("sampleJobDetail") JobDetail sampleJobDetail) {
  SimpleTriggerFactoryBean factoryBean = new SimpleTriggerFactoryBean();
  factoryBean.setName("Cron trigger");
  factoryBean.setDescription("This is a cron trigger for demonstration purpose");
  factoryBean.setJobDetail(sampleJobDetail);
  factoryBean.setStartDelay((long) 30 * 1000);
  factoryBean.setRepeatInterval(1 * 60 * 60 * 1000);
  factoryBean.setRepeatCount(SimpleTrigger.REPEAT_INDEFINITELY);
  factoryBean.setMisfireInstruction(SimpleTrigger.MISFIRE_INSTRUCTION_RESCHEDULE_NEXT_WITH_REMAINING_COUNT);
  return factoryBean;
}
                  </textarea>

                  <p>The <code>CronTriggerFactoryBean</code> allows you to define cron expression to schedule the job.</p>
                  <textarea class="code" data-cm-mode="text/x-java">
@Bean
public CronTriggerFactoryBean sampleJobSimpleTrigger(@Qualifier("sampleJobDetail") JobDetail sampleJobDetail) {
  CronTriggerFactoryBean factoryBean = new CronTriggerFactoryBean();
  factoryBean.setName("Simple trigger");
  factoryBean.setDescription("This is a simple trigger for demonstration purpose");
  factoryBean.setJobDetail(sampleJobDetail);
  factoryBean.setStartDelay(10L);
  factoryBean.setCronExpression("0/30 * * * * ?");
  factoryBean.setMisfireInstruction(SimpleTrigger.MISFIRE_INSTRUCTION_IGNORE_MISFIRE_POLICY);
  return factoryBean;
}
                  </textarea>

                </div>
              </div>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Start a job dynamically</h4>
              <p>Use the blossom provided ScheduledJobService bean to immediately start a job.</p>

              <textarea class="code" data-cm-mode="text/x-java">
public void startJob(@Qualifier("sampleJobDetail") JobDetail sampleJobDetail) {
      scheduledJobService.execute(sampleJobDetail.getKey());
}
              </textarea>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Start a job on application start</h4>
              <p>Use a CommandLineRunner to execute some arbitrary code right after the ApplicationContext has been initialized.</p>
              <textarea class="code" data-cm-mode="text/x-java">
@Bean
public CommandLineRunner startJobOnStart(ScheduledJobService service,
                                  @Qualifier("sampleJabDetail") JobDetail sampleJobDetail) {
  return args -> {
    service.execute(sampleJobDetail.getKey());
  };
}
              </textarea>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="navy-line-light"></div>
          <h3>Adding custom entities</h3>
          <div class="row">
            <div class="col-lg-12">
              <h4 class="m-t-lg">Manually create an entity</h4>
                <p>Blossom provides an abstract class that helps you creating entities.</p>
                <p>To create a simple entity, create a <code>@Entity</code> annoted class that extends <code>AbstractEntity</code>: this class provides usually needed technical columns so you only need to care about the "usefull" data of your entity. </p>
                <p>The example below corresponds to a 6 columns table: id, name, creation_date, creation_user, modification_date, modification_user.</p>
                <textarea class="code" data-cm-mode="text/x-java">
 @Entity
public class ExampleEntity extend AbstractEntity{
 @Column(name = "name")
    private String nameExample;

   public String getNameExample() {
        return nameExample;
    }

    public void setNameExample(String name) {
        this.nameExample = name;
    }
}
                </textarea>
                <p>Then, you can implement the interface <code>CrudRepository</code> to manage your entity.</p>
                <p>To add an association representing a n-n relationship between two entities, create an <code>@Entity</code> annoted class that extends <code>AbstractAssociationEntity</code>, and manage it using the <code>AssociationRepository</code>.</p>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Using the generator </h4>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="navy-line-light"></div>
          <h3>Index and search entities</h3>
          <div class="row">
            <div class="col-lg-12">
              <h4 class="m-t-lg">Creating an indexation engine</h4>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Indexation lifecycle</h4>
            </div>
            <div class="col-lg-12">
              <h4 class="m-t-lg">Creating a search engine</h4>
            </div>
          </div>
        </div>

        <div class="col-lg-12">
          <div class="navy-line-light"></div>
          <h3>Deploy Blossom as a war</h3>
          <p>The Blossom Initializr provides the possibility to create and initialize a project with WAR packaging instead of JAR.</p>
          <p>In case you want to change an already created Blossom application from jar to war packaging, the Spring-Boot team provides <a target="_blank" href="https://docs.spring.io/spring-boot/docs/current/reference/html/howto-traditional-deployment.html">a handy documentation for that</a></p>
          <p>Don't forget this quote : </p>
          <blockquote>
            <p>Make jar, not war !</p>
            <small><strong><a href="https://twitter.com/starbuxman" target="_blank">Josh Long</a></strong></small>
          </blockquote>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  $(document).ready(function () {

    $("textarea.code").each(function (index, value) {
      CodeMirror.fromTextArea(value, {
        mode: $(this).data("cm-mode"),
        lineNumbers: true,
        matchBrackets: true,
        readOnly: true
      });
    });
  });
</script>

</@master.default>
