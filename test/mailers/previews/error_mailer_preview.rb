# Preview all emails at http://localhost:3000/rails/mailers/error_mailer
class ErrorMailerPreview < ActionMailer::Preview
  def error_mail_preview
    ExampleMailer.test_email(User.first)
  end
end
