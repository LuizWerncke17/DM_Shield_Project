angular.module('DMShield').factory('SessaoService', function() {
    var sessao = null;

    function criarModelo() {
        return {
            id: null,
            nome: '',
            descricao: '',
            dados: {
                locais: []
            }
        };
    }

    function normalizarSessao(origem) {
        var base = criarModelo();
        var dadosOrigem = (origem && origem.dados) || {};

        base.id = origem && origem.id ? origem.id : null;
        base.nome = (origem && origem.nome) || '';
        base.descricao = (origem && origem.descricao) || '';
        base.dados.locais = angular.copy(dadosOrigem.locais) || [];

        return base;
    }

    function ensureSessao() {
        if (!sessao) {
            sessao = criarModelo();
        }
        return sessao;
    }

    return {
        criarNovaSessaoModelo: function() {
            sessao = criarModelo();
            return sessao;
        },

        definirSessao: function(novaSessao) {
            sessao = normalizarSessao(novaSessao);
            return sessao;
        },

        getSessao: function() {
            return ensureSessao();
        },

        adicionarLocal: function(local) {
            if (!local) return;

            var copia = angular.copy(local);
            copia.instanceId = Date.now() + Math.random();
            copia.localId = local.id;
            copia.infoBasica = {
                nome: local.nome || 'Sem nome',
                tipo: local.tipo || 'Sem tipo',
                descricao: local.descricao || 'Sem descricao'
            };

            ensureSessao().dados.locais.push(copia);
            return copia;
        },

        removerLocal: function(instanceId) {
            if (!instanceId) return;
            var sessaoAtual = ensureSessao();
            sessaoAtual.dados.locais = sessaoAtual.dados.locais.filter(function(l) {
                return l.instanceId !== instanceId;
            });
        }
    };
});
