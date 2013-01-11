define [
        'app',
        './router',
        'module!Layout:Main',
        './views/layout'
    ], (App, Router, Main, LayoutView) ->

  DataTable = App.module('DataTable', {

            startWithParent: true,

            define: (DataTable) ->

                DataTable.addInitializer ->
                    App.RouteManager.registerRouter(new Router({ controller: DataTable }));
                 

                DataTable.Views = {
                    layout: (options) -> 
                        return new LayoutView(options);
                };

                DataTable.showDataTable = -> 
                    # App.Navigation.activateById(App.Navigation.Id.PRIMARY.DataTable, 'primary');

                    # App.PageContext.session.set('pageTitle', 'DataTable').set('pageTitleIcon', 'icon-screen');
                    Main.Views.layout().content.show( DataTable.Views.layout() );
        });