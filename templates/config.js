/**
 * These is the app's configuration, If you need to configure
 * the default dashboard, please see dashboards/default
 */
define(['settings'],
function (Settings) {


  return new Settings({

    elasticsearch: '<%= scope.lookupvar('es_real') %>',
    default_route: '/dashboard/file/default.json',
    kibana_index: "kibana-int",
    panel_names: ['<%= scope.lookupvar('modules').join("','") -%>'],

  });
});
