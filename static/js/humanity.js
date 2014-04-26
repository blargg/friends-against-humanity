var cardModule = angular.module('cardModule', []);
var randomNames = ['Charlotte', 'Josephine', 'Hettie', 'Maryann', 'Jacinta', 'Allene', 'Keva', 'Genia', 'Robt', 'Lyman', 'Bridget', 'Sandi', 'Kelsi', 'Connie', 'Mamie', 'Bonnie', 'Irwin', 'Alva', 'Danielle', 'Syble', 'Herbert', 'Elwanda', 'Francoise', 'Meghan', 'Mireille', 'Olivia', 'Kasi', 'Ranae', 'Zetta', 'Malcom', 'Catrina', 'Hermelinda', 'Marketta', 'Jazmine', 'Brenda', 'Henrietta', 'Blair', 'Sanda', 'Kristyn', 'Treena', 'Annette', 'Ivette', 'Ilana', 'Sung', 'Brittni', 'Frederica', 'Sal', 'Luciano', 'Deandre', 'Ursula'];
var randomGameNames = ['The Ruins of Urin City on 5363 Herschelii IV', 'The Eliat Industrial Complex on 7202 Indi V', 'The Vilgi Station above New Triton', 'The Drapa Military Base above Mekyo N\'Sari', 'The Slati Spaceport on New Vesta', 'The Frozen Moon of Beri VII', 'The Radioactive Moon of 5583 Mensae IV', 'The Hofa Military Base above 8460 Jyeshtha Prime', 'The Crystalline City of Thanii', 'The Crystalline Sea of Hada', 'The Town of Wuhou on Kerry', 'The Tucker Homestead on Three Hills', 'The Ghost Town of New Amarillo on Kerry', 'The Alliance Shipyard above Santo', 'The Town of Wise\'s Canyon on Perth', 'The Banker Mine on Athens', 'The City of Jiangyi on Bernadette', 'The Weyland-Yutani Research Facility above Bernadette', 'The Wise Mine on Whitefall', 'The Russell Mine on Deadwood', 'The Dane Colony', 'The Wreckage of the Zabri on Idrin', 'The Living City of Rapa', 'The City of Benja on Mala', 'The Crystalline City of Byni', 'The Pyra Spaceport on Barne', 'The Shattered Moon of Gone', 'The Rootaiium Mines of Jiri', 'The Natha Colony', 'The Ruins of Trata City on Taga', 'The Censoft Arcology in Yokohama', 'The Manchester Industrial Area', 'The ruins of the Beijing Arcology', 'The ruins of the Chicago Arcology', 'The Osaka Industrial Area', 'The Dynlink Autofactory in Perth', 'The IP Datavault in Amsterdam', 'The ruins of the Moneaux Research Facility in Baikonur', 'The Hima Research Facility in low-earth orbit', 'The Lai Warehouse in Baikonur'];

function getRandom(a)
{
    return a[Math.floor(Math.random() * a.length)];
}

function fillBlanks(text, items)
{

}

