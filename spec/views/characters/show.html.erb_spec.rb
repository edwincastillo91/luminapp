require 'rails_helper'

RSpec.describe "characters/show", type: :view do
  before(:each) do
    @character = assign(:character, Character.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :drive => "MyText",
      :wound => "MyText",
      :eyes_color => "Eyes Color",
      :hair_color => "Hair Color",
      :height => 1,
      :weight => 2,
      :race => "Race",
      :sex => "Sex",
      :genetic_modification => false,
      :social_class => "Social Class",
      :sexual_orientation => "Sexual Orientation",
      :genre => "Genre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Eyes Color/)
    expect(rendered).to match(/Hair Color/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Race/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Social Class/)
    expect(rendered).to match(/Sexual Orientation/)
    expect(rendered).to match(/Genre/)
  end
end
