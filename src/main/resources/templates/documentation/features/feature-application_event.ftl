<#import "/master.ftl" as master/>

<@master.feature title="Application Events">
<section class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line-light"></div>
      <h2 class="m-t-lg">Events</h2>
      <div class="row">
        <div class="col-lg-12">
          <p>Services extending
            <code>com.blossomproject.core.common.service.GenericCrudServiceImpl</code> or <code>com.blossomproject.core.common.service.GenericAssociationServiceImpl</code>
            benefit from automatic event broadcasting.</p>
          <p>Theses event types depends on the method called, and contains informations about the
            DTO being created, modified, deleted, associated, etc. </p>
          <p>Some events are sent before and after the operation.</p>
          <div class="b-r-xl p-xs bg-warning m-l-md m-r-md m-t-md m-b-md">
                      <span class="text-white">
                        <i class="fa fa-warning"></i> Be careful when overriding existing generic method on theses classes, as if you don't call super, application event broadcasting will be lost.<br/>
                        Use the constructor provided <code>ApplicationEventPublisher</code> locally to send your own events.
                      </span>
          </div>
          <p>The event all extend <code>com.blossomproject.core.common.event.Event</code> and
            blossom provides predefined event for handling with DTO lifecycle.</p>
          <p>Application specific events can be created and handled following. <a
            href="https://docs.spring.io/spring-framework/docs/current/spring-framework-reference/core.html#context-functionality-events"
            target="_blank">See more on Spring documentation here</a>.</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <h3 class="m-t-md">CreatedEvent</h3>
          <p>This event is sent right <strong>after</strong> an <code>AbstractDTO</code> has been
            created.</p>
          <p>It contains the newly created DTO which can be accessed using the <code>getDTO()</code>
            method.</p>
        </div>

        <div class="col-lg-12">
          <h3 class="m-t-md">UpdatedEvent</h3>
          <p>This event is sent right <strong>after</strong> an <code>AbstractDTO</code> has been
            updated.</p>
          <p>It contains the updated DTO which can be accessed using the <code>getDTO()</code>
            method.</p>
        </div>

        <div class="col-lg-12">
          <h3 class="m-t-md">BeforeDeletedEvent</h3>
          <p>This event is sent right <strong>before</strong> an <code>AbstractDTO</code> has been
            deleted.</p>
          <p>It contains the soon-to-be deleted DTO which can be accessed using the
            <code>getDTO()</code> method.</p>
        </div>

        <div class="col-lg-12">
          <h3 class="m-t-md">DeletedEvent</h3>
          <p>This event is sent right <strong>after</strong> an <code>AbstractDTO</code> has been
            deleted.</p>
          <p>It contains the deleted DTO which can be accessed using the <code>getDTO()</code>
            method.</p>
        </div>

        <div class="col-lg-12">
          <h3 class="m-t-md">AssociatedEvent</h3>
          <p>This event is sent right <strong>after</strong> an <code>AbstractAssociationDTO</code>
            between two <code>AbstractDTO</code>s has been created.</p>
          <p>It contains the deleted DTO which can be accessed using the <code>getDTO()</code>
            method.</p>
        </div>

        <div class="col-lg-12">
          <h3 class="m-t-md">BeforeDissociatedEvent</h3>
          <p>This event is sent right <strong>before</strong> an <code>AbstractAssociationDTO</code>
            between two <code>AbstractDTO</code>s has been deleted.</p>
          <p>It contains the soon-to-be DTO which can be accessed using the <code>getDTO()</code>
            method.</p>
        </div>

        <div class="col-lg-12">
          <h3 class="m-t-md">AfterDissociatedEvent</h3>
          <p>This event is sent right <strong>after</strong> an <code>AbstractAssociationDTO</code>
            between two <code>AbstractDTO</code>s has been deleted.</p>
          <p>It contains the DTO which can be accessed using the <code>getDTO()</code> method.</p>
        </div>
      </div>
    </div>

    <div class="col-lg-12">
      <h2 class="m-t-lg">Handling</h2>
      <div class="row">
        <div class="col-lg-12">
          <p>Blossom use generic event handling for dealing with the DTO lifecycle.</p>
          <p>An example of usage is the update of Elasticsearch indices during creation/update/deletion of entities. Events are processed in the <code>IndexationEventListeners</code> class.</p>
        </div>
      </div>
    </div>
  </div>
</section>
</@master.feature>
