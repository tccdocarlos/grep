class User::Create
  def initialize(params)
    @params = params
  end

  def call
    user = User.new(@params)

    if user.save
      user.create_dweller(name: user.email)
    else
      raise
    end
  end
end