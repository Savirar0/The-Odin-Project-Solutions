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

const container2 = document.createElement("div");
container2.style.backgroundColor="pink";
container2.style.borderColor="black";
container2.style.borderStyle = "solid";
container2.style.borderWidth = "5px";
const content1 = document.createElement("h1");
content1.textContent="I'm in a div";
const content2 = document.createElement("p");
content2.textContent="ME TOO!"
container2.appendChild(content1);
container2.appendChild(content2);
container.appendChild(container2);




