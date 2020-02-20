const ExerciseC6A = artifacts.require("ExerciseC6A");
const ExerciseC6B = artifacts.require("ExerciseC6B");
const ExerciseC6C = artifacts.require("ExerciseC6C");
const ExerciseC6CApp = artifacts.require("ExerciseC6CApp");

module.exports = function(deployer) {

    deployer.deploy(ExerciseC6A);
    deployer.deploy(ExerciseC6B).then(function() {
        console.log("Deployed Contract Address:", ExerciseC6B.address);
    });
    // deployer.deploy(ExerciseC6C).then(function() {
    //     console.log("Deployed Contract Address:", ExerciseC6C.address);
    // });
    // deployer.deploy(ExerciseC6CApp, ExerciseC6C.address).then(function() {
    //     console.log("Deployed Contract Address:", ExerciseC6CApp.address);
    // });
}