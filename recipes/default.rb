package "monit"

service_to_notify = case node['monit']['init_style']
                    when "runit"
                      "runit_service[monit]"
                    else
                      "service[monit]"
                    end

puts service_to_notify

#service "monit" do
#  action :nothing
#end

if platform?("ubuntu")
  cookbook_file "/etc/default/monit" do
    source "monit.default"
    owner "root"
    group "root"
    mode 0644
  end
end

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
#	notifies :restart, "runit_service[monit]"
  notifies :restart, service_to_notify
end
