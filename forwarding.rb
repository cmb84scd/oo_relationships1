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
  def initialize(name, bio, age)
    @name = name
    @bio = bio
    @age = age
    @password = Authentication.new
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
