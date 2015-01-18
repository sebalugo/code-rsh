class Category < ActiveRecord::Base
	has_many :courses
	accepts_nested_attributes_for :courses
end




#rails g migration add_match_id_to_user match_id:integer
#rake db:migrate:up VERSION=20090408054532