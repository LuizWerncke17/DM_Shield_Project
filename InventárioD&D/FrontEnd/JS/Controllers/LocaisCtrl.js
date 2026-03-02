angular.module('DMShield').controller('LocaisCtrl', function($scope, $http, $location, $routeParams, LocalService, CombateService) {

    // start by retrieving whatever is stored in the service (will create if needed)
    $scope.local = LocalService.getLocal();

    // helper so the view can always access the current object
    $scope.getLocal = function() { return LocalService.getLocal(); };

    // optionally reset the container
    $scope.novoLocal = function() {
        $scope.local = LocalService.criarNovoLocalModelo();
    };

    // collections for lookup/autocomplete
    $scope.availableNpcs = [];
    $scope.availableInimigos = [];
    $scope.availableItens = [];
    $scope.availableConsumiveis = [];
    $scope.availableAnotacoes = [];
    $scope.locaisSalvos = [];

    $scope.inimigoFichaSelecionada = null;
    $scope.npcFichaSelecionada = null;
    $scope.itemFichaSelecionada = null;
    $scope.consumivelFichaSelecionada = null;
    $scope.anotacaoFichaSelecionada = null;
    $scope.combate = CombateService.getCombate();

    $scope.carregarDisponiveis = function() {
        $http.get('http://localhost:3000/NPCs').then(res => $scope.availableNpcs = res.data);
        $http.get('http://localhost:3000/inimigos').then(res => {
            $scope.availableInimigos = res.data;
            console.log('loaded availableInimigos', $scope.availableInimigos.length);
        });
        $http.get('http://localhost:3000/Itens').then(res => $scope.availableItens = res.data);
        $http.get('http://localhost:3000/Consumiveis').then(res => $scope.availableConsumiveis = res.data);
        $http.get('http://localhost:3000/anotacoes').then(res => $scope.availableAnotacoes = res.data);
    };
    $scope.carregarDisponiveis();

    $scope.carregarLocais = function() {
        $http.get('http://localhost:3000/locais')
            .then(function(res) {
                $scope.locaisSalvos = res.data;
            })
            .catch(function(err) {
                console.error(err);
                alert('Erro ao carregar locais');
            });
    };
    $scope.carregarLocais();

    // helpers to add by name (case-insensitive match)
    function findByName(list, name) {
        console.log('findByName', name, list.length);
        if (!name) return null;
        name = name.toLowerCase();
        // return exact or first partial match
        var exact = list.find(i => {
            var valor = (i.nome || i.titulo || '').toLowerCase();
            return valor === name;
        });
        if (exact) return exact;
        var partial = list.find(i => {
            var valor = (i.nome || i.titulo || '').toLowerCase();
            return valor.indexOf(name) !== -1;
        });
        if (partial) return partial;
        return null;
    }

    $scope.addNpcByName = function() {
        var item = findByName($scope.availableNpcs, $scope.npcNome);
        if (item) {
            LocalService.adicionarNpc(item);
            $scope.npcFichaSelecionada = angular.copy(item);
        } else {
            alert('NPC nao encontrado');
        }
        $scope.npcNome = '';
    };

    $scope.addInimigoByName = function() {
        var item = findByName($scope.availableInimigos, $scope.inimigoNome);
        if (item) {
            LocalService.adicionarInimigo(item);
            $scope.inimigoFichaSelecionada = angular.copy(item);
        } else {
            alert('Inimigo nao encontrado');
        }
        $scope.inimigoNome = '';
    };

    $scope.inimigoNome = '';

    $scope.selecionarNpcPorNome = function() {
        $scope.npcFichaSelecionada = findByName($scope.availableNpcs, $scope.npcNome);
    };

    $scope.selecionarInimigoPorNome = function() {
        $scope.inimigoFichaSelecionada = findByName($scope.availableInimigos, $scope.inimigoNome);
    };

    $scope.selecionarItemPorNome = function() {
        $scope.itemFichaSelecionada = findByName($scope.availableItens, $scope.itemNome);
    };

    $scope.selecionarConsumivelPorNome = function() {
        $scope.consumivelFichaSelecionada = findByName($scope.availableConsumiveis, $scope.consumivelNome);
    };

    $scope.selecionarAnotacaoPorTitulo = function() {
        $scope.anotacaoFichaSelecionada = findByName($scope.availableAnotacoes, $scope.anotacaoTitulo);
    };

    $scope.addItemByName = function() {
        var item = findByName($scope.availableItens, $scope.itemNome);
        if (item) {
            LocalService.adicionarItem(item);
            $scope.itemFichaSelecionada = angular.copy(item);
        } else {
            alert('Item nao encontrado');
        }
        $scope.itemNome = '';
    };

    $scope.addConsumivelByName = function() {
        var item = findByName($scope.availableConsumiveis, $scope.consumivelNome);
        if (item) {
            LocalService.adicionarConsumivel(item);
            $scope.consumivelFichaSelecionada = angular.copy(item);
        } else {
            alert('Consumivel nao encontrado');
        }
        $scope.consumivelNome = '';
    };

    $scope.addAnotacaoByTitulo = function() {
        var anotacao = findByName($scope.availableAnotacoes, $scope.anotacaoTitulo);
        if (anotacao) {
            LocalService.adicionarAnotacao(anotacao);
            $scope.anotacaoFichaSelecionada = angular.copy(anotacao);
        } else {
            alert('Anotacao nao encontrada');
        }
        $scope.anotacaoTitulo = '';
    };

    $scope.salvarLocal = function() {
        var localAtual = angular.copy(LocalService.getLocal());
        var request;
        var emEdicao = !!localAtual.id;

        if (emEdicao) {
            request = $http.put('http://localhost:3000/locais/' + localAtual.id, localAtual);
        } else {
            request = $http.post('http://localhost:3000/locais', localAtual);
        }

        request.then(function(res) {
            if (res && res.data && res.data.id) {
                localAtual.id = res.data.id;
                LocalService.definirLocal(localAtual);
            }
            alert(emEdicao ? 'Local atualizado!' : 'Local salvo!');
            $scope.carregarLocais();
        }).catch(function(err) {
            console.error(err);
            alert('Erro ao salvar local');
        });
    };

    $scope.editarLocal = function(localSalvo) {
        if (!localSalvo) return;
        LocalService.definirLocal(localSalvo);
        $scope.local = LocalService.getLocal();
        $location.path('/AdicionarLocal');
    };

    $scope.removerLocal = function(localSalvo) {
        if (!localSalvo || !localSalvo.id) return;
        if (!window.confirm('Tem certeza que deseja remover este local?')) return;

        $http.delete('http://localhost:3000/locais/' + localSalvo.id)
            .then(function() {
                if (LocalService.getLocal().id === localSalvo.id) {
                    $scope.novoLocal();
                }
                $scope.carregarLocais();
                alert('Local removido!');
            })
            .catch(function(err) {
                console.error(err);
                alert('Erro ao remover local');
            });
    };

    $scope.adicionarNpcAoLocal = function(npc) {
        LocalService.adicionarNpc(npc);
    };

    $scope.adicionarInimigoAoLocal = function(inimigo) {
        LocalService.adicionarInimigo(inimigo);
    };

    $scope.adicionarItemAoLocal = function(item) {
        LocalService.adicionarItem(item);
    };

    $scope.adicionarConsumivelAoLocal = function(consumivel) {
        LocalService.adicionarConsumivel(consumivel);
    };

    $scope.adicionarAnotacaoAoLocal = function(anotacao) {
        LocalService.adicionarAnotacao(anotacao);
    };




    $scope.removerInimigoLocal = function(inimigo) {
        if (!inimigo || !inimigo.instanceId) return;
        LocalService.removerInimigo(inimigo.instanceId);
    };

    $scope.removerNpcLocal = function(npc) {
        if (!npc || !npc.instanceId) return;
        LocalService.removerNpc(npc.instanceId);
    };

    $scope.removerItemLocal = function(item) {
        if (!item || !item.instanceId) return;
        LocalService.removerItem(item.instanceId);
    };

    $scope.removerConsumivelLocal = function(consumivel) {
        if (!consumivel || !consumivel.instanceId) return;
        LocalService.removerConsumivel(consumivel.instanceId);
    };

    $scope.removerAnotacaoLocal = function(anotacao) {
        if (!anotacao || !anotacao.instanceId) return;
        LocalService.removerAnotacao(anotacao.instanceId);
    };




    $scope.getFichasUnicasLocal = function() {
        return LocalService.getFichasUnicasInimigos();
    };

    $scope.getFichasUnicasNpcsLocal = function() {
        return LocalService.getFichasUnicasNpcs();
    };

    $scope.getFichasUnicasItensLocal = function() {
        return LocalService.getFichasUnicasItens();
    };

    $scope.getFichasUnicasConsumiveisLocal = function() {
        return LocalService.getFichasUnicasConsumiveis();
    };

    $scope.getFichasUnicasAnotacoesLocal = function() {
        return LocalService.getFichasUnicasAnotacoes();
    };




    $scope.adicionarAoCombate = function(entidade) {
        if (!entidade) return;
        if (!$scope.combate.ativo) {
            alert('Inicie um combate primeiro!');
            return;
        }
        CombateService.adicionarInimigo(entidade);
    };

    $scope.calcularMod = function(valor) {
        if (valor === undefined || valor === null) return 0;
        return Math.floor((valor - 10) / 2);
    };
});
