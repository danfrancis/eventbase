require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { description: @event.description, event_end_date: @event.event_end_date, event_start_date: @event.event_start_date, name: @event.name, organizer: @event.organizer, price: @event.price, reg_end_date: @event.reg_end_date, reg_start_date: @event.reg_start_date, reg_url: @event.reg_url, url: @event.url, venue_id: @event.venue_id }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    put :update, id: @event, event: { description: @event.description, event_end_date: @event.event_end_date, event_start_date: @event.event_start_date, name: @event.name, organizer: @event.organizer, price: @event.price, reg_end_date: @event.reg_end_date, reg_start_date: @event.reg_start_date, reg_url: @event.reg_url, url: @event.url, venue_id: @event.venue_id }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
