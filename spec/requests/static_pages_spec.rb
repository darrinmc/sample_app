require 'spec_helper'

describe "Static pages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector 'h1', text: heading }
    it { should have_selector 'title', text: full_title(page_title) }
  end
  
  describe "Home page" do
    before { visit root_path }
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    
    it_should_behave_like "all static pages"
    
    it { should_not have_selector 'title', text: '| Home' }
  end
  
  describe "Help page" do
    it "should have the h1 'Help'" do
        visit help_path
        page.should have_selector('h1', :text => 'Help')
    end
    
    it "should have the title 'Help'" do
        visit help_path
        page.should have_selector('title', :text => 'Ruby on Rails Tutorial Sample App | Help')
    end
  end
  
  describe "About page" do
    it "should have the h1 'About Us'" do
        visit about_path
        page.should have_selector('h1', :text => 'About Us')
    end
    
    it "should have the title 'About'" do
        visit about_path
        page.should have_selector('title', :text => 'Ruby on Rails Tutorial Sample App | About')
    end
  end
  
  describe "Contact page" do
    it "should have the h1 'Contact'" do
      visit contact_path
      page.should have_selector('h1', text: 'Contact')
    end
    
    it "should have the title 'Contact'" do
      visit contact_path
      page.should have_selector('title', text: "Ruby on Rails Tutorial Sample App | Contact")
    end
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector "title", text: full_title('About')
    click_link "Help"
    page.should have_selector "title", text: full_title('Help')
    click_link "Contact"
    page.should have_selector "title", text: full_title('Contact')
    click_link "Home"
    page.should_not have_selector "title", text: full_title('|')
    click_link "Sign up now!"
    page.should have_selector "title", text: full_title('Sign up')
    click_link "sample app"
    page.should_not have_selector "title", text: full_title('|')
  end
end
