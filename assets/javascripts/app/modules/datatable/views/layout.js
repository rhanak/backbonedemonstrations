/**
 * Datatable View
 * @author tuner
 */
define(

    /**
     * Dependencies
     */
    [
        'backbone',
        'app',
        'Templates',
        'slick.grid'
    ],

    /**
     * Module
     */
        function (Backbone, App, Templates, Slick) {

        'use strict';

        var grid;

        return Backbone.View.extend({

            template: Templates.play,

            initialize: function (options) {
                this.render();
            },

            onShowCalled: function () {
                
            },

            render: function () {
                this.$el.html(this.template());

                var columns = [
                    {id: "title", name: "Title", field: "title"},
                    {id: "duration", name: "Duration", field: "duration"},
                    {id: "%", name: "% Complete", field: "percentComplete"},
                    {id: "start", name: "Start", field: "start"},
                    {id: "finish", name: "Finish", field: "finish"},
                    {id: "effort-driven", name: "Effort Driven", field: "effortDriven"}
                ];

                var options = {
                    enableCellNavigation: true,
                    enableColumnReorder: false,
                    explicitInitialization: true
                };

                var data = [];
                for (var i = 0; i < 500; i++) {
                    data[i] = {
                        title: "Task " + i,
                        duration: "5 days",
                        percentComplete: Math.round(Math.random() * 100),
                        start: "01/01/2009",
                        finish: "01/05/2009",
                        effortDriven: (i % 5 == 0)
                    };
                }
                var myGrid = $('<div id="myGrid" style="width:600px;height:500px;"></div>');
                grid = new Slick.Grid(myGrid, data, columns, options);
                this.$el.append(myGrid);
                setTimeout(
                    function () {
                        grid.init();
                    }, 800);
                
                return this;
            }

        });

    }

);