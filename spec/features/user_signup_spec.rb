feature 'Signup' do
  scenario 'I can sign up as a new user for the website' do
    expect{ signup }.to change(User, :count).by(1)
    # expect(page).to have_content('Welcome, AppleMan')
    expect(User.first.email).to eq('steve@coder.com')
  end

  scenario 'I cannot sign up with mismatching passwords' do
    expect{ signup(password_confirmation: 'orange123') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

end
