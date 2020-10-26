class EntryPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def show?
    true
  end

  def destroy?
    true
  end
end
