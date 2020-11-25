class Authentication
  def initialize(password)
    @password = password
  end

  def authenticate(candidate_password)
    return true if candidate_password == @password
    false
  end
end

class User
  attr_reader :name, :bio, :age, :password, :auth
  def initialize(name, bio, age, password)
    @name = name
    @bio = bio
    @age = age
    @password = password
    @auth = Authentication.new(password)
  end

  def authenticate(candidate_password)
    @auth.authenticate(candidate_password)
  end

  def profile
    "#{@name}, born in #{birth_year}: #{@bio}"
  end

  private

  def birth_year
    Time.new.year - @age
  end
end
