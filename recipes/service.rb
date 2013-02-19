
#if node['nginx']['init_style'] == "runit"
#	include_recipe "monit::runit"
#elsif node['nginx']['init_style'] == "bluepill"
	include_recipe "monit::bluepill"	
#else 
#  include_recipe "monit::init"
#end
