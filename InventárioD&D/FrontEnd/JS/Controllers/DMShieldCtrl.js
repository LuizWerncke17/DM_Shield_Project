angular.module('DMShield').controller('DMShieldCtrl', function($scope, $http) {
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
        resistencias: [],
        imunidades: [],
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


  $scope.adicionarResistencia = function() {
    $scope.novoInimigo.dados.resistencias.push({
      descricao: '',
    });
  };
  $scope.removerResistencia = function(index) {
    $scope.novoInimigo.dados.resistencias.splice(index, 1);
  };


  $scope.adicionarImunidade = function() {
    $scope.novoInimigo.dados.imunidades.push({
      descricao: '',
    });
  };
  $scope.removerImunidade = function(index) {
    $scope.novoInimigo.dados.imunidades.splice(index, 1);
  };

  // salvar no backend
  $scope.salvarInimigo = function() {
    $http.post('http://localhost:3000/inimigos', $scope.novoInimigo)
      .then(function(response) {
        alert("Inimigo salvo!");

        // resetar formulário
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
            resistencias: [],
            imunidades: [],
            ataques: [],
            nd: "",
            xp: "",
          }
        };

      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao salvar");
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

    $scope.carregarInimigos();

});