default['filebeat']['repository']['uri'] = 'https://packages.elastic.co/beats/apt'
default['filebeat']['repository']['dist'] = 'stable'
default['filebeat']['repository']['repo'] = ['main']
default['filebeat']['repository']['key'] = 'https://packages.elasticsearch.org/GPG-KEY-elasticsearch'
default['filebeat']['apt']['options'] = "-o Dpkg::Options::='--force-confnew'"
default['filebeat']['version'] = '1.3.1'
