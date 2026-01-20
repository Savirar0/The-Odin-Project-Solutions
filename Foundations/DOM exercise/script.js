// your JavaScript file
const container = document.querySelector("#container");
container.textContent="The is the glorious parent text-content!";

const content = document.createElement("div");
content.classList.add("content");
content.textContent = "This is the glorious text-content!";

container.appendChild(content);
const red = document.createElement("p");
red.textContent="Hey I'm red!"
red.style.color="red";
const blu = document.createElement("h3");
blu.textContent="I'm a blue h3!";
blu.style.color="blue";
container.appendChild(red);
container.appendChild(blu);




