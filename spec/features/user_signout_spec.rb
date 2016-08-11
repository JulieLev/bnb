feature 'User signs out' do
  let!(:user) do
    User.create(name: 'mike', email: 'mjf@backtothefuture.com', password: 'backtothefuture', password_confirmation: 'backtothefuture')
  end

  scenario 'while being signed in' do
    signin(email: user.email, password: user.password)
    click_button 'sign out'
    expect(page).to have_content('You have signed out. Goodbye!')
    expect(page).not_to have_content "Welcome, mike"
  end
end
