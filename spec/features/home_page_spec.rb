require 'rails_helper'

RSpec.feature "Visiting the homepage", type: :feature do

  def newAdmin
    admin = FactoryBot.create(:admin)
    login_as(admin)
  end

  scenario "The visitor should see projects" do
    newAdmin
    visit root_path
    expect(page).to have_text("Projects")
  end
end