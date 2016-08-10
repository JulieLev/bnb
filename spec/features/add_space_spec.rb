feature 'Adding Spaces' do

  scenario 'a user can add a space' do
    visit '/spaces/new'
    expect(page.status_code).to eq 200
    fill_in :space_name, with: 'Spanish Villa'
    click_button 'Add Space'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/spaces/index'

    within 'ul#list_spaces' do
      expect(page).to have_content('Spanish Villa')
    end
  end
end
