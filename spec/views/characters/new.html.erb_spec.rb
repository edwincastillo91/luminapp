require 'rails_helper'

RSpec.describe "characters/new", type: :view do
  before(:each) do
    assign(:character, Character.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :drive => "MyText",
      :wound => "MyText",
      :eyes_color => "MyString",
      :hair_color => "MyString",
      :height => 1,
      :weight => 1,
      :race => "MyString",
      :sex => "MyString",
      :genetic_modification => false,
      :social_class => "MyString",
      :sexual_orientation => "MyString",
      :genre => "MyString"
    ))
  end

  it "renders new character form" do
    render

    assert_select "form[action=?][method=?]", characters_path, "post" do

      assert_select "input#character_first_name[name=?]", "character[first_name]"

      assert_select "input#character_last_name[name=?]", "character[last_name]"

      assert_select "textarea#character_drive[name=?]", "character[drive]"

      assert_select "textarea#character_wound[name=?]", "character[wound]"

      assert_select "input#character_eyes_color[name=?]", "character[eyes_color]"

      assert_select "input#character_hair_color[name=?]", "character[hair_color]"

      assert_select "input#character_height[name=?]", "character[height]"

      assert_select "input#character_weight[name=?]", "character[weight]"

      assert_select "input#character_race[name=?]", "character[race]"

      assert_select "input#character_sex[name=?]", "character[sex]"

      assert_select "input#character_genetic_modification[name=?]", "character[genetic_modification]"

      assert_select "input#character_social_class[name=?]", "character[social_class]"

      assert_select "input#character_sexual_orientation[name=?]", "character[sexual_orientation]"

      assert_select "input#character_genre[name=?]", "character[genre]"
    end
  end
end
