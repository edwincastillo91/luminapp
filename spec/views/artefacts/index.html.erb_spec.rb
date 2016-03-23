require 'rails_helper'

RSpec.describe "artefacts/index", type: :view do
  before(:each) do
    assign(:artefacts, [
      Artefact.create!(
        :name => "Name"
      ),
      Artefact.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of artefacts" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
