define ['app/modules/angrycats/views/AngryCatItemView' 
        'jquery' 
        'templates' 
        'backbone' 
        'backbone.marionette'], (AngryCatView, $, templates, Backbone) ->
  class AngryCatsView extends Backbone.Marionette.CompositeView
      tagName: "table",
      id: "angry_cats",
      className: "table-striped table-bordered",
      template: templates['angry_cats_template'],
      itemView: AngryCatView,
      
      appendHtml: (collectionView, itemView) ->
        collectionView.$("tbody").append(itemView.el);