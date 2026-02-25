angular.module('DMShield', ['ngRoute'])
.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $locationProvider.hashPrefix('');
  
  $routeProvider
  .when('/',    { templateUrl: 'Views/home.html' })
  .when('/Inimigos', { templateUrl: 'Views/Inimigos.html' })
  .when('/NPCs', { templateUrl: 'Views/NPCs.html' })
  .when('/Recursos', { templateUrl: 'Views/Recursos.html' })
  .when('/Mundo', { templateUrl: 'Views/Mundo.html' })
  .when('/Anotacoes', { templateUrl: 'Views/Anotacoes.html' })
  .when('/Criador', { templateUrl: 'Views/Criador.html' })


  .when('/AdicionarInimigo', { templateUrl: 'Views/Inputs/AdicionarInimigo.html' })
  .otherwise({ redirectTo: '/' });
}])
.component('appFooter', {
  templateUrl: 'Views/footer.html',
  controller: function(){ /* ... */ }
});