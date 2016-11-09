include_recipe 'apt'

repo = node['filebeat']['repository']

apt_repository 'beats.list' do
  uri repo['uri']
  distribution repo['dist']
  components repo['repo']
  key repo['key']
  action :add
end

package 'filebeat' do
  version node['filebeat']['version']
  options node['filebeat']['apt']['options']
end
