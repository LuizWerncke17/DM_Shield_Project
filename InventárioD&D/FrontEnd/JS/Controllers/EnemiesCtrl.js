angular.module('DMShield').controller('EnemiesCtrl', function($scope, $http, $location, $routeParams) {

  function criarNovoInimigoModelo() {
    return {
      nome: '',
      tipo: '',
      vida: "",
      ca: "",
      dados: {
        atributos: {
          forca: 10,
          destreza: 10,
          constituicao: 10,
          inteligencia: 10,
          sabedoria: 10,
          carisma: 10
        },
        habilidades: [],
        resistencias: "Nenhuma",
        imunidades: "Nenhuma",
        ataques: [],
        nd: "",
        xp: ""
      }
    };
  }

  $scope.modoEdicao = false;
  $scope.inimigoEditandoId = null;
  $scope.novoInimigo = criarNovoInimigoModelo();
  $scope.inimigos = [];

  $scope.calcularMod = function(valor) {
    if (valor === undefined || valor === null) return 0;
    return Math.floor((valor - 10) / 2);
  };

  $scope.adicionarAtaque = function() {
    $scope.novoInimigo.dados.ataques.push({ nome: '', dano: '' });
  };

  $scope.removerAtaque = function(index) {
    $scope.novoInimigo.dados.ataques.splice(index, 1);
  };

  $scope.adicionarHabilidade = function() {
    $scope.novoInimigo.dados.habilidades.push({ descricao: '' });
  };

  $scope.removerHabilidade = function(index) {
    $scope.novoInimigo.dados.habilidades.splice(index, 1);
  };

  $scope.carregarInimigos = function() {
    return $http.get('http://localhost:3000/inimigos')
      .then(function(res) {
        $scope.inimigos = res.data;
      })
      .catch(function(err) {
        console.error(err);
      });
  };

  $scope.abrirCriacaoInimigo = function() {
    $scope.modoEdicao = false;
    $scope.inimigoEditandoId = null;
    $scope.novoInimigo = criarNovoInimigoModelo();
    $location.path('/AdicionarInimigo').search({});
  };

  $scope.editarInimigo = function(inimigo) {
    if (!inimigo || !inimigo.id) return;
    $location.path('/AdicionarInimigo').search({ id: inimigo.id });
  };

  $scope.cancelarEdicaoInimigo = function() {
    $scope.modoEdicao = false;
    $scope.inimigoEditandoId = null;
    $scope.novoInimigo = criarNovoInimigoModelo();
    $location.path('/Inimigos').search({});
  };

  $scope.removerInimigo = function(inimigo) {
    if (!inimigo || !inimigo.id) return;
    if (!window.confirm('Tem certeza que deseja remover este inimigo?')) return;

    $http.delete('http://localhost:3000/inimigos/' + inimigo.id)
      .then(function() {
        $scope.inimigos = $scope.inimigos.filter(i => i.id !== inimigo.id);
        alert("Inimigo removido!");
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao remover inimigo.");
      });
  };

  $scope.salvarInimigo = function() {
    var payload = angular.copy($scope.novoInimigo);
    delete payload.id;

    var request;
    if ($scope.modoEdicao && $scope.inimigoEditandoId) {
      request = $http.put('http://localhost:3000/inimigos/' + $scope.inimigoEditandoId, payload);
    } else {
      request = $http.post('http://localhost:3000/inimigos', payload);
    }

    request.then(function() {
      alert($scope.modoEdicao ? "Inimigo atualizado!" : "Inimigo salvo!");
      $location.path('/Inimigos').search({});
    }).catch(function(err) {
      console.error(err);
      alert("Erro ao salvar inimigo.");
    });
  };

  function carregarInimigoParaEdicao(id) {
    $http.get('http://localhost:3000/inimigos/' + id)
      .then(function(res) {
        $scope.modoEdicao = true;
        $scope.inimigoEditandoId = res.data.id;
        $scope.novoInimigo = res.data;
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao carregar inimigo para edição.");
        $scope.cancelarEdicaoInimigo();
      });
  }

  $scope.carregarInimigos();

  if ($location.path() === '/AdicionarInimigo') {
    var idEdicao = $routeParams.id;
    if (idEdicao) {
      carregarInimigoParaEdicao(idEdicao);
    }
  }
});
