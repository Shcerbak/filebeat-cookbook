default['filebeat']['config']['output']['logstash']['hosts'] = ['172.17.0.11:5044']
default['filebeat']['certificate'] = "-----BEGIN CERTIFICATE-----\n.....\n-----END CERTIFICATE-----\n"

default['filebeat']['prospectors']['test'] = {
  'filebeat' => {
    'prospectors' => [
      {
        'paths' => [
          '/var/log/test/*.log'
        ],
        'input_type' => 'log',
        'document_type' => 'test',
        'fields' => {
          'environment' => node.chef_environment,
          'instance_type' => 'test'
        },
        'fields_under_root' => true
      }
    ]
  }
}
