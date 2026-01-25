const display = document.querySelector(".display");
const buttons = document.querySelectorAll(".num, .zero"); 
const operator = document.querySelectorAll(".op");
let cnt =0;
buttons.forEach(button => {
    button.addEventListener('click', () => {
        display.textContent += button.textContent; 
    });
});

operator.forEach(op => {
    op.addEventListener('click', ()=>{
        const operation = op.textContent;

        display.textContent+=op.textContent;
    })
})

