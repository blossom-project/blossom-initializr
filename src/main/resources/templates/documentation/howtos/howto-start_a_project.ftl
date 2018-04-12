<#import "/master.ftl" as master/>

<@master.feature title="Start a project">

<section class="container documentation">
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
  </div>
</section>
</@master.feature>
