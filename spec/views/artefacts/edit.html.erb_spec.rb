require 'rails_helper'

RSpec.describe "artefacts/edit", type: :view do
  before(:each) do
    @artefact = assign(:artefact, Artefact.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit artefact form" do
    render

    assert_select "form[action=?][method=?]", artefact_path(@artefact), "post" do

      assert_select "input#artefact_name[name=?]", "artefact[name]"
    end
  end
end
