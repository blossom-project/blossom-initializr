<#import "/master.ftl" as master/>

<@master.feature title="Indexation and Search">
<section class="container">
  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">Indexation and Search</h2>
      <p>Blossom provides utility interfaces and implementations to deal with indexation and search powered by Elasticsearch. (<code>IndexationEngine</code> and <code>SearchEngine</code>)</p>
      <p>The embedded elasticsearch version currently is <strong>2.4.6</strong></p>
      <p>By default, an embedded node will be started, and a client on that node provided.</p>
      <p>You can connect to a standalone Elasticsearch installation by setting the properties below in your application.properties file.</p>
      <textarea class="code" data-cm-mode="properties">
# ELASTICSEARCH (ElasticsearchProperties)
blossom.elasticsearch.cluster-name=elasticsearch # Elasticsearch cluster name.
blossom.elasticsearch.cluster-nodes= # Comma-separated list of cluster node addresses.
blossom.elasticsearch.properties.*= # Additional properties used as the client Settings.</textarea>
    </div>
  </div>
</section>
</@master.feature>
