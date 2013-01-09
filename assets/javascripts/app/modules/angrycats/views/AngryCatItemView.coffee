define ['jquery', 'templates', 'backbone', 'backbone.marionette'], ($, templates, Backbone) ->
  class AngryCatView extends Backbone.Marionette.ItemView
      template: templates['angry_cat_template'],
      tagName: 'tr',
      className: 'angry_cat',
      
      events: 
        'click .rank_up img': 'rankUp',
        'click .rank_down img': 'rankDown',
        'click a.disqualify': 'disqualify'
      
      initialize: ->
        this.bindTo(this.model, "change:votes", this.render);
      
      rankUp: ->
        this.model.addVote();
        MyApp.vent.trigger("rank:up", this.model);
      
      rankDown: ->
        this.model.addVote();
        MyApp.vent.trigger("rank:down", this.model);
      
      disqualify: ->
        MyApp.vent.trigger("cat:disqualify", this.model);
        this.model.destroy();
      