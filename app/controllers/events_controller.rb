class EventsController < ApplicationController
  load_and_authorize_resource :only => [:home, :new, :create, :edit, :update, :destroy]
  def home 
    @user = current_user
    @events = @user.events
  end
  def index
    @user = User.find(params[:user_id])
    @events = @user.events
  end

  def show
    @event = Event.find(params[:id])
    @artist = User.find(@event.user_id)

    @commentable = @event
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  def new
    @user = User.find(params[:user_id])
    @event = @user.events.build
  end
  
  def create
    @user = User.find(params[:user_id])
    @event = @user.events.build(params[:event])
    if @event.save
      flash[:notice] = "Successfully created event."
      redirect_to events_dashboard_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @event = Event.find(params[:id])
    @user = User.find(@event.user_id)
  end
  
  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = "Successfully updated event."
      redirect_to events_dashboard_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:notice] = "Successfully destroyed event."
    redirect_to events_dashboard_url
  end
end
