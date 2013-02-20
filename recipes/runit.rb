
include_recipe "runit"

runit_service "monit" do
  default_logger true
end

include_recipe "monit"
