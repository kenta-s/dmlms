require 'rails_helper'

RSpec.describe "news/index", type: :view do
  before(:each) do
    News.create!(
      :key => "Key",
      :content => "MyText",
      :label => 'sports'
    )
    News.create!(
      :key => "Key",
      :content => "MyText",
      :label => 'sports'
    )
    assign(:news, News.all.page(1))
  end

  it "renders a list of news" do
    render
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "sports".to_s, :count => 2
  end
end
