require 'spec_helper'

describe StaticPagesController, type: :controller do
  describe "home" do
    it "renders home" do
      get :home
      expect(response).to render_template(:home)
    end
  end

  describe "about" do
    it "renders about" do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe "help" do
    it "renders help" do
      get :help
      expect(response).to render_template(:help)
    end
  end
end