require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  
  def newAdmin
    admin = FactoryBot.create(:admin)
    login_as(admin)
  end

  context "Create new project" do
    before(:each) do
      newAdmin
      visit new_project_path
      fill_in "Title", with: "Test title"
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Create Project"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Create Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      newAdmin
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      fill_in "Description", with: "New description content"
      click_button "Update Project"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      fill_in "Description", with: ""
      click_button "Update Project"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      newAdmin
      visit projects_path
      click_button "Destroy"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end