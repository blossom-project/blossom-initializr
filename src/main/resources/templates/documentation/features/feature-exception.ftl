<#import "/master.ftl" as master/>

<@master.feature title="Exception handling">
<section class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line-light"></div>
      <h2>ErrorControllerAdvice</h2>
      <p>Blossom provides a generic <code>ErrorControllerAdvice</code> handling various exceptions (<code>Throwable</code>,<code>HttpRequestMethodNotSupportedException</code>,<code>NoHandlerFoundException</code>,<code>NoSuchElementException</code>,<code>AccessDeniedException</code>) happening inside a <code>@BlossomController</code>.</p>
      <p>For front-office errors and unmanaged exceptions, Blossom provides a <code>BlossomErrorViewResolver</code> which choose between multiple error view locations :</p>
      <ul>
        <li>If the current path starts with <code>/blossom</code>, search the view in <code>src/resources/blossom/error/blossom/</code></li>
        <li>Else search the error view in <code>src/resources/blossom/error/</code></li>
        <li>If a specific template is not found, search <code>src/resources/error/blossom/default.ftl</code> or <code>src/resources/error/default.ftl</code></li>
      </ul>
    </div>
  </div>
</section>
</@master.feature>
