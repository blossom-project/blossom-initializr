<#import "/spring.ftl" as spring>
<#import "/blossom/master/master.ftl" as master>
<#import "/blossom/utils/table.ftl" as table>
<#import "/blossom/utils/privilege.ftl" as privilege>

<@master.default currentUser=currentUser>
<link href="/font-mfizz/font-mfizz.css" rel="stylesheet">
<link href="/blossom/public/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet">

<div class="row wrapper border-bottom white-bg page-heading">
  <div class="col-sm-8">
    <h2><i class="fa fa-bar-chart"></i> <@spring.message "generations.title"/></h2>
    <ol class="breadcrumb">
      <li>
        <a href="/blossom"><@spring.message "menu.home"/></a>
      </li>
      <li class="active">
        <strong><@spring.message "generations.title"/></strong>
      </li>
    </ol>
  </div>
  <div class="col-sm-4">
    <div class="title-action">
    </div>
  </div>
</div>

<div class="wrapper wrapper-content">

  <div class="row">
    <div class="col-lg-3">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>Favorites dependencies</h5>
        </div>
        <div class="ibox-content p-sm">
          <ul id="top_dependencies" class="list-group clear-list">
          </ul>
        </div>
      </div>
    </div>
    <div class="col-lg-9">
      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>Formats and languages</h5>
        </div>
        <div class="ibox-content p-sm">
          <div class="row">
            <div class="col-lg-4">
              <div class="widget style1 navy-bg">
                <div class="row vertical-align">
                  <div class="col-xs-6">
                    <i class="fa icon-java-bold fa-3x"></i> <br/>
                    <span class="small">(java)</span>
                  </div>
                  <div class="col-xs-6 text-right">
                    <h2 class="font-bold" id="sourceLanguage_JAVA">0</h2>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="widget style1 navy-bg">
                <div class="row vertical-align">
                  <div class="col-xs-6">
                <span><i class="fa icon-java-bold fa-3x"></i><i
                  class="fa icon-script fa-3x"></i></span><br/>
                    <span class="small">(java+kotlin)</span>
                  </div>
                  <div class="col-xs-6 text-right">
                    <h2 class="font-bold" id="sourceLanguage_JAVA_KOTLIN">0</h2>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="widget style1 navy-bg">
                <div class="row vertical-align">
                  <div class="col-xs-3">
                    <i class="fa icon-script fa-3x"></i><br/>
                    <span class="small">(kotlin)</span>
                  </div>
                  <div class="col-xs-9 text-right">
                    <h2 class="font-bold" id="sourceLanguage_KOTLIN">0</h2>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="widget style1 red-bg">
                <div class="row vertical-align">
                  <div class="col-xs-3">
                    <i class="fa fa-archive fa-3x"></i><br/>
                    <span class="small">(jar)</span>
                  </div>
                  <div class="col-xs-9 text-right">
                    <h2 class="font-bold" id="packagingMode_JAR">0</h2>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="widget style1 red-bg">
                <div class="row vertical-align">
                  <div class="col-xs-3">
                    <i class="fa icon-tomcat fa-3x"></i><br/>
                    <span class="small">(war)</span>
                  </div>
                  <div class="col-xs-9 text-right">
                    <h2 class="font-bold" id="packagingMode_WAR">0</h2>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">

      <div class="ibox float-e-margins">
        <div class="ibox-title">
          <h5>Generations by day</h5>
        </div>
        <div class="ibox-content p-sm">
          <div id="generation-histogram"></div>
          </ul>
        </div>
      </div>
    </div>
  </div>

</div>

<!-- Morris -->
<script src="/blossom/public/js/plugins/morris/raphael-2.1.0.min.js"></script>
<script src="/blossom/public/js/plugins/morris/morris.js"></script>

<script>
  $(document).ready(function () {
    var barChart = null;
    var updateCharts = function () {
      $.get("/blossom/generations/stats", function (data) {
        updateWidgetFromAggregation("packagingMode", data.aggregations.global.packagingMode);
        updateWidgetFromAggregation("sourceLanguage", data.aggregations.global.sourceLanguage);
        updateTopDependencies(data.aggregations.global.dependencies);
        updateBarChart(data.aggregations.global.histogram);
      });
    };

    var updateWidgetFromAggregation = function (prefix, result) {
      $.each(result.buckets, function (index, bucket) {
        $("#" + prefix + "_" + bucket.key).text(bucket.doc_count);
      });
    };

    var updateTopDependencies = function (result) {
      var html = "";
      $.each(result.buckets, function (index, bucket) {
        html += '<li class="list-group-item fist-item"><span class="pull-right">' + bucket.doc_count
          + '</span><span class="label label-primary">' + index + '</span> ' + bucket.key + '</li>';
      });

      $("#top_dependencies").html(html);
    };

    var updateBarChart = function (result) {
      if (barChart) {
        barChart.setData(result.buckets);
      } else {
        barChart = Morris.Bar({
          element: 'generation-histogram',
          data: result.buckets,
          xkey: 'key_as_string',
          ykeys: ['doc_count'],
          labels: ['Generations'],
          hideHover: 'auto',
          resize: true,
          barColors: ['#1ab394'],
        });
      }
    };

    setInterval(updateCharts, 60000);
    updateCharts();
  });
</script>
</@master.default>
