require 'rails_helper'

RSpec.describe "univers/index", type: :view do
  before(:each) do
    assign(:univers, [
      Univer.create!(),
      Univer.create!()
    ])
  end

  it "renders a list of univers" do
    render
  end
end
