class User < ActiveRecord::Base
	has_many :scores
	has_many :achievements
	has_and_belongs_to_many :matches

	accepts_nested_attributes_for :scores

	attr_accessor :password

	before_save :encrypt_password

	validates_confirmation_of :password
	validates_presence_of :password, :on => :create
	validates_presence_of :email
	validates_uniqueness_of :email

	def self.authenticate(email,password)
		user = find_by_email(email)

		if user && user.password_hash = BCrypt::Engine.hash_secret(password , user.password_salt)
			user
		else
			nil
		end
	end

	def encrypt_password

		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password , password_salt)
		end
	end

	def self.getWpm(name)
		user = find_by_username(name)
		cnt = user.scores.length
		sum = 0
		user.scores.each{|x| sum = sum+x.wpm}
		(sum*1.0/cnt*1.0).round()
	end

	def self.getWl(name)
		user = find_by_username(name)
		cnt = user.matches.length
		sum = user.matches.select{|x| x.winner == user.username}.length
		(sum*1.0 / cnt*1.0 ) * 100.0
	end

	def self.getCourses(name)
		user = find_by_username(name)
		arr = user.matches.select(:category).uniq
	end

	def self.getPastWpms(name)
		user = find_by_username(name)
		string = ""
		user.scores.each{|x| string += "#{x.wpm.to_s} " }
		string
	end

end
