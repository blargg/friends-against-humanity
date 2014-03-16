var cardModule = angular.module('cardModule', []);

function shuffleArray(a)
{
    for (var i = 0; i < a.length - 1; i++)
    {
        var swapIdx = i + Math.floor(Math.random() * (a.length - i))
        var tmp = a[i];
        a[i] = a[swapIdx]
        a[swapIdx] = tmp;
    }
}

function CardController($scope, $http)
{
    shuffleArray(masterCards);

    $scope.gameSessions =
    [
        { 'name': 'Best Game', 'playerCount': 4, 'playerCapacity': 5 },
        { 'name': 'Worst Game', 'playerCount': 1, 'playerCapacity': 5 },
        { 'name': 'Lonely Island', 'playerCount': 1, 'playerCapacity': 2 },
        { 'name': 'Random Atoll', 'playerCount': 10, 'playerCapacity': 11 }
    ];

    for (var gameSessionIndex = 0; gameSessionIndex < $scope.gameSessions.length; gameSessionIndex++)
    {
        $scope.gameSessions[gameSessionIndex]['id'] = gameSessionIndex;
    }

    for (var gameSessionIndex = 0; gameSessionIndex < 10; gameSessionIndex++)
    {
        $scope.gameSessions.push({ 'name': 'Random ' + Math.floor(Math.random() * 100), 'playerCount': 0, 'playerCapacity': 5 });
    }

    var game = {};
    var blackCards = []
    var whiteCards = []
    $scope.game = game;
    for (var cardIndex = 0; cardIndex < masterCards.length; cardIndex++)
    {
        var cardType = masterCards[cardIndex]['cardType'];
        var cardExpansion = masterCards[cardIndex]['expansion'];
        if (cardExpansion != 'Base') // The expansions are weird
        {
            continue;
        }
        var text = masterCards[cardIndex]['text'];
        text = text.replace(/_/g, '_______');
        text = text.replace(/<br>/g, '\n');
        text = text.replace(/&reg;/g, '');
        masterCards[cardIndex]['text'] = text;

        if (cardType == 'Q')
        {
            blackCards.push(masterCards[cardIndex]);
        }
        else if (cardType == 'A')
        {
            whiteCards.push(masterCards[cardIndex]);
        }
    }
    game.currentBlackCard = blackCards[0];
    game.hand = whiteCards.slice(0, 100);

    $scope.addGame = function()
    {
        console.log("new game!");
    };

    $scope.selectGame = function(gameSession)
    {
        console.log("select game: " + gameSession.name + "( " + gameSession.id + " )");
    };

    $scope.selectedCards = [];

    $scope.isCardSelected = function(cardId)
    {
        var selectionIndex = $scope.selectedCards.indexOf(cardId);
        if (selectionIndex != -1)
        {
            var cssClass = "card-selected card-selected-" + selectionIndex;
            return cssClass;
        }
        return "";
    };

    $scope.selectCard = function(cardId)
    {
        var selectionIndex = $scope.selectedCards.indexOf(cardId);
        if (selectionIndex == -1)
        {
            $scope.selectedCards.push(cardId);
            if ($scope.selectedCards.length > $scope.game.currentBlackCard['numAnswers'])
            {
                $scope.selectedCards.splice(0, 1);
            }
        }
        if (selectionIndex != -1)
        {
            $scope.selectedCards.splice(selectionIndex, 1);
        }
    };

    $scope.submitSelection = function()
    {
        console.log("submit selection: " + $scope.selectedCards);
    }

    $scope.clearSelection = function()
    {
        $scope.selectedCards = [];
    }
};
