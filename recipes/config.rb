directory node['filebeat']['cert']['dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end

file [::File.join(node['filebeat']['cert']['dir'], node['filebeat']['cert']['file']).to_s] do
  action :create
  owner 'root'
  group 'root'
  mode '0644'
  content node['filebeat']['certificate']
end

directory node['filebeat']['configuration']['dir'] do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

config = node['filebeat']['config']
file 'filebeat.yml' do
  path node['filebeat']['configuration']['path']
  content JSON.parse(config.to_json).to_yaml.lines.to_a[1..-1].join
  notifies :restart, 'service[filebeat]'
end

node['filebeat']['prospectors'].each_pair do |name, opts|
  file ::File.join(node['filebeat']['configuration']['dir'], "#{name}.yml") do
    content JSON.parse(opts.to_json).to_yaml.lines.to_a[1..-1].join
    notifies :restart, 'service[filebeat]'
  end
end
