<#import "/master.ftl" as master/>

<@master.feature title="Manage the menu">

<section class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line-light"></div>
      <h3>Manage the menu</h3>
      <div class="row">
        <div class="col-lg-12">
          <h4 class="m-t-lg">Add a new menu entry</h4>
          <p>To add a new menu entry, juste add a <code>MenuItem</code> bean to your <code>ApplicationContext</code>.</p>
          <p>You can inject in your <code>@Bean</code> annotated method the provided prototype-scoped <code>MenuItemBuilder</code> to simplifies it's creation.</p>

          <ul class="list-unstyled">
            <li><code>key()</code> is mandatory and represents the id of the menu.</li>
            <li><code>label()</code> is the i18n key or not static text</li>
            <li><code>icon()</code> is the css class that will be applied on the icon</li>
            <li><code>link()</code> is the relative url of the page the menu should lead to.</li>
            <li><code>privilege()</code> set the right the logged user should have to see the menu</li>
            <li><code>order()</code> allow to sort the menu entries. (values ranging from Integer.MIN_VALUE to Integer.MAX_VALUE)</li>
            <li><code>leaf()</code> indicates that the menu is a leaf in the hierarchy. If a non-leaf menu has no submenu, it'll not be displayed.</li>
          </ul>
          <div class="row m-t-xs m-b-xs">
            <div class="col-lg-12">
              <p>The snippet below shows an example <code>MenutItem</code> declaration.</p>
              <textarea class="code" data-cm-mode="text/x-java">
@Bean
public MenuItem exampleMenu(MenuItemBuilder builder) {
    return builder
            .key("exampleMenu")
            .label("menu.example.label.key")
            .icon("fa fa-photo")
            .link("/blossom")
            .build();
}</textarea>
            </div>
          </div>

        </div>
        <div class="col-lg-12">
          <h4 class="m-t-lg">Add a new menu subentry</h4>
          <p>To add a submenu entry, use the same process than to add a menu, but set the <code>parent()</code> property by injecting the parent <code>MenuItem</code> using the <code>@Qualifier</code> annotation.</p>
          <div class="row m-t-xs m-b-xs">
            <div class="col-lg-12">
              <p>The snippet below shows an example of a child <code>MenuItem</code> declaration.</p>
              <textarea class="code" data-cm-mode="text/x-java">
@Bean
public MenuItem exampleSubmenu(MenuItemBuilder builder, @Qualifier("exampleMenu") MenuItem testMenuItem) {
    return builder
              .key("exampleSubmenu")
              .label("menu.example.label.key.submenu")
              .link("/blossom")
              .icon("fa fa-picture")
              .parent(testMenuItem) // Setting the parent MenuItem
              .build();
}</textarea>
            </div>
          </div>
        </div>
        <div class="col-lg-12">
          <h4 class="m-t-lg">Open a specific menu on a page</h4>
          <p>Opening a specific menu on a back-office page is easy : add an <code>@OpenedMenu("menuKey")</code> annotation on the <code>@BlossomController</code> class containing the handler or <code>@RequestMapping</code> annotated method.</p>
        </div>
        <div class="col-lg-12">
          <h4 class="m-t-lg">Ordering menus</h4>
          <p>Menus and sub-menus can be ordered relatively to their siblings with the <code>order()</code> method on the MenuItemBuilder</code>.</p>
          <p>Possible values are the whole Integer values, from <code>Integer.MIN_VALUE</code> (highest precedence) to <code>Integer.MAX_VALUE</code> (lowest precedence)</p>
        </div>
      </div>
    </div>
  </div>
</section>
</@master.feature>
