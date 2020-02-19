const ExerciseC6A = artifacts.require("ExerciseC6A");

module.exports = function(deployer) {

    deployer.deploy(ExerciseC6A);
    deployer.deploy(ExerciseC6B).then(function() {
        console.log("Deployed Contract Address:", ExerciseC6B.address);
    });
}