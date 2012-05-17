require 'spec_helper'

describe "LayoutLinks" do

    it "should have a home page at '/'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/'
      response.should have_selector('title', :content => "Home")
    end
    
    it "should have a Contact page at '/contact'" do
      get '/contact'
      response.should have_selector('title', :content => "Contact")
    end

    it "should have a About page at '/about'" do
      get '/about'
      response.should have_selector('title', :content => "About")
    end

    it "should have a Help page at '/help'" do
      get '/help'
      response.should have_selector('title', :content => "Help")
    end
    
    it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Sign up")
    end 
    
    it "should have the right links on the layout" do
      visit root_path
      click_link "About"
      response.should have_selector('title', :content => "About")
      visit root_path
      click_link "Help"
      response.should have_selector('title', :content => "Help")
      visit root_path
      click_link "Contact"
      response.should have_selector('title', :content => "Contact")
      visit root_path
      click_link "Home"
      response.should have_selector('title', :content => "Home")
      visit root_path
      click_link "Sign up"
      response.should have_selector('title', :content => 'Sign up')
  end
end
