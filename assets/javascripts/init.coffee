define [
      'angrycats',
      'app/application'], 
      (AngryCatsModule, MyApp) ->
        MyApp.addRegions({
            mainRegion: "#content"
          });

        MyApp.addInitializer (options) -> 
            MyApp.mainRegion.show new AngryCatsModule().getMainView()

        MyApp.start();
        
        