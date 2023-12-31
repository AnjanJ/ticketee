# frozen_string_literal: true
require 'rails_helper'

RSpec.feature "Users can create new Projects" do
  before do
    visit '/'
    click_link 'New Project'
  end

  scenario 'with valid attributes' do
    fill_in 'Name', with: 'Visual Studio Code'
    fill_in 'Description', with: 'A text editor for everyone'
    click_button 'Create Project'

    expect(page).to have_content 'Project has been created.'

    project = Project.find_by(name: 'Visual Studio Code')
    expect(page.current_url).to eq project_url(project)

    title = 'Visual Studio Code - Projects - Ticketee'
    expect(page).to have_title title
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Project'

    expect(page).to have_content 'Project has not been created.'
    expect(page).to have_content "Name can't be blank"
  end
end
