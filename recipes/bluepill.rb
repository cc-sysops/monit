include_recipe "monit"
include_recipe "bluepill"
include_recipe "runit"


runit_service "monit" do
  default_logger true
end

bluepill_service "monit" do
  action [:enable, :load]
end



