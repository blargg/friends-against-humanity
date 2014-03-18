var cardModule = angular.module('cardModule', []);

function CardController($scope, $http)
{
    var backendBase = 'http://127.0.0.1/'
    $scope.cards = masterCards;
    $scope.games = [];
    $scope.game = undefined;
    $scope.gameSocket = undefined;
    $scope.playerId = undefined;
    $scope.playerAuth = undefined;
    $scope.playerName = undefined;
    $scope.selectedCards = [];

    $http.get(backendBase + 'AvailableGames').
    success(function(data)
    {
        $scope.games = data['Games'];
        console.log($scope.games);
    });

    $http.get(backendBase + 'PlayerInfo').
    success(function(data)
    {
        console.log(data);
        $scope.playerId = data['PlayerId'];
        $scope.playerAuth = data['PlayerAuthId'];
        $scope.playerName = data['PlayerName'];
    });

    $scope.addGame = function()
    {
        console.log("new game!");
    };

    $scope.selectGame = function(gameSession)
    {
        console.log("select game: " + gameSession.Name + "( " + gameSession.GameId + " )");
        $scope.gameSocket = new WebSocket('ws://127.0.0.1/' + 'GameState');

        $scope.gameSocket.onopen = function(event) {
            var connectData = {
                'PlayerId': $scope.playerId,
                'AuthToken': $scope.playerAuth,
                'GameId': gameSession.GameId
            };
            $scope.gameSocket.send(JSON.stringify(connectData));
        };

        $scope.gameSocket.onmessage = function(event) {
            var data = JSON.parse(event.data);
            $scope.game = {
                'currentBlackCard':  data['CurrentBlackCard'],
                'hand':  data['Hand'],
                'judge': data['CurrentJudge']
            };
            console.log(data);
            $scope.$digest();
        };
    };


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
            var numAnswers = $scope.cards[$scope.game.currentBlackCard - 1]['numAnswers'];
            if ($scope.selectedCards.length > numAnswers)
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
        var connectData = {
            'CardId': $scope.selectedCards[0]
        };
        $scope.gameSocket.send(JSON.stringify(connectData));
        console.log("submit selection: " + $scope.selectedCards);
    }

    $scope.clearSelection = function()
    {
        $scope.selectedCards = [];
    }
};
