define ['jquery', 'templates', 'backbone', 'backbone.marionette'], ($, templates, Backbone) ->
  class AngryCat extends Backbone.Model
      defaults: 
        votes: 0
      
      addVote: ->
        this.set('votes', this.get('votes') + 1)
      
      rankUp: ->
        this.set({rank: this.get('rank') - 1})
      
      rankDown: ->
        this.set({rank: this.get('rank') + 1})