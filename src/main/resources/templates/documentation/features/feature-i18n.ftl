<#import "/master.ftl" as master/>

<@master.feature title="Internationalization">
<section class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line-light"></div>
      <h3>I18n</h3>
      <p>Blossom's back-office interface natively considers two languages: english and french. If you want to add other languages to the interface, you need to create a <code>languages.properties</code> file in your resources folder containing the following:</p>
      <textarea class="code" data-cm-mode="properties">blossom.languages=en,fr  (followed by all the locale language codes you want to add)</textarea>
      <p>To include you own message ressources, simply add them to your resources/messages folder.</p>
      <p>You can use the <code>Set&lt;Local&gt;</code> Bean declared in <code>CommonAutoConfiguration</code> in your controllers to internationalise your application.</p>
    </div>
  </div>
</section>
</@master.feature>
