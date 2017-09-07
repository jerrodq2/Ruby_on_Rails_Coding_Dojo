class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(:category)
    # This is an example of not only pulling all of the data of one table, but also a table it is linked to. In this example, the product table has a column for category_id, basically a foreign key, so they are linked. By putting a .includes(:other_table), after the first_table.all, I can also pull the second table, so since every product is under a category, doing this, I can access not only the product, but the category associated with a specific row as well. See the below puts to get a more detailed look.

    # An example in the console, would be "variable.find(6).category", I put the above query into a variable, so I could just do "variable.find(6)", to the product with an id of 6. Then i'll add the ".category" to instead show the category associated with or linked to that row. Since the that product has the category_id of 1, it pulls that id row from the category table. I could even go a step further with "variable.find(6).category.name", to grab just the name of the associated category.

    # puts "All products here"+"*"*100
    # puts @products
    # puts json: @products
    # puts "All products end here"+"*"*100
    # The above puts show that when you query a table in the db, you get an array of objects returned to you. In the terminal it each row looks like this: #<Product:0x007f999bd56c90>, but with the json: which shows it's plain form, this is what 2 rows look like:
    # [#<Product id: 1, name: "Subin", description: "Chuck Norris can binary search unsorted data.", pricing: 96.38, created_at: "2016-12-07 18:26:33", updated_at: "2016-12-07 18:26:33", category_id: nil>, #<Product id: 6, name: "Sub-Ex", description: "Chuck Norris can spawn threads that complete befor...", pricing: 16.09, created_at: "2016-12-07 20:24:40", updated_at: "2016-12-07 20:24:40", category_id: 1>]
    # so in order to access the name for the first product, i would do something like this: @products[0].name, first accessing the first spot in the array with "[0]", then using a key to access that value, since it's an object with ".name", the below puts are just for further examples
    puts @products[0].name
    puts @products[3].category

  end

  def show
    @product = Product.includes(:category).find(params[:id])
    @comments = Product.find(params[:id]).comments
    # Notice in this example how you pull/access different tables. A rundown, is that every product has a category, and every product can have comments, so the product table has the foreign key for a category, and every comment has a forign key for a product, like such: category -> product -> comment.
    # So the above examples show that in order to access the table above you, or if the table you are querying has the foreing key, you use the .includes(:table), before the find. But if you want to include the table that is below it, meaning how comments has the foreign key, then you just put ".table_name" after the find
  end

  def new
    @cats = Category.all
  end

  def edit
    @product = Product.includes(:category).find(params[:id])
    @cat = Category.all
    puts "See product edit info here" +"!"*100
    puts json: @product
  end

  def create
    # puts "Example of strong params here" + "!"*100
    # puts product_params
    product = Category.find(params[:category]).products.create(product_params)
    # The strong param basically just passes it over from the params, still as an associative array: {"name"=>"Lightbulb", "description"=>"used for lighting", "pricing"=>"5.00"}

    # And a similar format to what we would use in the rails console, so we can just plug it straight into the create(), ex of a create statement in the rails console: User.create(:first_name => 'Jamie')



    # puts "create params here" + "!"*100
    # puts params
    if product.errors.any?
      flash[:errors] = product.errors.full_messages
      redirect_to '/products/new'
    else
      redirect_to '/'
    end
  end

  def update
    category = Category.find(product_params[:category_id])

    # The below if is because, if If the above query has a working category_id, it will return a category row, but if not, then it would most likely error, but just in case it is merely blank or nil, I check before I go any further
    if category
      product = Product.update(params[:id], product_params)
      # Notice how I always put either an update or create into a variable, so I can use the below product.errors.any? to check if there was an issue and submit a flash statement to the view
    else
      flash[:errors] = 'Category not found'
      redirect_to "/products/#{params[:id]}/edit"
    end

    if product.errors.any?
      flash[:errors] = product.errors.full_messages
      # Notice how I access the error messages and plug it into the flash statement, the full message could look like this: ["Name can't be blank", "Description can't be blank", "Pricing can't be blank"]
      redirect_to "/products/#{params[:id]}/edit"
    else
      redirect_to '/'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/'
  end

  def comments
    @comments = Comment.all.includes(:product)
    # Notice that here, the .includes is after the query (all in this case), but with .find, I had to put the .includes before it, not sure if necessary where you put it
  end

  def comment_create
    Product.find(params[:id]).comments.create(comment_params)
    # see the params below, basically I grab the id that I sent over in a hidden input to know which product to add the comment too, then I create the comment with the strong paramters I created below (comment_params).
    redirect_to "/products/#{params[:id]}"

    # the puts below are so I can see what is actually sent over
    puts "See here"+"!"*100
    puts params
    puts comment_params
    # This is what is sent over in the params: {"authenticity_token"=>"PN1ZZ+kXSZbtTCrtkDZh72WzurC0XFDNSSXb6KYlZ60=", "id"=>"6", "comment"=>{"comment"=>"indeed he can"}, "controller"=>"products", "action"=>"comment_create"}
  end




  private

  def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
    # If you look at the create/update methods, you'll notice that both use this strong params, but the :category_id isn't used in the create method, it could be but it accessed the category_id another way. So, just because something is permitted doesn't mean it will error out if it isn't there
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
  # See the comment_create method for the full params sent over, but this is the part that is for this comment_params: "comment"=>{"comment"=>"indeed he can"}

end
