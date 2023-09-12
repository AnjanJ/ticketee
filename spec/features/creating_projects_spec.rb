# frozen_string_literal: true
require 'rails_helper'

RSpec.feature "Users can create new Projects" do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'Visual Studio Code'
    fill_in 'Description', with: 'A text editor for everyone'
    click_button 'Create Project'

    expect(page).to have_content 'Project has been created.'
  end
end
