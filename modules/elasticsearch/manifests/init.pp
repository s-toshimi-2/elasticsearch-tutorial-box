class elasticsearch {
    include elasticsearch::install
    include elasticsearch::plugin
    include elasticsearch::config
    include elasticsearch::service

       Class['elasticsearch::install']
    -> Class['elasticsearch::plugin']
    -> Class['elasticsearch::config']
    ~> Class['elasticsearch::service']
}
