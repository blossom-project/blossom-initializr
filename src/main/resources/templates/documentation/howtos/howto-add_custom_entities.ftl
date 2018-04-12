<#import "/master.ftl" as master/>

<@master.feature title="Add custom entities">

<section class="container documentation">
  <div class="row">
    <div class="col-lg-12">
      <div class="navy-line-light"></div>
      <h3>Adding custom entities</h3>
      <div class="row">
        <div class="col-lg-12">
          <h4 class="m-t-lg">Manually create an entity</h4>
          <p>Blossom provides an abstract class that helps you creating entities.</p>
          <p>To create a simple entity, create a <code>@Entity</code> annoted class that extends <code>AbstractEntity</code>: this class provides usually needed technical columns so you only need to care about the "usefull" data of your entity. </p>
          <p>The example below corresponds to a 6 columns table: id, name, creation_date, creation_user, modification_date, modification_user.</p>
          <textarea class="code" data-cm-mode="text/x-java">
 @Entity
public class ExampleEntity extend AbstractEntity{
 @Column(name = "name")
    private String nameExample;

   public String getNameExample() {
        return nameExample;
    }

    public void setNameExample(String name) {
        this.nameExample = name;
    }
}
                </textarea>
          <p>Then, you can implement the interface <code>CrudRepository</code> to manage your entity.</p>
          <p>To add an association representing a n-n relationship between two entities, create an <code>@Entity</code> annoted class that extends <code>AbstractAssociationEntity</code>, and manage it using the <code>AssociationRepository</code>.</p>
        </div>
        <div class="col-lg-12">
          <h4 class="m-t-lg">Using the generator </h4>
        </div>
      </div>
    </div>
  </div>
</section>
</@master.feature>
