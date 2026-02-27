angular.module('DMShield').controller('CombateCtrl', function($scope, CombateService, $location) {

    $scope.iniciarCombate = function() {
        CombateService.iniciar();
        alert("Combate iniciado!");
    };

    $scope.adicionarAoCombate = function(inimigo) {
        if (!CombateService.getCombate().ativo) {
            alert("Inicie um combate primeiro!");
            return;
        }

        CombateService.adicionarInimigo(inimigo);
        $scope.atualizarNumeracao();
    };

    $scope.atualizarNumeracao = function() {
    let contadores = {};

        $scope.combate.inimigos.forEach(inimigo => {
            if (!contadores[inimigo.nome]) {
                contadores[inimigo.nome] = 1;
            } else {
                contadores[inimigo.nome]++;
            }

            inimigo.numero = contadores[inimigo.nome];
        });
    };

    $scope.irParaCombate = function() {
        $scope.atualizarNumeracao();
        window.location.href = "/combate";
    };

    $scope.combate = CombateService.getCombate();

    $scope.novoJogador = {
        nome: '',
        iniciativa: 0
    };

    $scope.adicionarJogador = function() {
        if (!$scope.novoJogador.nome) return;

        CombateService.adicionarJogador({
            nome: $scope.novoJogador.nome,
            iniciativa: $scope.novoJogador.iniciativa
        });

        $scope.novoJogador = { nome: '', iniciativa: "" };
    };

    $scope.getTurnos = function() {
        return CombateService.getTurnos();
    };

    $scope.gerarTurnos = function() {
        CombateService.gerarTurnos();
        $scope.atualizarNumeracao();
    };

    $scope.proximoTurno = function() {
        CombateService.proximoTurno();
    };

    $scope.removerInimigoCombate = function(inimigo) {
        if (!inimigo || !inimigo.instanceId) return;
        CombateService.removerInimigo(inimigo.instanceId);
        $scope.atualizarNumeracao();
    };

    // expõe uma lista de fichas únicas para consulta na view de combate
    $scope.getFichasUnicas = function() {
        return CombateService.getFichasUnicas();
    };

    $scope.getVidaPercentual = function(inimigo) {
        if (!inimigo) return 0;

        var vidaMaxima = Number(inimigo.vida) || 0;
        if (vidaMaxima <= 0) return 0;

        var vidaAtual = Number(inimigo.vidaAtual) || 0;
        var percentual = (vidaAtual / vidaMaxima) * 100;

        return Math.max(0, Math.min(100, percentual));
    };

    $scope.getVidaClasse = function(inimigo) {
        var percentual = $scope.getVidaPercentual(inimigo);

        if (percentual > 60) return 'vida-alta';
        if (percentual > 30) return 'vida-media';
        return 'vida-baixa';
    };

    $scope.calcularMod = function(valor) {
        if (valor === undefined || valor === null) return 0;
        return Math.floor((valor - 10) / 2);
    };

});
