class elasticsearch::config {
    file { '/etc/elasticsearch/elasticsearch.yml':
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('elasticsearch/elasticsearch.erb'),
    }
}
