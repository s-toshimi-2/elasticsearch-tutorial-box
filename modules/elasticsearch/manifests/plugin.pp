class elasticsearch::plugin {
    exec { 'install elasticsearch-HQ plugin':
        user    => 'root',
        command => '/usr/share/elasticsearch/bin/plugin -i royrusso/elasticsearch-HQ',
        unless  => '/usr/bin/test -d /usr/share/elasticsearch/plugins/HQ',
        require => Package['elasticsearch'],
    }

    exec { 'install elasticsearch-head':
        user    => 'root',
        command => '/usr/share/elasticsearch/bin/plugin -i mobz/elasticsearch-head',
        unless  => '/usr/bin/test -d /usr/share/elasticsearch/plugins/head',
        require => Package['elasticsearch'],
    }

    exec { 'install elasticsearch-river-csv':
        user    => 'root',
        command => '/usr/share/elasticsearch/bin/plugin -i river-csv -url https://github.com/AgileWorksOrg/elasticsearch-river-csv/releases/download/2.1.1/elasticsearch-river-csv-2.1.1.zip',
        unless  => '/usr/bin/test -d /usr/share/elasticsearch/plugins/river-csv',
        require => Package['elasticsearch'],
    }
}
