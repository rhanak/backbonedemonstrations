define(
    [
        'app'
    ],

    function (App, DataTable) {

        var routes = {};

        routes[App.Config.route.prefix + 'datatable'] = 'showDataTable';

        var DataTableRouter = App.Router.extend({

            id: 'dataTable',
            appRoutes: routes

        });

        return DataTableRouter;
    }
);