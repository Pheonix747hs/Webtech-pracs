var app = angular.module('myApp', []);

app.controller('appCtrl', function($scope) {
  $scope.user = {};
  $scope.loginData = {};
  $scope.isLoggedIn = false;
  $scope.errorMessage = "";

  $scope.register = function() {
    // Implement logic to register user (e.g., store in localStorage or backend)
    console.log("Registering user:", $scope.user);
    $scope.isLoggedIn = true;
  };

  $scope.login = function() {
    // Implement logic to validate login credentials (e.g., check against stored data or backend)
    console.log("Logging in:", $scope.loginData);
    if ($scope.loginData.username === "admin" && $scope.loginData.password === "secret") {
      $scope.isLoggedIn = true;
    } else {
      $scope.errorMessage = "Invalid username or password";
    }
  };

  $scope.showRegister = function() {
    $scope.isLoggedIn = false;
    $scope.errorMessage = "";
  };

  $scope.showLogin = function() {
    $scope.isLoggedIn = true;
    $scope.errorMessage = "";  };
});

  
