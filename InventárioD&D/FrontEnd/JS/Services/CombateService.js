angular.module('DMShield').factory('CombateService', function() {

    var combate = {
        ativo: false,
        inimigos: [],
        jogadores: [],
        turnos: []
    };

    return {

        gerarTurnos: function() {
            combate.turnos = [...combate.inimigos, ...combate.jogadores]
            .sort((a, b) => b.iniciativa - a.iniciativa);
        },

        proximoTurno: function() {
            if (combate.turnos.length === 0) return;

            let atual = combate.turnos.shift(); // tira o primeiro
            combate.turnos.push(atual); // joga pro final
        },

        getTurnos: function() {
            return combate.turnos;
        },

        iniciar: function() {
            combate.ativo = true;
            combate.inimigos = [];
            combate.jogadores = [];
            combate.turnos = [];
        },

        getCombate: function() {
            return combate;
        },

        adicionarInimigo: function(inimigo) {
        // criamos uma cópia completa da ficha para permitir
        // consulta independente de alterações posteriores
        let copia = JSON.parse(JSON.stringify(inimigo));

        copia.instanceId = Date.now() + Math.random(); // ID único
        copia.inimigoId = inimigo.id;               // armazena o id original
        copia.ficha = JSON.parse(JSON.stringify(inimigo)); // guarda a ficha inteira
            copia.vidaAtual = inimigo.vida;
            copia.iniciativa = "";
            copia.status = "";

            combate.inimigos.push(copia);
        },

        adicionarJogador: function(jogador) {
            combate.jogadores.push({
                instanceId: Date.now() + Math.random(),
                nome: jogador.nome,
                iniciativa: jogador.iniciativa,
                vidaAtual: null,
                status: ""
            });
        },

        limpar: function() {
            combate.ativo = false;
            combate.inimigos = [];
            combate.jogadores = [];
        },

        /**
         * Retorna uma lista de fichas únicas (uma por tipo de inimigo)
         * com base nos inimigos atualmente adicionados ao combate.
         */
        getFichasUnicas: function() {
            const mapa = {};
            combate.inimigos.forEach(i => {
                if (!mapa[i.inimigoId]) {
                    mapa[i.inimigoId] = i.ficha || i;
                }
            });
            return Object.values(mapa);
        }
    };
});