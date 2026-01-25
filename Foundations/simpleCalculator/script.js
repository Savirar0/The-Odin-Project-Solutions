const display = document.querySelector(".display");
const buttons = document.querySelectorAll(".num, .zero"); 

buttons.forEach(button => {
    button.addEventListener('click', () => {
        display.textContent += button.textContent; 
    });
});

