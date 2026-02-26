angular.module('DMShield').factory('InimigoService', function($http) {

    var inimigos = [];

    return {

        carregar: function() {
            return $http.get('/api/inimigos').then(res => {
                inimigos = res.data;
            });
        },

        getTodos: function() {
            return inimigos;
        },

        getById: function(id) {
            return inimigos.find(i => i.id === id);
        }

    };

});