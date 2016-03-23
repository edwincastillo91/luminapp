require 'rails_helper'

RSpec.describe "scenes/show", type: :view do
  before(:each) do
    @scene = assign(:scene, Scene.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
