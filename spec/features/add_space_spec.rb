feature 'Adding Spaces' do

  scenario 'a user can add a space' do
    visit '/spaces/new'
    expect(page.status_code).to eq 200
    fill_in 'space name', with: 'Spanish Villa'
    click_button 'Add Space'
    expect(current_path).to eq '/spaces'
    within 'ul#spaces' do
      expect(page).to have_content('Spanish Villa')
    end
  end
end
