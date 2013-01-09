require
  #urlArgs: "b=#{(new Date()).getTime()}"
  paths:
    jquery: 'vendor/jquery'
    underscore: 'vendor/underscore'
    backbone: 'vendor/backbone'
    'backbone.marionette': 'vendor/backbone.marionette'
  ,  ['app/modules/angrycats/AngryCat',
      'app/modules/angrycats/AngryCats',
      'app/modules/angrycats/views/AngryCatsView',
      'app/application']
  , (AngryCat, AngryCats, AngryCatsView, MyApp) ->
    MyApp.addRegions({
        mainRegion: "body"
      });

    MyApp.addInitializer (options) -> 
        angryCatsView = new AngryCatsView({
          collection: options.cats
        });
        MyApp.mainRegion.show(angryCatsView);
    $ ->
        cats = new AngryCats([
            new AngryCat({ name: 'Wet Cat', image_path: 'assets/images/cat2.jpg' }),
            new AngryCat({ name: 'Bitey Cat', image_path: 'assets/images/cat1.jpg' }),
            new AngryCat({ name: 'Surprised Cat', image_path: 'assets/images/cat3.jpg' })
        ]);

        MyApp.start({cats: cats});
        
        cats.add([new AngryCat({
          name: 'Cranky Cat',
          image_path: 'assets/images/cat4.jpg',
          rank: cats.size() + 1
        })], {merge:true});
        # Passing merge so that an index will be passed along into Marionette's addView