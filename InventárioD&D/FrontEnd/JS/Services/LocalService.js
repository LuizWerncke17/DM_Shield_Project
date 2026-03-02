angular.module('DMShield').factory('LocalService', function() {
    var local = null;

    function criarDadosBase() {
        return {
            npcs: [],
            inimigos: [],
            itens: [],
            consumiveis: [],
            anotacoes: [],
        };
    }

    function criarModelo() {
        return {
            id: null,
            nome: '',
            tipo: '',
            descricao: 'Nenhuma',
            dados: criarDadosBase()
        };
    }

    function normalizarLocal(origem) {
        var base = criarModelo();
        var dadosOrigem = (origem && origem.dados) || {};

        base.id = origem && origem.id ? origem.id : null;
        base.nome = (origem && origem.nome) || '';
        base.tipo = (origem && origem.tipo) || '';
        base.descricao = (origem && origem.descricao) || 'Nenhuma';
        base.dados.npcs = angular.copy(dadosOrigem.npcs) || [];
        base.dados.inimigos = angular.copy(dadosOrigem.inimigos) || [];
        base.dados.itens = angular.copy(dadosOrigem.itens) || [];
        base.dados.consumiveis = angular.copy(dadosOrigem.consumiveis) || [];
        base.dados.anotacoes = angular.copy(dadosOrigem.anotacoes) || [];

        return base;
    }

    function ensureLocal() {
        if (!local) {
            local = criarModelo();
        }
        return local;
    }

    return {
        criarNovoLocalModelo: function() {
            local = criarModelo();
            return local;
        },

        definirLocal: function(novoLocal) {
            local = normalizarLocal(novoLocal);
            return local;
        },

        getLocal: function() {
            return ensureLocal();
        },

        adicionarNpc: function(npc) {
            if (!npc) return;
            var copia = angular.copy(npc);
            var localAtual = ensureLocal();
            var iguais = localAtual.dados.npcs.filter(function(n) {
                return n.npcId === npc.id;
            }).length;

            copia.instanceId = Date.now() + Math.random();
            copia.npcId = npc.id;
            copia.ficha = angular.copy(npc);
            copia.numero = iguais + 1;

            localAtual.dados.npcs.push(copia);
            return copia;
        },

        adicionarInimigo: function(inimigo) {
            if (!inimigo) return;
            var copia = angular.copy(inimigo);
            var localAtual = ensureLocal();
            var iguais = localAtual.dados.inimigos.filter(function(i) {
                return i.inimigoId === inimigo.id;
            }).length;

            copia.instanceId = Date.now() + Math.random();
            copia.inimigoId = inimigo.id;
            copia.ficha = angular.copy(inimigo);
            copia.numero = iguais + 1;

            localAtual.dados.inimigos.push(copia);
            return copia;
        },

        adicionarItem: function(item) {
            if (!item) return;
            var copia = angular.copy(item);
            var localAtual = ensureLocal();
            var iguais = localAtual.dados.itens.filter(function(i) {
                return i.itemId === item.id;
            }).length;

            copia.instanceId = Date.now() + Math.random();
            copia.itemId = item.id;
            copia.ficha = angular.copy(item);
            copia.numero = iguais + 1;

            localAtual.dados.itens.push(copia);
            return copia;
        },

        adicionarConsumivel: function(consumivel) {
            if (!consumivel) return;
            var copia = angular.copy(consumivel);
            var localAtual = ensureLocal();
            var iguais = localAtual.dados.consumiveis.filter(function(i) {
                return i.consumivelId === consumivel.id;
            }).length;

            copia.instanceId = Date.now() + Math.random();
            copia.consumivelId = consumivel.id;
            copia.ficha = angular.copy(consumivel);
            copia.numero = iguais + 1;

            localAtual.dados.consumiveis.push(copia);
            return copia;
        },

        adicionarAnotacao: function(anotacao) {
            if (!anotacao) return;
            var copia = angular.copy(anotacao);
            var localAtual = ensureLocal();
            var iguais = localAtual.dados.anotacoes.filter(function(a) {
                return a.anotacaoId === anotacao.id;
            }).length;

            copia.instanceId = Date.now() + Math.random();
            copia.anotacaoId = anotacao.id;
            copia.ficha = angular.copy(anotacao);
            copia.numero = iguais + 1;

            localAtual.dados.anotacoes.push(copia);
            return copia;
        },



        

        removerInimigo: function(instanceId) {
            if (!instanceId) return;
            var localAtual = ensureLocal();
            localAtual.dados.inimigos = localAtual.dados.inimigos.filter(function(i) {
                return i.instanceId !== instanceId;
            });
        },

        removerNpc: function(instanceId) {
            if (!instanceId) return;
            var localAtual = ensureLocal();
            localAtual.dados.npcs = localAtual.dados.npcs.filter(function(n) {
                return n.instanceId !== instanceId;
            });
        },

        removerItem: function(instanceId) {
            if (!instanceId) return;
            var localAtual = ensureLocal();
            localAtual.dados.itens = localAtual.dados.itens.filter(function(n) {
                return n.instanceId !== instanceId;
            });
        },

        removerConsumivel: function(instanceId) {
            if (!instanceId) return;
            var localAtual = ensureLocal();
            localAtual.dados.consumiveis = localAtual.dados.consumiveis.filter(function(n) {
                return n.instanceId !== instanceId;
            });
        },

        removerAnotacao: function(instanceId) {
            if (!instanceId) return;
            var localAtual = ensureLocal();
            localAtual.dados.anotacoes = localAtual.dados.anotacoes.filter(function(a) {
                return a.instanceId !== instanceId;
            });
        },





        getFichasUnicasInimigos: function() {
            var mapa = {};
            ensureLocal().dados.inimigos.forEach(function(i) {
                if (!mapa[i.inimigoId]) {
                    mapa[i.inimigoId] = i.ficha || i;
                }
            });
            return Object.keys(mapa).map(function(chave) {
                return mapa[chave];
            });
        },

        getFichasUnicasNpcs: function() {
            var mapa = {};
            ensureLocal().dados.npcs.forEach(function(n) {
                if (!mapa[n.npcId]) {
                    mapa[n.npcId] = n.ficha || n;
                }
            });
            return Object.keys(mapa).map(function(chave) {
                return mapa[chave];
            });
        },

        getFichasUnicasItens: function() {
            var mapa = {};
            ensureLocal().dados.itens.forEach(function(n) {
                if (!mapa[n.itemId]) {
                    mapa[n.itemId] = n.ficha || n;
                }
            });
            return Object.keys(mapa).map(function(chave) {
                return mapa[chave];
            });
        },

        getFichasUnicasConsumiveis: function() {
            var mapa = {};
            ensureLocal().dados.consumiveis.forEach(function(n) {
                if (!mapa[n.consumivelId]) {
                    mapa[n.consumivelId] = n.ficha || n;
                }
            });
            return Object.keys(mapa).map(function(chave) {
                return mapa[chave];
            });
        },

        getFichasUnicasAnotacoes: function() {
            var mapa = {};
            ensureLocal().dados.anotacoes.forEach(function(a) {
                if (!mapa[a.anotacaoId]) {
                    mapa[a.anotacaoId] = a.ficha || a;
                }
            });
            return Object.keys(mapa).map(function(chave) {
                return mapa[chave];
            });
        },

        limpar: function() {
            local = criarModelo();
        }
    };
});
