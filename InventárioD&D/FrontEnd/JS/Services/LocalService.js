angular.module('DMShield').factory('LocalService', function() {
    var local = null;

    function criarModelo() {
        return {
            nome: '',
            tipo: '',
            descricao: 'Nenhuma',
            dados: {
                descricao: 'Caverna escura',
                npcs: [],
                inimigos: [],
                itens: [],
                consumiveis: [],
                anotacoes: [],
                eventos: []
            }
        };
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

        getLocal: function() {
            return ensureLocal();
        },

        adicionarNpc: function(npc) {
            if (!npc) return;
            var copia = angular.copy(npc);
            ensureLocal().dados.npcs.push(copia);
            return copia;
        },

        adicionarInimigo: function(inimigo) {
            if (!inimigo) return;
            var copia = angular.copy(inimigo);
            ensureLocal().dados.inimigos.push(copia);
            return copia;
        },

        adicionarItem: function(item) {
            if (!item) return;
            var copia = angular.copy(item);
            ensureLocal().dados.itens.push(copia);
            return copia;
        },

        adicionarConsumivel: function(consumivel) {
            if (!consumivel) return;
            var copia = angular.copy(consumivel);
            ensureLocal().dados.consumiveis.push(copia);
            return copia;
        },

        limpar: function() {
            local = criarModelo();
        }
    };
});