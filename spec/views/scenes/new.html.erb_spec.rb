require 'rails_helper'

RSpec.describe "scenes/new", type: :view do
  before(:each) do
    assign(:scene, Scene.new())
  end

  it "renders new scene form" do
    render

    assert_select "form[action=?][method=?]", scenes_path, "post" do
    end
  end
end
