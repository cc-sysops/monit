package "monit"

if node['monit']['init_style'] == 'runit'
#  include_recipe "monit::runit"
  runit_service "monit" do
    default_logger true
  end

end

service_to_notify = case node['monit']['init_style']
                    when "runit"
                      "runit_service[monit]"
                    else
                      "service[monit]"
                    end


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
