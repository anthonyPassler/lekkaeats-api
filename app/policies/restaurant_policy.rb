class RestaurantPolicy < ApplicationPolicy
  def show?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end
end