angular.module('HumanityApp', [])
.filter('unsafe', function($sce)
{
    return function(v)
    {
        return $sce.trustAsHtml(v);
    };
})
.directive('dialog', function()
{
    return {
        restrict: 'E',
        scope:
        {
            show: '='
        },
        replace: true,
        transclude: true,
        link: function(scope, element, attrs)
        {
            scope.hideDialog = function()
            {
                scope.show = false;
            };
        },
        template: '<div class="dialog" ng-show="show"><div class="dialog-container"><div class="content" ng-transclude></div><button class="btn btn-danger" style="float: right" ng-click="hideDialog()">Close</button></div></div>'
    };
})
.controller('CardController', ['$scope', '$http', '$interval', '$sce', function($scope, $http, $interval, $sce)
{
    //var backendHost = 'zach297.com:8080'
    var backendHost = '127.0.0.1:8080'
    var backendBase = 'http://' + backendHost + '/'

    //
    // Gameplay Data
    //

    $scope.cards = masterCards;
    $scope.games = [];
    $scope.game = undefined;
    $scope.gameSocket = undefined;
    $scope.playerId = undefined;
    $scope.playerAuth = undefined;
    $scope.playerName = undefined;
    $scope.selectedCards = [];

    //
    // UI Data
    //

    $scope.settingsForm = {};
    $scope.showSettingsDialog = false;
    $scope.showSettings = function()
    {
        $scope.showSettingsDialog = true;
        $scope.settingsForm.name = $scope.playerName;
    };
    $scope.hideSettings = function()
    {
        console.log("hide!");
        $scope.showSettingsDialog = false;
    };

    $scope.newGameForm = {};
    $scope.showNewGameDialog = false;
    $scope.showNewGame = function()
    {
        $scope.newGameForm.name = getRandom(randomGameNames);
        $scope.newGameForm.aiPlayers = 0;
        $scope.showNewGameDialog = true;
    };
    $scope.hideNewGame = function()
    {
        $scope.showNewGameDialog = false;
    };

    $scope.pollAvailableGames = function()
    {
        $http.get(backendBase + 'AvailableGames').
        success(function(data)
        {
            $scope.games = data['Games'];
        });
    };
    $scope.pollAvailableGames();

    $scope.makePlayer = function(name)
    {
        if (!name)
        {
            name = getRandom(randomNames);
        }

        // Reset player based data
        $scope.game = undefined;
        $scope.gameSocket = undefined;
        $scope.playerId = undefined;
        $scope.playerAuth = undefined;
        $scope.playerName = undefined;
        $scope.selectedCards = [];
        delete localStorage.playerInfo;

        $http({
            method: 'POST',
            url: backendBase + 'CreatePlayer',
            data: 'Name=' + name,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).
        success(function(data)
        {
            $scope.playerId = data['PlayerId'];
            $scope.playerAuth = data['PlayerAuthId'];
            $scope.playerName = data['PlayerName'];
            localStorage.playerInfo = JSON.stringify(
            {
                playerId  : data['PlayerId'],
                playerAuth: data['PlayerAuthId'],
                playerName: data['PlayerName']
            });
            console.log('Created Player');
            console.debug(data);
        });
    };

    if (localStorage.playerInfo)
    {
        console.log('Found player info, testing');
        var player = JSON.parse(localStorage.playerInfo);
        $scope.playerId = player.playerId;
        $scope.playerAuth = player.playerAuth;
        $scope.playerName = player.playerName;
        $http({
            method: 'GET',
            url: backendBase + 'PlayerInfo',
            params: { ID: $scope.playerId }
        }).
        error(function(data)
        {
            console.log('Bad player info, making new one');
            delete localStorage.playerInfo;
            $scope.makePlayer();
        });
    }
    else
    {
        console.log('No player info, creating new one');
        delete localStorage.playerInfo;
        $scope.makePlayer();
    }

    $scope.getPlayerInfo = function(callback)
    {
        $http({
            method: 'POST',
            url: backendBase + 'PlayerInfo',
            data: 'ID=' + playerId,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).
        success(function(data)
        {
            console.log('Got Player Info');
            console.debug(data);
            var objData =
            {
                playerId  : data['PlayerId'],
                playerAuth: data['PlayerAuthId'],
                playerName: data['PlayerName']
            };
            callback(objData);
        });
    };

    $scope.makeGame = function(name, aiPlayers)
    {
        $http({
            method: 'POST',
            url: backendBase + 'CreateGame',
            data: 'Name=' + name + '&AI=' + aiPlayers,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        }).
        success(function(data)
        {
            console.log('Added Game');
            $scope.pollAvailableGames();
        });
    };

    $scope.endGame = function()
    {
        $http({
            method: 'POST',
            url: backendBase + 'EndGame',
            data: 'PlayerId=' + $scope.playerId +
                  '&AuthToken=' + $scope.playerAuth +
                  '&GameId=' + $scope.game.gameId,
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

        (function()
        {
            $scope.gameSocket = new WebSocket('ws://' + backendHost + '/GameState');
            var intervalId;

            $scope.gameSocket.onopen = function(event) {
                var connectData = {
                    'PlayerId': $scope.playerId,
                    'AuthToken': $scope.playerAuth,
                    'GameId': gameSession.GameId
                };
                $scope.gameSocket.send(JSON.stringify(connectData));
                intervalId = setInterval(function()
                {
                    $scope.gameSocket.send('ping');
                }, 5000);
            };

            $scope.gameSocket.onmessage = function(event) {
                var data = JSON.parse(event.data);
                $scope.game = {
                    'gameId':  data['GameId'],
                    'currentBlackCard': data['CurrentBlackCard'],
                    'previousBlackCard': 1,
                    'hand':  data['Hand'],
                    'turnOrder': data['TurnOrder'],
                    'judge': data['CurrentJudge'],
                    'inPlay': data['MultiInPlay'],
                    'players': data['Players'],
                    'scores': data['Scores'],
                    'winningCards': data['WinningCards']
                };
                $scope.game['cardsNeeded'] = $scope.cards[$scope.game.currentBlackCard - 1]['numAnswers'];
                if (data['End'])
                {
                    $scope.game = undefined;
                }
                console.log('GameState Message');
                console.debug(data);
                $scope.$digest();
            };

            $scope.gameSocket.onclose = function()
            {
                console.log('GameState Closed');
                clearInterval(intervalId);
                delete $scope.gameSocket;
            };

        })();
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
            var numAnswers = $scope.isGameJudge() ? 1 : $scope.cards[$scope.game.currentBlackCard - 1]['numAnswers'];
            console.log('Number of Answers: ' + numAnswers);
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
            'MultiCardId': $scope.selectedCards,
        };
        $scope.gameSocket.send(JSON.stringify(connectData));
        $scope.clearSelection();
        console.log('Submit Selection: ' + $scope.selectedCards);
    }

    $scope.judgeCard = function()
    {
        var connectData = {
            'MultiCardId': $scope.selectedCards[0],
        };
        $scope.gameSocket.send(JSON.stringify(connectData));
        $scope.clearSelection();
        console.log('Judgement: ' + $scope.selectedCards);
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

    $scope.fillBlanks = function(blackCard, items)
    {
        var text = '';
        var blanks = $scope.cards[blackCard - 1].text.split('_');
        var itemTexts = [];
        for (var itemIndex = 0; itemIndex < items.length; itemIndex++)
        {
            itemTexts.push($scope.cards[items[itemIndex] - 1].text.slice(0, -1)); // Remove trailing period
        }

        var blanksIndex;
        for (blanksIndex = 0; blanksIndex < blanks.length; blanksIndex++)
        {
            text += blanks[blanksIndex];
            if (blanksIndex < items.length)
            {
                text += '<br /><span class="player">' + itemTexts[blanksIndex] + '</span>';
            }
        }

        for (var itemIndex = blanksIndex; itemIndex < items.length; itemIndex++)
        {
            text += '<br /><span class="player">' + itemTexts[itemIndex] + '</span>';
        }

        return $sce.trustAsHtml(text);
    }

    //
    // Intervals
    //

    $interval(function()
    {
        $scope.pollAvailableGames();
    }, 5000);
}]);
