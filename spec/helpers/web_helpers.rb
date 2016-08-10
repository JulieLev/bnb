# module WebHelpers

  def signin(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'sign in'
  end

  def signup(name: "Steve", email: "steve@coder.com", password: "apple123", password_confirmation: "apple123"
    )

    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in 'name', with: name
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'password_confirmation', with: password_confirmation

    click_button 'sign up'
  end


# end
