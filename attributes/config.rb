default['filebeat']['config'] = {
  'filebeat' => {
    'config_dir' => node['filebeat']['configuration']['dir'],
    'registry_file' => '/var/lib/filebeat/registry'
  },
  'output' => {
    'logstash' => {
      'hosts' => node['filebeat']['config']['output']['logstash']['hosts'],
      'bulk_max_size' => 1024,
      'tls' => {
        'certificate_authorities' => [::File.join(node['filebeat']['cert']['dir'], node['filebeat']['cert']['file']).to_s]
      }
    }
  },
  'logging' => {
    'files' => {
      'rotateeverybytes' => 10485760
    }
  }
}
