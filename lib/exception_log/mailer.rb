#encoding:utf-8
module ExceptionLog
	class Mailer < ::ActionMailer::Base

	def exception_mail(body,options = {})
  		from = options[:from]
  		to = options[:to]
  		subject = "NOTICE,your site raise an exception!"
  		body = body
  	  mail(:from=>from, :to => to, :subject => subject, :body => body)
	end

	end
end
