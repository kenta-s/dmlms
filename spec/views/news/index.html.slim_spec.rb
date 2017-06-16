require 'rails_helper'

RSpec.describe "news/index", type: :view do
  before(:each) do
    assign(:news, [
      News.create!(
        :key => "Key",
        :content => "MyText",
        :label => "Label"
      ),
      News.create!(
        :key => "Key",
        :content => "MyText",
        :label => "Label"
      )
    ])
  end

  it "renders a list of news" do
    render
    assert_select "tr>td", :text => "Key".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Label".to_s, :count => 2
  end
end
