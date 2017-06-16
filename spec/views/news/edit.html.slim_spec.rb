require 'rails_helper'

RSpec.describe "news/edit", type: :view do
  before(:each) do
    @news = assign(:news, News.create!(
      :key => "MyString",
      :content => "MyText",
      :label => "sports"
    ))
  end

  it "renders the edit news form" do
    render

    assert_select "form[action=?][method=?]", news_path(@news), "post" do

      assert_select "input#news_key[name=?]", "news[key]"

      assert_select "textarea#news_content[name=?]", "news[content]"
    end
  end
end
