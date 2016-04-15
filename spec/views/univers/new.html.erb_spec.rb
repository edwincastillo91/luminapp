require 'rails_helper'

RSpec.describe "univers/new", type: :view do
  before(:each) do
    assign(:univer, Univer.new())
  end

  it "renders new univer form" do
    render

    assert_select "form[action=?][method=?]", univers_path, "post" do
    end
  end
end
