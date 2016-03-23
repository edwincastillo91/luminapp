require 'rails_helper'

RSpec.describe "societies/edit", type: :view do
  before(:each) do
    @society = assign(:society, Society.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit society form" do
    render

    assert_select "form[action=?][method=?]", society_path(@society), "post" do

      assert_select "input#society_name[name=?]", "society[name]"
    end
  end
end
