angular.module('DMShield', ['ngRoute'])
.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
  $routeProvider
    $locationProvider.hashPrefix('');
    
    $routeProvider
    .when('/',    { templateUrl: 'Views/home.html' })
    .when('/pagina1', { templateUrl: 'Views/pagina1.html' })
    .when('/pagina2', { templateUrl: 'Views/pagina2.html' })
    .when('/pagina3', { templateUrl: 'Views/pagina3.html' })
    .otherwise({ redirectTo: '/' });
}])
.component('appHeader', {
  templateUrl: 'Views/header.html',
  controller: function(){ /* ... */ }
})
.component('appFooter', {
  templateUrl: 'Views/footer.html',
  controller: function(){ /* ... */ }
});