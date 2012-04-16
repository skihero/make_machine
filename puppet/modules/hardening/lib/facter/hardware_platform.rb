# hardware_platform.rb
require 'facter'
Facter.add("hardware_platform") do
  setcode do
    "abecd"
  end
end
