namespace :exception_log do

	desc "Start the  ExceptionLog Node server"
	task :start_node_server do
		cfg = YAML::load(File.open(File.expand_path("#{Rails.root}/config/exception_log.yml",__FILE__)))
		server_js = File.expand_path("../../nodejs/server.js",__FILE__)
		Kernel.system "node #{server_js} -host=#{cfg['host']} -log=#{cfg['log']}"
	end

end
