angular.module('DMShield').controller('DMShieldCtrl', function($scope, $http, $location, CombateService) {

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

  $scope.app = "DM Shield";

  // modelo inicial
  $scope.novoInimigo = {
    nome: '',
    tipo: '',
    vida: "",
    ca: "",
    dados: {
        atributos: {
            forca: "",
            destreza: "",
            constituicao: "",
            inteligencia: "",
            sabedoria: "",
            carisma: ""
        },
        habilidades: [],
        resistencias: "Nenhuma",
        imunidades: "Nenhuma",
        ataques: [],
        nd: "",
        xp: "",
    }
  };


  $scope.adicionarAtaque = function() {
    $scope.novoInimigo.dados.ataques.push({
      nome: '',
      dano: ''
    });
  };
  $scope.removerAtaque = function(index) {
    $scope.novoInimigo.dados.ataques.splice(index, 1);
  };


  $scope.adicionarHabilidade = function() {
    $scope.novoInimigo.dados.habilidades.push({
      descricao: '',
    });
  };
  $scope.removerHabilidade = function(index) {
    $scope.novoInimigo.dados.habilidades.splice(index, 1);
  };

  // salvar no backend
  $scope.salvarInimigo = function() {
    $http.post('http://localhost:3000/inimigos', $scope.novoInimigo)
      .then(() => {
        alert("Inimigo Salvo!")
        $scope.carregarInimigos();
        $location.path('/Inimigos');
      });
    };

    $scope.calcularMod = function(valor) {
        if (valor === undefined || valor === null) return 0;
        return Math.floor((valor - 10) / 2);
    };

    $scope.inimigos = [];

    $scope.carregarInimigos = function() {
    $http.get('http://localhost:3000/inimigos')
        .then(function(res) {
        $scope.inimigos = res.data;
        console.log($scope.inimigos);
        })
        .catch(function(err) {
        console.error(err);
        });
    };

    $scope.buscarNome = function(inimigo) {
      if (!$scope.buscaNome) return true;
      return inimigo.dados.nome >= $scope.buscaNome;
    };

  $scope.carregarInimigos();

});

