class EventsController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index,:show]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :leave_event]

  def index
    @events = Event.all.order(created_at: :desc)
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  def attend_event
    event = Event.find(params[:event_id])
    user_event = event.user_events.create(user_id: current_user.id, booking_date: Time.now)

    if user_event
      redirect_to event_path(event), notice: 'User was successfully registered.'
    else
      redirect_to event_path(event), notice: 'User was not successfully registered.'
    end
  end

  def leave_event
    current_user.user_events.find_by(event_id: @event.id).destroy
    redirect_to event_path(@event), notice: 'User was successfully unregistered.'
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:user_id, :title, :event_type, :start_time, :end_time, :description, :cost)
    end
end
