require 'rails_helper'

RSpec.describe "scenes/index", type: :view do
  before(:each) do
    assign(:scenes, [
      Scene.create!(),
      Scene.create!()
    ])
  end

  it "renders a list of scenes" do
    render
  end
end
