require 'rails_helper'

RSpec.describe "societies/index", type: :view do
  before(:each) do
    assign(:societies, [
      Society.create!(
        :name => "Name"
      ),
      Society.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of societies" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
