# Description

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

# Requirements

## Platform:

*No platforms defined*

## Cookbooks:

* apt (>= 2.8)

# Attributes

* `node['filebeat']['config']` -  Defaults to `{ ... }`.
* `node['filebeat']['configuration']['path']` -  Defaults to `/etc/filebeat/filebeat.yml`.
* `node['filebeat']['configuration']['dir']` -  Defaults to `/etc/filebeat/conf.d`.
* `node['filebeat']['cert']['dir']` -  Defaults to `/etc/pki/tls/certs`.
* `node['filebeat']['cert']['file']` -  Defaults to `logstash-forwarder.crt`.
* `node['filebeat']['config']['output']['logstash']['hosts']` -  Defaults to `[ ... ]`.
* `node['filebeat']['certificate']` -  Defaults to `-----BEGIN CERTIFICATE-----\n-----END CERTIFICATE-----\n`.
* `node['filebeat']['repository']['uri']` -  Defaults to `https://packages.elastic.co/beats/apt`.
* `node['filebeat']['repository']['dist']` -  Defaults to `stable`.
* `node['filebeat']['repository']['repo']` -  Defaults to `[ ... ]`.
* `node['filebeat']['repository']['key']` -  Defaults to `https://packages.elasticsearch.org/GPG-KEY-elasticsearch`.
* `node['filebeat']['apt']['options']` -  Defaults to `-o Dpkg::Options::='--force-confnew'`.
* `node['filebeat']['version']` -  Defaults to `1.3.1`.

# Recipes

* filebeat::config
* filebeat::default
* filebeat::install
* filebeat::service

# License and Maintainer

Maintainer:: Shcerbak (<shcerbak@gmail.com>)
Source:: https://github.com/shcerbak/filebeat-cookbook
Issues:: https://github.com/shcerbak/filebeat-cookbook/issues

License:: apache 2
