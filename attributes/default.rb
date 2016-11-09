default['filebeat']['configuration']['path'] = '/etc/filebeat/filebeat.yml'
default['filebeat']['configuration']['dir'] = '/etc/filebeat/conf.d'
default['filebeat']['cert']['dir'] = '/etc/pki/tls/certs'
default['filebeat']['cert']['file'] = 'logstash-forwarder.crt'
default['filebeat']['config']['output']['logstash']['hosts'] = ['localhost:5044']
default['filebeat']['certificate'] = "-----BEGIN CERTIFICATE-----\n-----END CERTIFICATE-----\n"
