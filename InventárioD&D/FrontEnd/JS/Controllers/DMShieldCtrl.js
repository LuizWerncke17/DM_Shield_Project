angular.module('DMShield').controller('DMShieldCtrl', function($scope, $location, CombateService) {

  $scope.iniciarCombate = function() {
      CombateService.iniciar();
      alert("Combate iniciado!");
  };

  $scope.irParaCombate = function() {
      $location.path('/combate');
  };

  $scope.combate = CombateService.getCombate();

  $scope.adicionarAoCombate = function(inimigo) {
    if (!$scope.combate.ativo) {
        alert("Inicie um combate primeiro!");
        return;
    }

    CombateService.adicionarInimigo(inimigo);
  };

});
