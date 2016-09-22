class ArtistMailer < ApplicationMailer
  default from: 'inquiries@artisanstreasures.com'


  def inquire_email(message)
    @sender_email = message.sender_email
    @title = message.title
    @body = message.body

    mail(to: message.receiver_email, subject: 'Inquiry from Viewer at Artisans Treasures')
    puts "sent!"
  end
end
