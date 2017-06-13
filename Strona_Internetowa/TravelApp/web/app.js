(function(){
    var app = angular.module('imageWall',[]);
    app.controller("imageController", ['$scope', '$element', '$interval', function($scope, $element, $interval){
        // $scope.el

        $scope.image = [];

        $scope.small = [
            {
                chosen: false,
                breed: "mis1",
                image: "image/mis1.jpg"

            },
            {
                chosen: false,
                breed: "mis2",
                image: "image/mis2.jpg"
            },
            {
                chosen: false,
                breed: "mis3",
                image: "image/mis3.jpg"
            },
            {
                chosen: false,
                breed: "mis4",
                image: "image/mis4.jpg"
            },
            {
                chosen: false,
                breed: "mis5",
                image: "image/mis5.jpg"
            },
            {
                chosen: false,
                breed: "mis6",
                image: "image/mis6.jpg"
            }
        ];

        $scope.medium = [
            {
                breed:"mis7",
                image: "image/mis7.jpg"
            },
            {
                breed:"mis8",
                image: "image/mis8.jpg"
            },
            {
                breed:"mis9",
                image: "image/mis9.jpg"
            },
            {
                breed:"mis10",
                image: "image/mis10.jpeg"
            },
            {
                chosen: false,
                breed: "mis11",
                image: "image/mis11.jpg"
            }
        ];

        $scope.large = [
            {
                breed: "mis12",
                image: "image/mis12.jpg"
            },
            {
                breed: "mis13",
                image: "image/mis13.jpg"
            }
        ];

        function getRandomImage( photoArray ){
            return( photoArray[ getRan( 0, photoArray.length-1 ) ].image );
        }

        function getRan( min, max ){
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

        function loadImages(){
            $scope.image[1] = getRandomImage($scope.small);
            $scope.image[2] = getRandomImage($scope.small);
            $scope.image[3] = getRandomImage($scope.medium);
            $scope.image[4] = getRandomImage($scope.large);
            $scope.image[5] = getRandomImage($scope.medium);
            $scope.image[6] = getRandomImage($scope.medium);
        }

        function changeImgRan(){
            var index = getRan(1,6), ranImg;
            if ( index == 1 || index == 2 ) {
                ranImg = getRandomImage($scope.small);
            } else if ( index == 3 || index == 5 || index == 6 ) {
                ranImg = getRandomImage($scope.medium);
            } else {
                ranImg = getRandomImage($scope.large);
            }
            $scope.image[index] = ranImg;
        }

        loadImages();
        $interval( changeImgRan, 1000 );

    }]);

})();