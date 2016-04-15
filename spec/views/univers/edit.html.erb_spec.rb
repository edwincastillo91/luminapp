require 'rails_helper'

RSpec.describe "univers/edit", type: :view do
  before(:each) do
    @univer = assign(:univer, Univer.create!())
  end

  it "renders the edit univer form" do
    render

    assert_select "form[action=?][method=?]", univer_path(@univer), "post" do
    end
  end
end
