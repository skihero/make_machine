require 'facter'
Facter.add("service_run_flag") do
	setcode do
          File::exists?("/var/lock/puppet_service_lock") 
	end
end

