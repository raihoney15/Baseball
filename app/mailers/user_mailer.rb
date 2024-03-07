class UserMailer < ApplicationMailer
  def send_pin(user)
    @user = user
    mail(to: @user.email, subject: 'Verification PIN Code')
  end

  def invite(email, tournament)
    @tournament = tournament
    mail(to: email, subject: 'You have been invited to become a tournament admin')
  end

  def notify_no_moves_played(user, event)
    
    @user = user
    @event = event
    mail(to: @user.email, subject: "Reminder: You haven't played any moves in the live event")
  end
end

