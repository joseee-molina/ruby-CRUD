require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = User.create(username: "Jondoe", email: "Jondoe@example.com",
      password: "123", admin: true)
      sign_in_as(@admin_user)
  end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    
    assert_difference 'Category.count',1 do
      post categories_path, params: {category: {name: "Sports" } }
      assert_response :redirect

    end
    follow_redirect!
    #we want to follow the redirect and see where it takes us
    assert_response :success
    assert_match "Sports", response.body
    #checking if Sports in in the body of the html
  end

  test "get new category form and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: " " } }
    end
    assert_match "errors", response.body
    #it is looking for the word errors in the html page
    assert_select 'div.alert'
    #checking for this div in the html page
    assert_select 'h4.alert-heading'
    
  end


end
