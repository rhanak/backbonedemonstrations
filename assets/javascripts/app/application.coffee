define [
        'app/modules/angrycats/AngryCat'
        'app/modules/angrycats/AngryCats'
        'app/modules/angrycats/views/AngryCatsView'
        'jquery', 
        'templates', 
        'backbone', 
        'backbone.marionette'
        ], 
    (AngryCat, AngryCats, AngryCatsView, $, templates, Backbone) ->

      MyApp = new Backbone.Marionette.Application()     