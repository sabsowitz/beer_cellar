require 'spec_helper'

describe "static_pages" do

  subject { page }

  describe "home page" do
    before { visit home_path }

    it { should have_selector('h1', text: "Welcome!") }
    it { should have_title("Beer Cellar | Home") }
  end

  describe "about" do
    before { visit about_path }

    it { should have_selector('h1', text: "About") }
    it { should have_title("Beer Cellar | About") }
  end

  describe "help" do
    before { visit help_path }

   it { should have_selector('h1', text: "Help/FAQ") }
   it { should have_title("Beer Cellar | Help") }
  end
end