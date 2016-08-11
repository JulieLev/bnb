feature 'index page' do
  before(:each) do
    visit '/'
  end

  scenario 'I can navigate to sign up page from the index page' do
    click_button('sign up')
    expect(current_path).to eq('/users/new')
  end

  scenario 'I can navigate to sign in page from the index page' do
    click_button('sign in')
    expect(current_path).to eq('/sessions/new')
  end

  scenario 'I cannot navigate to add_space page from the index page if not signed in' do
    click_button('Add space')
    expect(current_path).to eq('/')
  end

end
