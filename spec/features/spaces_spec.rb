feature 'Spaces' do
  scenario 'can display all available spaces on initial home page visit' do
    visit '/'
    expect(page).to have_content('Welcome to BnB')
  end
end
