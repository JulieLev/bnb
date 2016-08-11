feature 'User signs in' do
  let!(:user) do
    User.create(name: 'mike', email: 'mjf@backtothefuture.com', password: 'backtothefuture', password_confirmation: 'backtothefuture')
  end

  scenario 'I can sign in with correct credentials' do
    signin(email: user.email, password: user.password)
    expect(page).to have_content "Welcome to BnB"
  end

  scenario 'I cannot sign in with incorrect credentials' do
    signin(email: user.email, password: "wrongpassword")
    expect(page).not_to have_content "Welcome to BnB"
  end

  # scenario 'I should not see sign in page while I am signed in' do
  #   signin(username: user.username, password: user.password)
  #   visit '/sessions/new'
  #   expect(page).not_to have_content "Please sign in"
  # end
end
