require "test_helper"

class ListCetegoriesTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  #create 2 categories and see if it works from here
  def setup
    @category = Category.create(name: "Sports")
    @category2 = Category.create(name: "Travel")
  end

  test "should show categories listing" do
    get '/categories'
    assert_select "a[href=?]", category_path(@category), text: @category.name #look for a link matching this category
    assert_select "a[href=?]", category_path(@category2), text: @category2.name #same here

  end

end
