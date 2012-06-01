class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    end
    if user.has_role? :artist
      can :manage, [Album, Video, User, Youtube, Song, Event, Article]
    end
  end
  
end