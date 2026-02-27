angular.module('DMShield', ['ngRoute'])
.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $locationProvider.hashPrefix('');
  
  $routeProvider
  .when('/',    { templateUrl: 'Views/home.html' })
  .when('/Inimigos', { templateUrl: 'Views/Inimigos.html', controller: 'EnemiesCtrl' })
  .when('/NPCs', { templateUrl: 'Views/NPCs.html', controller: 'NPCsCtrl' })
  .when('/Recursos', { templateUrl: 'Views/Recursos.html', controller: 'RecursosCtrl' })
  .when('/Consumiveis', { templateUrl: 'Views/Consumiveis.html', controller: 'RecursosCtrl' })
  .when('/Itens', { templateUrl: 'Views/Itens.html', controller: 'RecursosCtrl' })
  .when('/Mundo', { templateUrl: 'Views/Mundo.html', controller: 'LocaisCtrl' })
  .when('/Anotacoes', { templateUrl: 'Views/Anotacoes.html', controller: 'AnotacoesCtrl' })
  .when('/Criador', { templateUrl: 'Views/Criador.html' })
  .when('/combate', {templateUrl: 'Views/Combate.html',controller: 'CombateCtrl'})


  .when('/AdicionarInimigo', { templateUrl: 'Views/Inputs/AdicionarInimigo.html', controller: 'EnemiesCtrl' })
  .when('/AdicionarNPC', { templateUrl: 'Views/Inputs/AdicionarNPC.html', controller: 'NPCsCtrl' })
  .when('/AdicionarAnotacao', { templateUrl: 'Views/Inputs/AdicionarAnotacao.html', controller: 'AnotacoesCtrl' })
  .when('/AdicionarItem', { templateUrl: 'Views/Inputs/AdicionarItem.html', controller: 'RecursosCtrl' })
  .when('/AdicionarConsumivel', { templateUrl: 'Views/Inputs/AdicionarConsumivel.html', controller: 'RecursosCtrl' })
  .when('/AdicionarLocal', { templateUrl: 'Views/Inputs/AdicionarLocal.html', controller: 'LocaisCtrl' })

  .otherwise({ redirectTo: '/' });
}])
.component('appFooter', {
  templateUrl: 'Views/footer.html',
  controller: function(){ /* ... */ }
});

