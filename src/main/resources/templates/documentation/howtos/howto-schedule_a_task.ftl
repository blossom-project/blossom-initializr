<#import "/master.ftl" as master/>

<@master.feature title="Schedule a task">

<section class="container documentation">
  <div class="row">
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
  </div>
</section>
</@master.feature>
