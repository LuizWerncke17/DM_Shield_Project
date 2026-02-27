angular.module('DMShield').controller('RecursosCtrl', function($scope, $http, $location, $routeParams) {

  // =========================
  // MODELOS
  // =========================
  function criarNovoItemModelo() {
    return {
      nome: "",
      tipo: "",
      descricao: "",
      valor: "",
      raridade: "",
      efeito: "Nenhum"
    };
  }

  function criarNovoConsumivelModelo() {
    return {
      nome: "",
      tipo: "",
      descricao: "",
      efeito: "Nenhum",
      duracao: "Instantânea",
      valor: ""
    };
  }

  // =========================
  // ESTADOS
  // =========================
  $scope.modoEdicao = false;

  $scope.itemEditandoId = null;
  $scope.consumivelEditandoId = null;

  $scope.novoItem = criarNovoItemModelo();
  $scope.novoConsumivel = criarNovoConsumivelModelo();

  $scope.itens = [];
  $scope.consumiveis = [];

  $scope.filtroTipoItem = function(item) {
    if (!item) return false;
    if (!$scope.buscaTipo) return true;
    return item.tipo === $scope.buscaTipo;
  };

  $scope.filtroTipoConsumivel = function(c) {
    if (!c) return false;
    if (!$scope.buscaTipo) return true;
    return c.tipo === $scope.buscaTipo;
  };

  // =========================
  // ITENS
  // =========================

  $scope.carregarItens = function() {
    $http.get('http://localhost:3000/Itens')
      .then(function(res) {
        $scope.itens = res.data;
      })
      .catch(function(err) {
        console.error(err);
      });
  };

  $scope.abrirCriacaoItem = function() {
    $scope.modoEdicao = false;
    $scope.itemEditandoId = null;
    $scope.novoItem = criarNovoItemModelo();
    $location.path('/AdicionarItem').search({});
  };

  $scope.editarItem = function(item) {
    $location.path('/AdicionarItem').search({ id: item.id });
  };

  $scope.cancelarEdicaoItem = function() {
    $scope.modoEdicao = false;
    $scope.itemEditandoId = null;
    $scope.novoItem = criarNovoItemModelo();
    $location.path('/Itens').search({});
  };

  $scope.removerItem = function(item) {
    if (!confirm("Remover este item?")) return;

    $http.delete('http://localhost:3000/Itens/' + item.id)
      .then(function() {
        $scope.itens = $scope.itens.filter(i => i.id !== item.id);
        alert("Item removido!");
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao remover item.");
      });
  };

  $scope.salvarItem = function() {
    var payload = angular.copy($scope.novoItem);
    delete payload.id;

    var request;

    if ($scope.modoEdicao && $scope.itemEditandoId) {
      request = $http.put('http://localhost:3000/Itens/' + $scope.itemEditandoId, payload);
    } else {
      request = $http.post('http://localhost:3000/Itens', payload);
    }

    request.then(function() {
      alert($scope.modoEdicao ? "Item atualizado!" : "Item criado!");
      $location.path('/Itens').search({});
    }).catch(function(err) {
      console.error(err);
      alert("Erro ao salvar item.");
    });
  };

  function carregarItemParaEdicao(id) {
    $http.get('http://localhost:3000/Itens/' + id)
      .then(function(res) {
        $scope.modoEdicao = true;
        $scope.itemEditandoId = res.data.id;
        $scope.novoItem = res.data;
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao carregar item.");
        $scope.cancelarEdicaoItem();
      });
  }

  // =========================
  // CONSUMÍVEIS
  // =========================

  $scope.carregarConsumiveis = function() {
    $http.get('http://localhost:3000/Consumiveis')
      .then(function(res) {
        $scope.consumiveis = res.data;
      })
      .catch(function(err) {
        console.error(err);
      });
  };

  $scope.abrirCriacaoConsumivel = function() {
    $scope.modoEdicao = false;
    $scope.consumivelEditandoId = null;
    $scope.novoConsumivel = criarNovoConsumivelModelo();
    $location.path('/AdicionarConsumivel').search({});
  };

  $scope.editarConsumivel = function(c) {
    $location.path('/AdicionarConsumivel').search({ id: c.id });
  };

  $scope.cancelarEdicaoConsumivel = function() {
    $scope.modoEdicao = false;
    $scope.consumivelEditandoId = null;
    $scope.novoConsumivel = criarNovoConsumivelModelo();
    $location.path('/Consumiveis').search({});
  };

  $scope.removerConsumivel = function(c) {
    if (!confirm("Remover este consumível?")) return;

    $http.delete('http://localhost:3000/Consumiveis/' + c.id)
      .then(function() {
        $scope.consumiveis = $scope.consumiveis.filter(i => i.id !== c.id);
        alert("Consumível removido!");
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao remover consumível.");
      });
  };

  $scope.salvarConsumivel = function() {
    var payload = angular.copy($scope.novoConsumivel);
    delete payload.id;

    var request;

    if ($scope.modoEdicao && $scope.consumivelEditandoId) {
      request = $http.put('http://localhost:3000/Consumiveis/' + $scope.consumivelEditandoId, payload);
    } else {
      request = $http.post('http://localhost:3000/Consumiveis', payload);
    }

    request.then(function() {
      alert($scope.modoEdicao ? "Consumível atualizado!" : "Consumível criado!");
      $location.path('/Consumiveis').search({});
    }).catch(function(err) {
      console.error(err);
      alert("Erro ao salvar consumível.");
    });
  };

  function carregarConsumivelParaEdicao(id) {
    $http.get('http://localhost:3000/Consumiveis/' + id)
      .then(function(res) {
        $scope.modoEdicao = true;
        $scope.consumivelEditandoId = res.data.id;
        $scope.novoConsumivel = res.data;
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao carregar consumível.");
        $scope.cancelarEdicaoConsumivel();
      });
  }

  // =========================
  // INICIALIZAÇÃO
  // =========================

  if ($location.path() === '/Itens') {
    $scope.carregarItens();
  }

  if ($location.path() === '/Consumiveis') {
    $scope.carregarConsumiveis();
  }

  if ($location.path() === '/AdicionarItem') {
    var id = $routeParams.id;
    if (id) carregarItemParaEdicao(id);
  }

  if ($location.path() === '/AdicionarConsumivel') {
    var id = $routeParams.id;
    if (id) carregarConsumivelParaEdicao(id);
  }

});
