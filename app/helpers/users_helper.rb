module UsersHelper

  def date_joined(user)
    user.created_at.strftime("%b %e, %Y")
  end
end
