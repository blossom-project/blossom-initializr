<#import "/master.ftl" as master/>

<@master.feature title="Action Tokens">
<section class="container">
  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">ActionTokenService</h2>
      <p>Blossom provides a <code>ActionTokenService</code> which can be used to encrypt <code>String</code> tokens and decrypt them with an expiration date.</p>
      <p>These can be used for temporarily-valid tokens sent by e-mail as an example, but you can use it for any other purposes.</p>
      <p>An <code>ActionToken</code> contains : </p>
      <ul>
        <li>a user id (<code>Long</code>)</li>
        <li>an action (<code>String</code>)</li>
        <li>an expiration date (<code>String</code>)</li>
        <li>a map of additional parameters (<code>Map&lt;String,String&gt;</code></li>
      </ul>
    </div>
  </div>

    <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">StatelessSecretTokenService</h2>
      <p>Blossom provides a <code>com.blossomproject.core.crypto.token.StatelessSecretTokenService</code> which is used internally to encrypt the ActionToken into a <code>String</code>.</p>
      <p>It uses AES encryption with salt and a random generated value as secret.</p>
      <p>The secret can be parametrized (allowing tokens to be read even after a server reboot) using the following property.</p>
      <textarea class="code" data-cm-mode="properties">
blossom.crypto.secret=my-new-fixed-secret</textarea>
    </div>
  </div>
</section>
</@master.feature>
