require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    #The setup method will create a category object available to
    #all methods in the class, so that we write less code
    def setup
        @category = Category.new(name: "Sports")
    end

    #"category should be valid"
    test "category should be valid" do
        #already declared in setup
        assert @category.valid?
    end

    test "name should be present" do
        #changing name from setup
        @category.name= " "
        assert_not(@category.valid?)
    end

    test "name should be unique" do
        @category.save
        @category2 = Category.new(name: "Sports")
        assert_not(@category2.valid?)
    end

    test "name should not be too long" do
        @category.name = 'a' * 26
        assert_not @category.valid?
    end

    test "name should not be too short" do
        @category.name = "aa"
        assert_not @category.valid?
    end


end