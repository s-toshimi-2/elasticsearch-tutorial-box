class elasticsearch::service {
    service { 'elasticsearch':
        enable     => true,
        ensure     => running,
        hasrestart => true,
    }
}
