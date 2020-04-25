class Authentication
  attr_reader :password
  def initialize(password)
    @password = password
  end

  def authenticate(candidate_password)
    return true if @password == candidate_password.password
    false
  end
end

class User
  attr_accessor :name, :bio, :age, :password
  def initialize(name, bio, age, password = Authentication.new)
    @name = name
    @bio = bio
    @age = age
    @password = password
  end

  def authenticate
    @password.authenticate
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end
