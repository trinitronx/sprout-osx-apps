dmg_properties = node['sprout']['gpgsuite']['dmg']

dmg_package "GPG Suite" do
  source      dmg_properties['source']
  checksum    dmg_properties['checksum']
  volumes_dir dmg_properties['volumes_dir']
  dmg_name    dmg_properties['dmg_name']
  app         dmg_properties['app']
  type        dmg_properties['type']
  package_id 'org.gpgtools.libmacgpgB.pkg' # Force upgrade from old GPGTools since dmg_package has no action :upgrade
  # package_id 'org.gpgtools.*'
  owner node['current_user']
end

# Ensure user's mail folder permissions are correct (after install, owned by root)
directory "/Users/#{node['current_user']}/Library/Mail" do
  mode 0700
  owner node['current_user']
end

directory "/Users/#{node['current_user']}/.gnupg" do
  mode 0700
  owner node['current_user']
end