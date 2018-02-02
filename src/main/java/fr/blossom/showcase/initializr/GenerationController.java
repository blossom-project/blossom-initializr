package fr.blossom.showcase.initializr;

import static org.springframework.http.MediaType.APPLICATION_JSON_VALUE;

import fr.blossom.ui.stereotype.BlossomController;
import org.elasticsearch.client.Client;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.histogram.DateHistogramInterval;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@BlossomController
@RequestMapping("/generations")
public class GenerationController {

  private final Client client;

  public GenerationController(Client client) {
    this.client = client;
  }

  @GetMapping
  public String generations() {
    return "blossom/generations/generations";
  }

  @GetMapping(value = "/stats", produces = APPLICATION_JSON_VALUE)
  @ResponseBody
  public String statistics() {
    return client.prepareSearch("generations")
      .setQuery(QueryBuilders.matchAllQuery())
      .setSize(0)
      .addAggregation(
        AggregationBuilders.global("global")
          .subAggregation(AggregationBuilders.dateHistogram("histogram").field("timestamp").interval(DateHistogramInterval.MINUTE))
          .subAggregation(AggregationBuilders.terms("packagingMode").field("packagingMode"))
          .subAggregation(AggregationBuilders.terms("sourceLanguage").field("sourceLanguage"))
          .subAggregation(AggregationBuilders.terms("dependencies").field("dependencies"))
      ).get().toString();
  }
}
