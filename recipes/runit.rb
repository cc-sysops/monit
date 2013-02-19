include_recipe "monit"
include_recipe "runit"

runit_service "monit" do
  default_logger true
end

#service "monit" do
#  supports :status => true, :restart => true, :start => true, :stop => true, :reload => true
#  reload_command "#{node['runit']['sv_bin']} hup #{node['runit']['service_dir']}/monit"
#  start_command "#{node['runit']['sv_bin']} start #{node['runit']['service_dir']}/monit"
#  stop_command "#{node['runit']['sv_bin']} stop #{node['runit']['service_dir']}/monit"
#  restart_command "#{node['runit']['sv_bin']} restart #{node['runit']['service_dir']}/monit"
#	action :nothing
#end

