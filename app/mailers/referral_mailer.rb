class ReferralMailer < ApplicationMailer
  def referral(referral, email)
    @referral = referral
    @email = email
    mail(to: email, 
      subject: 'Referral mail',
      template_path: 'referral_mailer',
      template_name: 'referral.html.erb')
  end
end
