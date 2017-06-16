require 'rails_helper'

RSpec.describe "news/new", type: :view do
  before(:each) do
    assign(:news, News.new(
      :key => "MyString",
      :content => "MyText",
      :label => "sports"
    ))
  end

  it "renders new news form" do
    render

    assert_select "form[action=?][method=?]", news_index_path, "post" do

      assert_select "input#news_key[name=?]", "news[key]"

      assert_select "textarea#news_content[name=?]", "news[content]"
    end
  end
end
