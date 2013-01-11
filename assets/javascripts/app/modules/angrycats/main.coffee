define ['app/modules/angrycats/AngryCat'
        'app/modules/angrycats/AngryCats',
        'app/modules/angrycats/views/AngryCatsView'
    ], (AngryCat, AngryCats, AngryCatsView) ->
      class AngryCatsModule 
        constructor: ->
             @cats = new AngryCats([
                new AngryCat({ name: 'Wet Cat', image_path: 'images/cat2.jpg' }),
                new AngryCat({ name: 'Bitey Cat', image_path: 'images/cat1.jpg' }),
                new AngryCat({ name: 'Surprised Cat', image_path: 'images/cat3.jpg' })
             ]);

             @cats.add([new AngryCat({
              name: 'Cranky Cat',
              image_path: 'images/cat4.jpg',
              rank: @cats.size() + 1
             })], {merge:true});
            # Passing merge so that an index will be passed along into Marionette's addView

        getMainView: ->
            angryCatsView = new AngryCatsView collection: @cats

