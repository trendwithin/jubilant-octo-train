class FivePeriodLeaderPolicy < ApplicationPolicy

  def index?
    return true if admin?
  end

  def new?
    return true if admin?
  end

  def show?
    false
  end

  def create?
    return true if admin?
  end

  def edit?
    return true if admin?
  end

  def create?
    return true if admin?
  end

  def update?
    return true if admin?
  end

  def destroy?
    return true if admin?
  end

  private

    def present?
      user.present?
    end

    def admin?
      user.admin?
    end
end
