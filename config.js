define(['settings'], function (Settings) {
  return new Settings({
    datasources: {
      raptor: {
        default: true,
        type: 'influxdb',
        url: 'http://' + window.location.hostname + ':8086/db/raptor',
        username: 'root',
        password: 'root'
      }
    },
    default_route: '/dashboard/file/raptor.json',
    window_title_prefix: 'Raptor - ',
    timezoneOffset: null,
    grafana_index: 'grafana-dash',
    unsaved_changes_warning: true,
    plugins: {
      panels: []
    },
    admin: 'Performance0nlY!'
  });
});
