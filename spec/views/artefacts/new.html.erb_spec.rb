require 'rails_helper'

RSpec.describe "artefacts/new", type: :view do
  before(:each) do
    assign(:artefact, Artefact.new(
      :name => "MyString"
    ))
  end

  it "renders new artefact form" do
    render

    assert_select "form[action=?][method=?]", artefacts_path, "post" do

      assert_select "input#artefact_name[name=?]", "artefact[name]"
    end
  end
end
