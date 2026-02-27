angular.module('DMShield').controller('NPCsCtrl', function($scope, $http, $location, $routeParams, CombateService) {

  function criarNovoNPCModelo() {
    return {
      nome: '',
      raca: '',
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
        informacoes: "Nenhuma",
        habilidades: [],
        resistencias: "Nenhuma",
        imunidades: "Nenhuma",
        ataques: [],
      }
    };
  }

  $scope.modoEdicao = false;
  $scope.npcEditandoId = null;
  $scope.novoNPC = criarNovoNPCModelo();
  $scope.npcs = [];
  $scope.combate = CombateService.getCombate();

  $scope.adicionarNPCAoCombate = function(npc) {
    if (!npc) return;
    if (!$scope.combate.ativo) {
      alert("Inicie um combate primeiro!");
      return;
    }

    CombateService.adicionarInimigo(npc);
  };

  $scope.calcularMod = function(valor) {
    if (valor === undefined || valor === null) return 0;
    return Math.floor((valor - 10) / 2);
  };

  $scope.adicionarAtaque = function() {
    $scope.novoNPC.dados.ataques.push({ nome: '', dano: '' });
  };

  $scope.removerAtaque = function(index) {
    $scope.novoNPC.dados.ataques.splice(index, 1);
  };

  $scope.adicionarHabilidade = function() {
    $scope.novoNPC.dados.habilidades.push({ descricao: '' });
  };

  $scope.removerHabilidade = function(index) {
    $scope.novoNPC.dados.habilidades.splice(index, 1);
  };

  $scope.carregarNPCs = function() {
    return $http.get('http://localhost:3000/NPCs')
      .then(function(res) {
        $scope.npcs = res.data;
      })
      .catch(function(err) {
        console.error(err);
      });
  };

  $scope.abrirCriacaoNPC = function() {
    $scope.modoEdicao = false;
    $scope.npcEditandoId = null;
    $scope.novoNPC = criarNovoNPCModelo();
    $location.path('/AdicionarNPC').search({});
  };

  $scope.editarNPC = function(npc) {
    if (!npc || !npc.id) return;
    $location.path('/AdicionarNPC').search({ id: npc.id });
  };

  $scope.cancelarEdicaoNPC = function() {
    $scope.modoEdicao = false;
    $scope.npcEditandoId = null;
    $scope.novoNPC = criarNovoNPCModelo();
    $location.path('/NPCs').search({});
  };

  $scope.removerNPC = function(npc) {
    if (!npc || !npc.id) return;
    if (!window.confirm('Tem certeza que deseja remover este NPC?')) return;

    $http.delete('http://localhost:3000/NPCs/' + npc.id)
      .then(function() {
        $scope.npcs = $scope.npcs.filter(i => i.id !== npc.id);
        alert("NPC removido!");
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao remover NPC.");
      });
  };

  $scope.salvarNPC = function() {
    var payload = angular.copy($scope.novoNPC);
    delete payload.id;

    var request;
    if ($scope.modoEdicao && $scope.npcEditandoId) {
      request = $http.put('http://localhost:3000/NPCs/' + $scope.npcEditandoId, payload);
    } else {
      request = $http.post('http://localhost:3000/NPCs', payload);
    }

    request.then(function() {
      alert($scope.modoEdicao ? "NPC atualizado!" : "NPC salvo!");
      $location.path('/NPCs').search({});
    }).catch(function(err) {
      console.error(err);
      alert("Erro ao salvar NPC.");
    });
  };

  function carregarNPCParaEdicao(id) {
    $http.get('http://localhost:3000/NPCs/' + id)
      .then(function(res) {
        $scope.modoEdicao = true;
        $scope.npcEditandoId = res.data.id;
        $scope.novoNPC = res.data;
      })
      .catch(function(err) {
        console.error(err);
        alert("Erro ao carregar NPC para edição.");
        $scope.cancelarEdicaoNPC();
      });
  }

  $scope.carregarNPCs();

  if ($location.path() === '/AdicionarNPC') {
    var idEdicao = $routeParams.id;
    if (idEdicao) {
      carregarNPCParaEdicao(idEdicao);
    }
  }
});
