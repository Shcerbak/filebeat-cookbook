service 'filebeat' do
  supports :restart => true
  action [:enable, :start]
end
