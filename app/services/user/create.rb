class User::Create
  def initialize(params)
    @params = params
  end

  def call
    user = User.new(@params)

    if user.save
      user.create_dweller(name: user.email)
      return user
    else
      raise("something was wrong")
    end
  end
end