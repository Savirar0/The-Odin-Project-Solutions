const display = document.querySelector(".display");
const buttons = document.querySelectorAll(".num, .zero"); 
const operator = document.querySelectorAll(".op");
const eq = document.getElementById("equal");
let numbers =[];
let curBuff = "";
buttons.forEach(button => {
    button.addEventListener('click', () => {
        display.textContent += button.textContent; 
        curBuff+=button.textContent;
    });
});

operator.forEach(op => {
    op.addEventListener('click', ()=>{
        const operation = op.textContent;
        if(curBuff != ""){
            numbers.push(Number(curBuff));
            curBuff="";
            
        }
        numbers.push(op.textContent);
        display.textContent+=op.textContent;
    })
});

eq.addEventListener('click', ()=>{
    numbers.push(Number(curBuff));
    res=0;
    for(let i=0;i<numbers.length;i++){
        if(numbers[i]=="+"){
            
        }
    }
})


console.log(numbers);
