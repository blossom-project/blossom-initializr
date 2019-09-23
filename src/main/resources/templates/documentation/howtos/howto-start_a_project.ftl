<#import "/master.ftl" as master/>

<@master.feature title="Start a project">

<section class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line-light"></div>
      <h3>Log in a default Blossom application</h3>
      <p>As long as no account able to grant privileges is declared, Blossom comes with a default admin account with identifier <strong>system</strong> and with <strong>randomly generated password</strong>.</p>
      <p>This randomly generated password is shown in application logs at startup. For example:</p>
      <div class="row m-t-xs m-b-xs">
        <div class="col-lg-12">
          <textarea class="code">Enabling blossom 'system' account with password '72106bd341f00a83e1a0437ed0f8c5a4'</textarea>
        </div>
      </div>
      <p>Default account identifier and password can be configured with the following properties:</p>
      <div class="row m-t-xs m-b-xs">
        <div class="col-lg-12">
                <textarea class="code" data-cm-mode="properties">
blossom.security.default.account.identifier=custom_id
blossom.security.default.account.password=new_password</textarea>
        </div>
      </div>
      <p>Default account can be disabled using following property :</p>
      <div class="row m-t-xs m-b-xs">
        <div class="col-lg-12">
          <textarea class="code" data-cm-mode="properties">blossom.security.default.account.enabled=false</textarea>
        </div>
      </div>
      <p>Note that looking for a user with enough privileges to decide if the system account should be enabled will slow down startup somewhat. It is then recommended to explicitly disable system account when not needed.</p>
    </div>
  </div>
</section>
</@master.feature>
