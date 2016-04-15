require 'rails_helper'

RSpec.describe "univers/show", type: :view do
  before(:each) do
    @univer = assign(:univer, Univer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
