class elasticsearch::install {
    file { '/etc/yum.repos.d/elasticsearch.repo':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('elasticsearch/elasticsearch.repo')
    }

    package { 'java-1.7.0-openjdk-devel.x86_64':
        ensure => installed
    }

    package { 'elasticsearch':
        ensure  => installed,
        require => [
            File['/etc/yum.repos.d/elasticsearch.repo'],
            Package['java-1.7.0-openjdk-devel.x86_64']
        ]
    }
}
