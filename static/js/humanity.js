var cardModule = angular.module('cardModule', []);
var randomNames = ['Charlotte', 'Josephine', 'Hettie', 'Maryann', 'Jacinta', 'Allene', 'Keva', 'Genia', 'Robt', 'Lyman', 'Bridget', 'Sandi', 'Kelsi', 'Connie', 'Mamie', 'Bonnie', 'Irwin', 'Alva', 'Danielle', 'Syble', 'Herbert', 'Elwanda', 'Francoise', 'Meghan', 'Mireille', 'Olivia', 'Kasi', 'Ranae', 'Zetta', 'Malcom', 'Catrina', 'Hermelinda', 'Marketta', 'Jazmine', 'Brenda', 'Henrietta', 'Blair', 'Sanda', 'Kristyn', 'Treena', 'Annette', 'Ivette', 'Ilana', 'Sung', 'Brittni', 'Frederica', 'Sal', 'Luciano', 'Deandre', 'Ursula'];
var randomGameNames = ['The Ruins of Urin City on 5363 Herschelii IV', 'The Eliat Industrial Complex on 7202 Indi V', 'The Vilgi Station above New Triton', 'The Drapa Military Base above Mekyo N\'Sari', 'The Slati Spaceport on New Vesta', 'The Frozen Moon of Beri VII', 'The Radioactive Moon of 5583 Mensae IV', 'The Hofa Military Base above 8460 Jyeshtha Prime', 'The Crystalline City of Thanii', 'The Crystalline Sea of Hada', 'The Town of Wuhou on Kerry', 'The Tucker Homestead on Three Hills', 'The Ghost Town of New Amarillo on Kerry', 'The Alliance Shipyard above Santo', 'The Town of Wise\'s Canyon on Perth', 'The Banker Mine on Athens', 'The City of Jiangyi on Bernadette', 'The Weyland-Yutani Research Facility above Bernadette', 'The Wise Mine on Whitefall', 'The Russell Mine on Deadwood', 'The Dane Colony', 'The Wreckage of the Zabri on Idrin', 'The Living City of Rapa', 'The City of Benja on Mala', 'The Crystalline City of Byni', 'The Pyra Spaceport on Barne', 'The Shattered Moon of Gone', 'The Rootaiium Mines of Jiri', 'The Natha Colony', 'The Ruins of Trata City on Taga', 'The Censoft Arcology in Yokohama', 'The Manchester Industrial Area', 'The ruins of the Beijing Arcology', 'The ruins of the Chicago Arcology', 'The Osaka Industrial Area', 'The Dynlink Autofactory in Perth', 'The IP Datavault in Amsterdam', 'The ruins of the Moneaux Research Facility in Baikonur', 'The Hima Research Facility in low-earth orbit', 'The Lai Warehouse in Baikonur'];

function getRandom(a)
{
    return a[Math.floor(Math.random() * a.length)];
}

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

    $scope.pollAvailableGames = function()
    {
        $http.get(backendBase + 'AvailableGames').
        success(function(data)
        {
            $scope.games = data['Games'];
            console.log('Polled Games');
            console.debug($scope.games);
        });
    };
    $scope.pollAvailableGames();

    $http({
        method: 'POST',
        url: backendBase + 'CreatePlayer',
        data: 'Name=' + getRandom(randomNames),
        headers: {'Content-Type': 'application/x-www-form-urlencoded'}
    }).
    success(function(data)
    {
        $scope.playerId = data['PlayerId'];
        $scope.playerAuth = data['PlayerAuthId'];
        $scope.playerName = data['PlayerName'];
        console.log('Created Player');
        console.debug(data);
    });

    $scope.getPlayerInfo = function()
    {
        $http.get(backendBase + 'PlayerInfo').
        success(function(data)
        {
            console.log('Got Player Info');
            console.debug(data);
            $scope.playerId = data['PlayerId'];
            $scope.playerAuth = data['PlayerAuthId'];
            $scope.playerName = data['PlayerName'];
        });
    };

    $scope.addGame = function()
    {
        $http({
            method: 'POST',
            url: backendBase + 'CreateGame',
            data: 'Name=' + getRandom(randomGameNames),
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).
        success(function(data)
        {
            console.log('Added Game');
            $scope.pollAvailableGames();
        });
    };

    $scope.selectGame = function(gameSession)
    {
        console.log('select game: ' + gameSession.Name + '( ' + gameSession.GameId + ' )');
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
                'judge': data['CurrentJudge'],
                'inPlay': data['InPlay']
            };
            console.log('GameState Message');
            console.debug(data);
            $scope.$digest();
        };
    };

    $scope.getSelectableCards = function()
    {
        if ($scope.game)
        {
            return $scope.isGameJudge() ? $scope.game.inPlay : $scope.game.hand;
        }
        return [];
    }

    $scope.isCardSelected = function(cardId)
    {
        var selectionIndex = $scope.selectedCards.indexOf(cardId);
        if (selectionIndex != -1)
        {
            var cssClass = 'card-selected card-selected-' + selectionIndex;
            return cssClass;
        }
        return '';
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
            'CardId': $scope.selectedCards[0],
            'MultiCardId': $scope.selectedCards,
        };
        $scope.gameSocket.send(JSON.stringify(connectData));
        console.log('Submit Selection: ' + $scope.selectedCards);
    }

    $scope.clearSelection = function()
    {
        $scope.selectedCards = [];
    }

    $scope.isGameJudge = function()
    {
        if ($scope.game)
        {
            return $scope.playerId == $scope.game.judge;
        }
        return false;
    }
};
