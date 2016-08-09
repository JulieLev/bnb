feature 'Signup' do
  scenario 'I can sign up as a new user for the website' do
    expect{ signup }.to change(User, :count).by(1)
    # expect(page).to have_content('Welcome, AppleMan')
    expect(User.first.email).to eq('steve@coder.com')
  end
end
