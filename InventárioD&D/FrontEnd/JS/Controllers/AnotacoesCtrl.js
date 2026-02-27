angular.module('DMShield').controller('AnotacoesCtrl', function($scope, $http, $location, $routeParams) {

  function criarNovaAnotacaoModelo() {
    return {
      titulo: '',
      tipo: '',
      informacoes: "Nenhuma",
    };
  }

  $scope.modoEdicao = false;
  $scope.anotacaoEditandoId = null;
  $scope.novaAnotacao = criarNovaAnotacaoModelo();
  $scope.anotacoes = [];

  $scope.carregarAnotacoes = function() {
    return $http.get('http://localhost:3000/Anotacoes')
      .then(function(res) {
        $scope.anotacoes = res.data;
      })
      .catch(function(err) {
        console.error(err);
      });
  };

  $scope.abrirCriacaoAnotacao = function() {
    $scope.modoEdicao = false;
    $scope.anotacaoEditandoId = null;
    $scope.novaAnotacao = criarNovaAnotacaoModelo();
    $location.path('/AdicionarAnotacao').search({});
  };

  $scope.editarAnotacao = function(anotacao) {
    if (!anotacao || !anotacao.id) return;
    $location.path('/AdicionarAnotacao').search({ id: anotacao.id });
  };

  $scope.cancelarEdicaoAnotacao = function() {
    $scope.modoEdicao = false;
    $scope.anotacaoEditandoId = null;
    $scope.novaAnotacao = criarNovaAnotacaoModelo();
    $location.path('/Anotacoes').search({});
  };

  $scope.removerAnotacao = function(anotacao) {
    if (!anotacao || !anotacao.id) return;
    if (!window.confirm('Tem certeza que deseja remover esta anotação?')) return;

    $http.delete('http://localhost:3000/Anotacoes/' + anotacao.id)
      .then(function() {
        $scope.anotacoes = $scope.anotacoes.filter(i => i.id !== anotacao.id);
        alert("Anotação removida!");
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao remover Anotação.");
      });
  };

  $scope.salvarAnotacao = function() {
    var payload = angular.copy($scope.novaAnotacao);
    delete payload.id;

    var request;
    if ($scope.modoEdicao && $scope.anotacaoEditandoId) {
      request = $http.put('http://localhost:3000/Anotacoes/' + $scope.anotacaoEditandoId, payload);
    } else {
      request = $http.post('http://localhost:3000/Anotacoes', payload);
    }

    request.then(function() {
      alert($scope.modoEdicao ? "Anotação atualizado!" : "Anotação salvo!");
      $location.path('/Anotacoes').search({});
    }).catch(function(err) {
      console.error(err);
      alert("Erro ao salvar anotação.");
    });
  };

  function carregarAnotacaoParaEdicao(id) {
    $http.get('http://localhost:3000/Anotacoes/' + id)
      .then(function(res) {
        $scope.modoEdicao = true;
        $scope.anotacaoEditandoId = res.data.id;
        $scope.novaAnotacao = res.data;
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao carregar anotação para edição.");
        $scope.cancelarEdicaoAnotacao();
      });
  }

  $scope.carregarAnotacoes();

  if ($location.path() === '/AdicionarAnotacao') {
    var idEdicao = $routeParams.id;
    if (idEdicao) {
      carregarAnotacaoParaEdicao(idEdicao);
    }
  }
});
