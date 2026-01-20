const g = ["ROCK","Scissors","Paper"];
let count=0;
let hS=0;
let cS=0;

function playRound(humanChoice, computerChoice) {
    const resultDiv=document.querySelector("#result");
    
    count+=1;
    
    if (humanChoice === computerChoice) {
        count-=1;
        resultDiv.textContent = `Human choice: ${g[humanChoice]}, Computer choice: ${g[computerChoice]}
        RESULT: RETRY`;
        
    } else if (humanChoice === 0 && computerChoice === 1) {
        hS+=1;
        resultDiv.textContent = `Human choice: ${g[humanChoice]}, Computer choice: ${g[computerChoice]}
        RESULT: YOU WIN`;
    } else if (humanChoice === 1 && computerChoice === 2) {
        hS+=1;
        resultDiv.textContent = `Human choice: ${g[humanChoice]}, Computer choice: ${g[computerChoice]}
        RESULT: YOU WIN`;
    } else if (humanChoice === 2 && computerChoice === 0) {
        hS+=1;
        resultDiv.textContent = `Human choice: ${g[humanChoice]}, Computer choice: ${g[computerChoice]}
        RESULT: YOU WIN`;
    } else {
        cS+=1;
        resultDiv.textContent = `Human choice: ${g[humanChoice]}, Computer choice: ${g[computerChoice]}
        RESULT: YOU LOSE`;
    }

    if(count===5){
        const finalDiv = document.querySelector("#final");
        if(hS>cS){
            finalDiv.textContent = `${hS}/5 YOU WIN!!`;
        }else{
            finalDiv.textContent = `${cS}/5 YOU LOSE!!`;
        }
    }
}

function getRandomInt(max) {
    return Math.floor(Math.random() * max);
}

function getComputerChoice() {
    const val = getRandomInt(30);
    if (val <= 10) {
        return 0; 
    } else if (val <= 20) {
        return 1; 
    } else {
        return 2; 
    }
}

const rock = document.querySelector("#rock");
rock.onclick = () => playRound(0,getComputerChoice());
const paper = document.querySelector("#paper");
paper.onclick = () => playRound(2,getComputerChoice());
const scissors = document.querySelector("#scissors");
scissors.onclick = () => playRound(1,getComputerChoice());