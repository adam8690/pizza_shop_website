require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#INDEX - READ - all 
get '/pizzas' do 
@pizzas = Pizza.all
  erb(:index)
end

#NEW - CREATE - get form
get '/pizzas/new' do 
  erb(:new)
end
#this specific 'new' route has to come before the :id route because sinatra will hit the first item in the file that matches and /new also matches :id.


#SHOW - READ - find by id
get '/pizzas/:id' do 
  @pizza = Pizza.find( params[:id] )
erb(:show)
end


#CREATE - CREATE - submit form
post '/pizzas' do
  @pizza = Pizza.new(params)
  @pizza.save
  erb(:create)
end

#EDIT - UPDATE - get update form
get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id] )
  erb(:update)
end

#UPDATE - UPDATE - submit form
post '/pizzas/:id' do 
    @pizza = Pizza.new(params)
    @pizza.update
    erb(:updated)
end


#DELETE - DELETE 
post '/pizzas/:id/delete' do
@pizza = Pizza.find( params[:id] )
@pizza.delete
redirect to '/pizzas'
end