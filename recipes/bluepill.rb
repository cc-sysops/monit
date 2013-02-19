include_recipe "bluepill"
include_recipe "runit"
include_recipe "monit"

runit_service "monit" do
  default_logger true
end

bluepill_service "monit" do
  action [:enable, :load, :start]
end



