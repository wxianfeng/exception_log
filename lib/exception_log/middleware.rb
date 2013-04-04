#encoding:utf-8
require File.expand_path("../handler",__FILE__)

module ExceptionLog
	class Middleware
		def initialize(app, options = {})
			@app = app
			@options = options
		end

		def call(env)
			@app.call(env)
		rescue Exception => e
			pid = fork {
				ExceptionLog::Handler.new(env,e,@options).do
			}
			Process.detach(pid)
			raise e
		end	
	end
end