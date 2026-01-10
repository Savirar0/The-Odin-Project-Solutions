function playRound(humanChoice, computerChoice) {
    if (humanChoice === computerChoice) {
        return "Retry";
    } else if (humanChoice === 1 && computerChoice === 2) {
        return "You win";
    } else if (humanChoice === 2 && computerChoice === 3) {
        return "You win";
    } else if (humanChoice === 3 && computerChoice === 1) {
        return "You win";
    } else {
        return "You lose";
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function getComputerChoice() {
    const val = getRandomInt(30);
    if (val <= 10) {
        return 1; // Rock
    } else if (val <= 20) {
        return 2; // Scissors
    } else {
        return 3; // Paper
    }
}

function getHumanChoice() {
    const humanVal = parseInt(window.prompt("Enter 1 for Rock, 2 for Scissors, and 3 for Paper"));
    return humanVal;
}

const humanSelection = getHumanChoice();
const computerSelection = getComputerChoice();
const result = playRound(humanSelection, computerSelection);
console.log(`Human choice: ${humanSelection}, Computer choice: ${computerSelection}`);
console.log(result);
