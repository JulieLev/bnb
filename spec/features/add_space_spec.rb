
feature 'Adding Spaces' do

  scenario 'a user can add a space' do
    signup()
    visit '/spaces/new'
    expect(page.status_code).to eq 200
    fill_in :space_name, with: 'Spanish Villa'
    fill_in :description, with: 'Beautiful sea view'
    fill_in :price, with: 10
    fill_in :date_from, with: "1988-12-23"
    fill_in :date_to, with: "1998-12-25"
    click_button 'Add Space'
    expect(page.status_code).to eq 200
    expect(current_path).to eq '/spaces/index'

    within 'ul#list_spaces' do
      expect(page).to have_content('Spanish Villa')
      expect(page).to have_content('Beautiful sea view')
      expect(page).to have_content('10')
      expect(page).to have_content('1988-12-23')

      expect(page).to have_content('1998-12-25')
      expect(page).to have_content('Steve')
    end
  end
end
