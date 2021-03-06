require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      :name => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input#place_name[name=?]", "place[name]"

      assert_select "input#place_latitude[name=?]", "place[latitude]"

      assert_select "input#place_longitude[name=?]", "place[longitude]"
    end
  end
end
