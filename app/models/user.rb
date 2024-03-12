class User < ApplicationRecord
    has_secure_password
  
    validates :emails, presence: true, uniqueness: true, 
              length: { in: 3..15 },
              format: {
                with: /\A[a-zA-Z0-9_]+\z/,
                message: "solo se permiten letras, números y guiones bajos"
              }
    validates :username, presence: true, uniqueness: true, 
              length: { in: 3..15 },
              format: {
                with: /\A[a-zA-Z0-9_]+\z/,
                message: "solo se permiten letras, números y guiones bajos"
              }
    validates :password, presence: true, length: { minimum: 6 }
    
    before_save :downcase_attributes
  
    private
  
    def downcase_attributes
      self.username = username.downcase 
      self.emails = username.downcase 
    end
  end
  