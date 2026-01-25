const display = document.querySelector(".display");
const buttons = document.querySelectorAll(".num, .zero"); 
const operator = document.querySelectorAll(".op");
let numbers =[];
buttons.forEach(button => {
    button.addEventListener('click', () => {
        display.textContent += button.textContent; 
        numbers.push(Number(button.textContent));
    });
});

operator.forEach(op => {
    op.addEventListener('click', ()=>{
        const operation = op.textContent;
        numbers.push(op.textContent);
        display.textContent+=op.textContent;
    })
})
console.log(numbers);
