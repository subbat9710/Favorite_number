require 'sinatra'

get '/' do
	erb :get_name
end
 
post '/name' do
	name = params[:user_name]
    erb :get_location, :locals => {:name => name}
end

post '/location' do
    location = params[:user_location]
    name = params[:user_name]
    erb :get_age, :locals => {:name => name, :location => location}
end

post '/age' do
   age = params[:user_age]
   name = params[:user_name]
   location = params[:user_location]
   erb :get_favorite, :locals => {:name => name, :location => location, :age => age}
end

post '/favorites' do
	num1 = params[:num1]
	num2 = params[:num2]
	num3 = params[:num3]
	age = params[:user_age]
	location = params[:user_location]
	name = params[:user_name]

    sum_nums = num1.to_i + num2.to_i + num3.to_i
    if sum_nums > age.to_i
    	age_compare = "Your favorite nums added together is greater then your age"
    elsif sum_nums < age.to_i
    	age_compare = "Your favorite nums added together is less than your age"
    else
    	age_compare = "Your favorite nums added together is equal to ypur age"
end
    erb :showinfo, :locals => {:name => name, 
    	                        :location => location,
    	                        :age => age, 
    	                        :num1 => num1, 
    	                        :num2 => num2, 
    	                        :num3 => num3,
    	                        :sum_nums => sum_nums,
    	                        :age_compare => age_compare}    	                        
end