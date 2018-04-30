<#import "master.ftl" as master/>

<@master.default>
<section id="headline" class="container">
  <div class="row">
    <div class="col-lg-12 text-center">
      <h1>Blossom</h1>
      <p>Blossom is a Java framework based on Spring-Boot which enables you to realize your projects quickly and smoothly.</p>
      <p>It contains a responsive back-office which includes several modules and tools made to ease and speed up your development process.</p>
    </div>
  </div>
</section>

<section id="quickstart" class="container documentation">
  <div class="row">
    <div class="col-lg-12 ">
      <div class="navy-line"></div>
      <h2 class="text-center m-b-xl">Quick start</h2>
      <div class="row text-center">
        <div class="col-sm-4">
            <h3><i class="fa fa-hand-o-up"></i> Generate your project </h3>
            <p><a href="/initializr" target="_blank">The Initializr</a> will generate for you a complete maven project. Choose your modules, set your preference and hit "Generate".</p>
        </div>
        <div class="col-sm-4">
          <h3><i class="fa fa-play"></i> Open and run your project</h3>
          <p>Unzip the generated project and import it in your favorite IDE. Run the main <code>Application</code> class.</p>
        </div>
        <div class="col-md-4">
          <h3><i class="fa fa-rocket"></i> Enjoy your new back-office</h3>
          <p>Open your favorite web browser on <a href="http://localhost:8080/blossom">http://localhost:8080/blossom</a> and log in with system/system</p>
        </div>
      </div>
    </div>
  </div>
</section>

<section id="presentation" class="container documentation">
  <div class="row">
    <div class="col-lg-12 ">
      <div class="navy-line"></div>
      <h2 class="text-center m-b-xl">Presentation</h2>
    </div>
  </div>
  <div class="row">
    <div class="col-xs-12 embed-responsive embed-responsive-4by3">
      <iframe src="//slides.com/mgargadennec/blossom/embed" scrolling="no" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
    </div>
  </div>
</section>

</@master.default>
