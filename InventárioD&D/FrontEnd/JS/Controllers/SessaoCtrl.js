angular.module('DMShield').controller('SessaoCtrl', function($scope, $http, $location, $routeParams, SessaoService, LocalService) {
    $scope.sessao = SessaoService.getSessao();
    $scope.sessoes = [];
    $scope.availableLocais = [];
    $scope.localSelecionadoPreview = null;
    $scope.localNome = '';

    $scope.getSessao = function() {
        return SessaoService.getSessao();
    };

    $scope.novaSessao = function() {
        $scope.sessao = SessaoService.criarNovaSessaoModelo();
        $scope.localSelecionadoPreview = null;
        $scope.localNome = '';
    };

    $scope.carregarLocaisDisponiveis = function() {
        $http.get('http://localhost:3000/locais')
            .then(function(res) {
                $scope.availableLocais = res.data;
            })
            .catch(function(err) {
                console.error(err);
                alert('Erro ao carregar locais');
            });
    };

    $scope.carregarSessoes = function() {
        $http.get('http://localhost:3000/sessoes')
            .then(function(res) {
                $scope.sessoes = res.data;
            })
            .catch(function(err) {
                console.error(err);
                alert('Erro ao carregar sessoes');
            });
    };

    function findLocalByName(nome) {
        if (!nome) return null;
        var termo = nome.toLowerCase();
        var exato = $scope.availableLocais.find(function(l) {
            return l.nome && l.nome.toLowerCase() === termo;
        });
        if (exato) return exato;

        return $scope.availableLocais.find(function(l) {
            return l.nome && l.nome.toLowerCase().indexOf(termo) !== -1;
        }) || null;
    }

    $scope.selecionarLocalPorNome = function() {
        $scope.localSelecionadoPreview = findLocalByName($scope.localNome);
    };

    $scope.adicionarLocalByName = function() {
        var local = findLocalByName($scope.localNome);
        if (!local) {
            alert('Local nao encontrado');
            return;
        }

        SessaoService.adicionarLocal(local);
        $scope.localSelecionadoPreview = angular.copy(local);
        $scope.localNome = '';
    };

    $scope.removerLocalSessao = function(local) {
        if (!local || !local.instanceId) return;
        SessaoService.removerLocal(local.instanceId);
    };

    $scope.salvarSessao = function() {
        var sessaoAtual = angular.copy(SessaoService.getSessao());
        var emEdicao = !!sessaoAtual.id;
        var request = emEdicao
            ? $http.put('http://localhost:3000/sessoes/' + sessaoAtual.id, sessaoAtual)
            : $http.post('http://localhost:3000/sessoes', sessaoAtual);

        request.then(function(res) {
            if (res && res.data && res.data.id) {
                sessaoAtual.id = res.data.id;
                SessaoService.definirSessao(sessaoAtual);
            }
            alert(emEdicao ? 'Sessao atualizada!' : 'Sessao salva!');
            $scope.carregarSessoes();
        }).catch(function(err) {
            console.error(err);
            alert('Erro ao salvar sessao');
        });
    };

    $scope.removerSessao = function(sessao) {
        if (!sessao || !sessao.id) return;
        if (!window.confirm('Remover esta sessao?')) return;

        $http.delete('http://localhost:3000/sessoes/' + sessao.id)
            .then(function() {
                $scope.carregarSessoes();
            })
            .catch(function(err) {
                console.error(err);
                alert('Erro ao remover sessao');
            });
    };

    $scope.editarSessao = function(sessao) {
        if (!sessao || !sessao.id) return;
        $http.get('http://localhost:3000/sessoes/' + sessao.id)
            .then(function(res) {
                SessaoService.definirSessao(res.data);
                $scope.sessao = SessaoService.getSessao();
                $location.path('/AdicionarSessao').search({ id: sessao.id });
            })
            .catch(function(err) {
                console.error(err);
                alert('Erro ao carregar sessao');
            });
    };

    $scope.abrirLocal = function(local) {
        if (!local) return;

        if (local.id) {
            $http.get('http://localhost:3000/locais/' + local.id)
                .then(function(res) {
                    LocalService.definirLocal(res.data);
                    $location.path('/AdicionarLocal');
                })
                .catch(function(err) {
                    console.error(err);
                    alert('Erro ao abrir local');
                });
            return;
        }

        LocalService.definirLocal(local);
        $location.path('/AdicionarLocal');
    };

    $scope.carregarLocaisDisponiveis();
    $scope.carregarSessoes();

    if ($location.path() === '/AdicionarSessao') {
        var idEdicao = $routeParams.id;
        if (idEdicao) {
            $http.get('http://localhost:3000/sessoes/' + idEdicao)
                .then(function(res) {
                    SessaoService.definirSessao(res.data);
                    $scope.sessao = SessaoService.getSessao();
                })
                .catch(function(err) {
                    console.error(err);
                    alert('Erro ao carregar sessao para edicao');
                });
        }
    }
});
