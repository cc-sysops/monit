include_recipe "runit"

runit_service "monit"

service "monit" do
  supports :status => true, :restart => true, :start => true, :stop => true, :reload => true
  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/monit"
	action :nothing
end

include_recipe "monit"
