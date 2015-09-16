module Support
  module Features
    def sign_out
      visit '/'
      find(:css, '.sign-out').click
    end

    def create_and_sign_in_user
      user = FactoryGirl.create(:user)

      visit '/sign_in'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign in'

      user
    end
  end
end
