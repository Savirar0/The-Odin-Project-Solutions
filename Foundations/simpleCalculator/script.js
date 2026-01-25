const display = document.querySelector(".display");
const buttons = document.querySelectorAll(".num, .zero");
const operator = document.querySelectorAll(".op");
const eq = document.getElementById("equal");
const delBtn = document.getElementById("del"); 

let numbers = [];
let curBuff = "";

buttons.forEach(button => {
    button.addEventListener('click', () => {
        display.textContent += button.textContent;
        curBuff += button.textContent;
    });
});

operator.forEach(op => {
    op.addEventListener('click', () => {
        if (curBuff !== "") {
            numbers.push(Number(curBuff));
            curBuff = "";
        }
        numbers.push(op.textContent);
        display.textContent += op.textContent;
    });
});

delBtn.addEventListener('click', () => {
    display.textContent = display.textContent.slice(0, -1);
    curBuff = curBuff.slice(0, -1);
});

eq.addEventListener('click', () => {
    if (curBuff !== "") {
        numbers.push(Number(curBuff));
        curBuff = ""; 
    }

    for (let i = 0; i < numbers.length; i++) {
        if (numbers[i] === "*" || numbers[i] === "/") {
            let res;
            if (numbers[i] === "*") {
                res = numbers[i - 1] * numbers[i + 1];
            } else {
                res = numbers[i - 1] / numbers[i + 1];
            }
            numbers.splice(i - 1, 3, res);
            i--;
        }
    }

    for (let i = 0; i < numbers.length; i++) {
        if (numbers[i] === "+" || numbers[i] === "-") {
            let res;
            if (numbers[i] === "+") {
                res = numbers[i - 1] + numbers[i + 1];
            } else {
                res = numbers[i - 1] - numbers[i + 1];
            }
            numbers.splice(i - 1, 3, res);
            i--;
        }
    }

    display.textContent = numbers[0];
});