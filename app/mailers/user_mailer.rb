class UserMailer < ApplicationMailer
    default from: 'hello@extra-resto.fr'
   
    def welcome_email(user)
      
      @user = user 
  
      @url  = 'https://extra-resto.fr' 

      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
end
