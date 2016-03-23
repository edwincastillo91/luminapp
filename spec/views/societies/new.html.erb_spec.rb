require 'rails_helper'

RSpec.describe "societies/new", type: :view do
  before(:each) do
    assign(:society, Society.new(
      :name => "MyString"
    ))
  end

  it "renders new society form" do
    render

    assert_select "form[action=?][method=?]", societies_path, "post" do

      assert_select "input#society_name[name=?]", "society[name]"
    end
  end
end
