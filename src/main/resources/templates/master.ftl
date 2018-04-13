
<#macro default>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Blossom</title>

  <link href="/css/bootstrap.min.css" rel="stylesheet">
  <link href="/css/style.css" rel="stylesheet">
  <link href="/font-awesome/css/font-awesome.css" rel="stylesheet">
  <link href="/font-mfizz/font-mfizz.css" rel="stylesheet">
  <link href="/css/plugins/codemirror/codemirror.css" rel="stylesheet">
  <link href="/css/plugins/codemirror/ambiance.css" rel="stylesheet">

  <script src="/js/jquery-3.1.1.min.js"></script>
  <script src="/js/bootstrap.min.js"></script>
</head>

<body class="landing-page no-skin-config">

  <nav class="navbar navbar-default" role="navigation">
      <div class="container white-bg">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a href="#">
            <img src="/img/blossom/blossom-small.svg"/>
          </a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right text-primary">
            <li><a class="page-scroll" href="/documentation">Documentation</a></li>
            <li><a class="page-scroll" href="/initializr">Initializr</a></li>
            <li><a class="page-scroll" href="https://github.com/blossom-project/blossom/" target="_blank">Source code</a></li>
          </ul>
        </div>
      </div>
    </nav>

  <#nested/>

  <script src="/js/plugins/codemirror/codemirror.js"></script>
  <script src="/js/plugins/codemirror/mode/properties/properties.js"></script>
  <script src="/js/plugins/codemirror/mode/yaml/yaml.js"></script>
  <script src="/js/plugins/codemirror/mode/clike/clike.js"></script>

</body>
</html>
</#macro>

<#macro feature title javadocLink="">
  <@default>
  <style>
    .CodeMirror{
      margin-top:10px;
      margin-bottom:10px;
    }
  </style>

  <section id="headline" class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h1>
          <a class="btn btn-primary btn-circle pull-left" href="/documentation" type="button" style="padding: 4px 0">
            <i class="fa fa-arrow-left"></i>
          </a>
          <span>${title}</span>
          <#if javadocLink??>
            <a class="btn btn-primary btn-circle pull-right" href="${javadocLink}" type="button" target="_blank" style="padding: 4px 0;padding-left:4px;">
              <i class="fa icon-java"></i>
            </a>
          </#if>
        </h1>
        <div class="navy-line"></div>
      </div>
    </div>
  </section>

  <#nested/>

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
  </@default>
</#macro>
