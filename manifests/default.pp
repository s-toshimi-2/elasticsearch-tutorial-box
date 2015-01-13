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
