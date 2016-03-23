require 'rails_helper'

RSpec.describe "characters/index", type: :view do
  before(:each) do
    assign(:characters, [
      Character.create!(
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
      ),
      Character.create!(
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
      )
    ])
  end

  it "renders a list of characters" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Eyes Color".to_s, :count => 2
    assert_select "tr>td", :text => "Hair Color".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Race".to_s, :count => 2
    assert_select "tr>td", :text => "Sex".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Social Class".to_s, :count => 2
    assert_select "tr>td", :text => "Sexual Orientation".to_s, :count => 2
    assert_select "tr>td", :text => "Genre".to_s, :count => 2
  end
end
