const ExerciseC6D = artifacts.require("ExerciseC6D");

module.exports = function(deployer) {

    deployer.deploy(ExerciseC6D).then(function() {
        console.log("Deployed Contract Address:", ExerciseC6D.address);
    });
}