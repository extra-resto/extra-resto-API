class UserMailer < ApplicationMailer
    default from: 'toulouse.stephen01@gmail.com'
   
    def welcome_email(user)
      
      @user = user 
  
      @url  = 'https://extra-resto.herokuapp.com' 

      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end
end
