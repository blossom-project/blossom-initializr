<#import "/master.ftl" as master/>

<@master.feature title="Caching" javadocLink="https://www.javadoc.io/doc/com.blossom-project/blossom-core-cache">
<section class="container">

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">Cache Abstraction</h2>
      <p>Blossom uses the Spring cache abstraction for it's internal usage.</p>
      <p>Documentation can be found <a href="https://docs.spring.io/spring-boot/docs/2.0.1.RELEASE/reference/html/boot-features-caching.html" target="_blank">here</a></p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">Caffeine</h2>
      <p>Blossom uses <a href="https://github.com/ben-manes/caffeine" target="_blank">Caffeine</a> as its default cache implementation.</p>
      <p>Documentation can be found <a href="https://github.com/ben-manes/caffeine/wiki" target="_blank">here</a></p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">BlossomCache</h2>
      <p><code>BlossomCache</code> extends the Spring-provided <code>CaffeineCache</code> and adds the possibility to disable the cache at runtime, using the <code>cache.setEnabled(false)</code> method.</p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">CacheConfig</h2>
      <p>Blossom cache configurations, represented by the <code>com.blossomproject.core.cache.CacheConfig</code> interface, are registered as Spring <code>@Bean</code> in the application context.</p>
      <p>You can provide configuration for the caches using the <code>com.blossomproject.core.cache.CacheConfig.CacheConfigBuilder</code>.</p>
      <p>This builder allows you to define the following properties : </p>
      <ul>
        <li>the cache name (<code>String</code>)</li>
        <li>the cache <a href="http://static.javadoc.io/com.github.ben-manes.caffeine/caffeine/2.5.0/com/github/benmanes/caffeine/cache/CaffeineSpec.html" target="_blank">Caffeine specification</a> to specify the Cache behavior(<code>String</code>)</li>
        <li>linked caches names (multiple <code>String</code>)</li>
        <li>enabled or disabled by default(<code>boolean</code></li>
      </ul>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">Default CacheConfig</h2>
      <p>Blossom provides a default fallback CacheConfig which is apply on each cache which doesn't possess a specific CacheConfig.</p>
      <p>You can override it by adding a <code>CacheConfig</code> to your application context, with the bean qualifier set as <code>defaultCacheConfig</code></p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">BlossomCacheManager</h2>
      <p>BlossomCacheManager extends the <code>AbstractTransactionSupportingCacheManager</code> provided by Spring and override a few methods to provide additional behaviour.</p>
      <p>All ApplicationContext registered beans of type <code>com.blossomproject.core.cache.CacheConfig</code> are all injected using a <code>PluginRegistry<CacheConfig, String> registry</code>.</p>
      <p>When required to create a Cache with it's name, it'll find a CacheConfig (or use the default one) and instantiate a new <code>BlossomCache</code>.</p>
      <p></p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">BlossomCacheResolver</h2>
      <p>Blossom provides a default implementation of the interface <code>org.springframework.cache.interceptor.CacheResolver</code></p>
      <p>If no cache name is defined on your <code>@Cacheable</code>, <code>@CacheEvict</code>, <code>@CachePut</code> annotations, the annotated method's class canonical name will be used.</p>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-12">
      <h2 class="m-t-lg">Cache usage</h2>
      <p>Only DAOs contains caching at this moment.</p>
      <p>DAO extending <code>com.blossomproject.core.common.dao.GenericReadOnlyDaoImpl</code> or <code>com.blossomproject.core.common.dao.GenericCrudDaoImpl</code> benefits from generic caching for their methods.</p>
      <p>Due to the trickyness of cache-invalidation, the following harsh rules are used : </p>
      <ul>
        <li>
          The cache is fully cleaned up
        <ul>
          <li>when one entity is created using <code>ENTITY create(ENTITY toCreate);</code></li>
          <li>when many entities are created using <code>List&lt;ENTITY&gt; create(Collection&lt;ENTITY&gt; toCreates);</code></li>
          <li>when a entity is deleted using <code>void delete(ENTITY toDelete);</code></li>
          <li>when an entity is updated using <code>ENTITY update(Long id, ENTITY toUpdate);</code></li>
          <li>when many entities are updated using <code>List&lt;ENTITY&gt; update(Map&lt;Long, ENTITY&gt; toUpdates);</code></li>
        </ul>
      </li>
      <li>
        A cache key is added
        <ul>
          <li>when an entity is read by its id using <code>ENTITY getOne(long id);</code>. Cache key is the id as string.</li>
          <li>when a page of entities is read using <code>Page&lt;ENTITY&gt; getAll(Pageable pageable);</code>. Cache key is computed using argument.</li>
          <li>when a list of entities is read using <code>List&lt;ENTITY&gt; getAll(List&lt;Long&gt; ids);</code>. Cache key is computed using argument.</li>
          <li>when all entities are read using <code>List&lt;ENTITY&gt; getAll();</code>. Cache key is 'all'.</li>
        </ul>
      </li>
      </ul>
      <p>Additional rules apply when an entry is evicted, using a custom <code>RemovalListener</code> from Caffeine : if the removed element is an AbstractEntity, all other cache elements which are not AbstractEntities are evicted too.</p>
      <p>This ensures that evicting an entity will remove all cached Page or List possibly containing this entity.</p>
    </div>
  </div>

</section>
</@master.feature>
