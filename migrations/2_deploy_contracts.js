const ExerciseC6B = artifacts.require("ExerciseC6B");

module.exports = function(deployer) {

    deployer.deploy(ExerciseC6B).then(function() {
        console.log("Deployed Contract Address:", ExerciseC6B.address);
    });
}