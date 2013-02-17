package "monit"

if platform?("ubuntu")
  cookbook_file "/etc/default/monit" do
    source "monit.default"
    owner "root"
    group "root"
    mode 0644
  end
end

#service "monit" do
#  action :start
#  enabled true
#  supports [:start, :restart, :stop]
#end

directory "/etc/monit/conf.d/" do
  owner  'root'
  group 'root'
  mode 0755
  action :create
  recursive true
end

template "/etc/monit/monitrc" do
  owner "root"
  group "root"
  mode 0700
  source 'monitrc.erb'
	notifies :restart, "runit_service[monit]", :delayed
#  notifies :restart, resources(:service => "monit"), :delayed
end
