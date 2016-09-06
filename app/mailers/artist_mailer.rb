class ArtistMailer < ApplicationMailer
  default from: 'inquiries@artisanstreasures.com'


  def inquire_email(user)
    @user = user

    mail(to: @user.email, subject: 'Inquiry from Viewer at Artisans Treasures')
  end

end
