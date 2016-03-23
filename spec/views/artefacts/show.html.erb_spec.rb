require 'rails_helper'

RSpec.describe "artefacts/show", type: :view do
  before(:each) do
    @artefact = assign(:artefact, Artefact.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
