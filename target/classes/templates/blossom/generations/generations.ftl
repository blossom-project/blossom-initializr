<#import "/spring.ftl" as spring>
<#import "/blossom/master/master.ftl" as master>
<#import "/blossom/utils/table.ftl" as table>
<#import "/blossom/utils/privilege.ftl" as privilege>

<@master.default currentUser=currentUser>
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
  <div id="charts"></div>
</div>

<script>
  $(document).ready(function(){
    var updateCharts = function(){
      $.get("/blossom/generations/stats",function(data){
        console.log(data.aggregations.global.histogram);
        console.log(data.aggregations.global.packagingMode);
        console.log(data.aggregations.global.sourceLanguage);
        console.log(data.aggregations.global.dependencies);
      });
    };

    setInterval(updateCharts, 60000);
    updateCharts();
  });
</script>
</@master.default>
