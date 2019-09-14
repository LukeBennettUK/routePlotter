class User < ApplicationRecord
    has_secure_password
    validates_uniqueness_of :email
    # generates unique auth token every time
    before_create { generate_token(:auth_token) }

    def send_password_reset
        # :password_reset_token references the new column in User created in the add_password_reset_to_users column
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        # saves the user model
        save!
        # password_reset is an action of the user_mailer mailer, self in this instance is User, calling .deliver sends the email
        UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
        begin
            # SecureRandom generates a random string provided by activeSupport
            self[column] = SecureRandom.urlsafe_base64
            # Make sure token is unique by making sure no other user exists with that token
            # If another user does exist it just goes through the loop again, generating a new random string
        end while User.exists?(column => self[column])
    end
end
