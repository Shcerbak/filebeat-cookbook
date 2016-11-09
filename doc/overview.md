This cookbook installs and configure filebeat.

# Usage

include_recipe 'filebeat::default'

Modify `default['filebeat']['config']['output']['logstash']['hosts'] = ['logstash_host:5044']`

Modify `default['filebeat']['certificate'] = "-----BEGIN CERTIFICATE-----\n.......\n-----END CERTIFICATE-----\n"` logstash certificate

Add filebeat prospectors:
default['filebeat']['prospectors']['test1'] = {
  'filebeat' => {
    'prospectors' => [
      {
        'paths' => [
          '/var/log/test1/*.log'
        ],
        'input_type' => 'log',
        'document_type' => 'test1',
        'fields' => {
          'environment' => node.chef_environment,
          'instance_type' => 'test1'
        },
        'fields_under_root' => true
      }
    ]
  }
}

default['filebeat']['prospectors']['test2'] = {
  'filebeat' => {
    'prospectors' => [
      {
        'paths' => [
          '/var/log/test2/*.log'
        ],
        'input_type' => 'log',
        'document_type' => 'test2',
        'fields' => {
          'environment' => node.chef_environment,
          'instance_type' => 'test2'
        },
        'fields_under_root' => true
      }
    ]
  }
}
