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
    };

    $scope.irParaCombate = function() {
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
        return [...$scope.combate.inimigos, ...$scope.combate.jogadores]
            .sort((a, b) => (Number(b.iniciativa) || 0) - (Number(a.iniciativa) || 0));
    };

    // expõe uma lista de fichas únicas para consulta na view de combate
    $scope.getFichasUnicas = function() {
        return CombateService.getFichasUnicas();
    };

});