package { 'java-1.7.0-openjdk-devel.x86_64':
    ensure => installed
}

package { 'elasticsearch':
    ensure  => installed,
    require => [
        Package['java-1.7.0-openjdk-devel.x86_64'],
        File['/etc/yum.repos.d/elasticsearch.repo']
    ],
    notify  => Service['elasticsearch']
}

file { '/etc/yum.repos.d/elasticsearch.repo':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('elasticsearch.repo')
}

service { 'elasticsearch':
    enable     => true,
    ensure     => running,
    hasrestart => true,
    require    => File['/etc/yum.repos.d/elasticsearch.repo']
}

exec { 'install elasticsearch-HQ plugin':
    user    => 'root',
    command => '/usr/share/elasticsearch/bin/plugin -i royrusso/elasticsearch-HQ',
    unless  => '/usr/bin/test -d /usr/share/elasticsearch/plugins/HQ',
    require => Package['elasticsearch']
}

exec { 'install elasticsearch-head':
    user    => 'root',
    command => '/usr/share/elasticsearch/bin/plugin -i mobz/elasticsearch-head',
    unless  => '/usr/bin/test -d /usr/share/elasticsearch/plugins/head',
    require => Package['elasticsearch']
}

exec { 'install elasticsearch-river-csv':
    user    => 'root',
    command => '/usr/share/elasticsearch/bin/plugin -i river-csv -url https://github.com/AgileWorksOrg/elasticsearch-river-csv/releases/download/2.1.1/elasticsearch-river-csv-2.1.1.zip',
    unless  => '/usr/bin/test -d /usr/share/elasticsearch/plugins/river-csv',
    require => Package['elasticsearch']
}
