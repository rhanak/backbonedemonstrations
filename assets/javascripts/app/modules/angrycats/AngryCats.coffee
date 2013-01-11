define ['app/modules/angrycats/AngryCat'
        'app/application'
        'jquery'
        'templates'
        'backbone'
        'backbone.marionette'], (AngryCat, MyApp, $, templates, Backbone) ->
  class AngryCats extends Backbone.Collection
      model: AngryCat
      
      initialize: (cats) ->
          rank = 1;
          _.each cats, (cat) ->
            cat.set('rank', rank);
            ++rank;
          
          this.on 'sort', =>
            @trigger 'reset'

          this.on 'add', (cat) ->
            if not cat.get('rank') 
              error =  Error("Cat must have a rank defined before being added to the collection");
              error.name = "NoRankError";
              throw error;

          MyApp.vent.on "rank:up", (cat) =>
            if cat.get('rank') is 1 
              # can't increase rank of top-ranked cat
              return true;
            
            @rankUp(cat);
            @sort();

          MyApp.vent.on "rank:down", (cat) =>
            if cat.get('rank') is @size() 
              # can't decrease rank of lowest ranked cat
              return true;
            
            @rankDown(cat);
            @sort();

          MyApp.vent.on "cat:disqualify", (cat) =>
            disqualifiedRank = cat.get('rank');
            catsToUprank = @filter ->
              return cat.get('rank') > disqualifiedRank; 
            
            catsToUprank.forEach (cat) -> 
              cat.rankUp();
            
            @trigger('reset');   

      comparator: (cat) ->
          return cat.get('rank');
        
      rankUp: (cat) ->
          # find the cat we're going to swap ranks with
          rankToSwap = cat.get('rank') - 1;
          otherCat = this.at(rankToSwap - 1);
          
          # swap ranks
          cat.rankUp();
          otherCat.rankDown();
        
      rankDown: (cat) -> 
          # find the cat we're going to swap ranks with
          rankToSwap = cat.get('rank') + 1;
          otherCat = this.at(rankToSwap - 1);
          
          # swap ranks
          cat.rankDown();
          otherCat.rankUp();