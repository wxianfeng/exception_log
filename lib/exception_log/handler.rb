#encoding:utf-8
require File.expand_path("../mailer.rb",__FILE__)

module ExceptionLog
	class Handler

		def initialize(env,exception,options={})
			@exception = exception
			@request = ActionDispatch::Request.new(env)
			@controller = env['action_controller.instance']
			@options = options
			@body = generate_text
		end

		def generate_text
			org_str = if @controller.respond_to? :current_orgnization
				org = @controller.send(:current_orgnization)
				"orgnization: #{org.try(:id)} #{org.try(:name)}"
			end
			user_str = if @controller.respond_to? :current_user
				user = @controller.send(:current_user)
				"user: #{user.try(:id)} #{user.try(:name)}"
			end
			error =<<HERE
\n\n\n========================================= EXCEPTION ==============================================================			
#{org_str}
#{user_str}
time: #{Time.now.strftime('%Y-%m-%d %H:%M:%S')}
method: #{@request.method}
url: #{@request.url}
user-agent: #{@request.user_agent}
referer: #{@request.headers["Referer"]}
params: #{@controller.params}
exception: #{@exception.class}
message: #{@exception.message}
backtace: \n#{@exception.backtrace.join("\n")}
HERE
		return error
		end

		def default_log_path
			"#{Rails.root}/log/exception.log"
		end

		def write_file
			log_path = @options[:log_path] || default_log_path
			File.open(log_path,"a+") do |f|
				f.puts @body
			end
		end

		def send_mail
			ExceptionLog::Mailer.exception_mail(@body,:from=>@options[:from],:to=>@options[:to]).deliver
		end

		def do
			write_file
			send_mail
		end

	end
end