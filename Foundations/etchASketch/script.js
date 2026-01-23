const button = document.querySelector(".entry");
const container = document.querySelector(".container");

const myPopup = new Popup({
    id: "resizePopUp",
    title: "Resize!",
    content: `
        <div style="display: flex; flex-direction: column; gap: 10px; align-items: center;">
            <p>Enter a number between 1 and 100</p>
            <input type="number" id="sizeInput" placeholder="e.g. 16" style="padding: 5px;">
            <button id="confirmSize" style="padding: 5px 10px;">Create Grid</button>
        </div>
    `,
});

button.addEventListener('click', () => {
    myPopup.show();
    const ch = document.querySelector("#confirmSize");
    const input = document.querySelector("#sizeInput");
    ch.onclick = () => {
        const n = input.value; 
        makeDivs(n);
    };
});

function makeDivs(n) {
    let twh = 800;
    myPopup.hide();
    container.innerHTML = '';
    let defh = `${twh/n}px`;
    let defw = `${twh/n}px`;

    for(let i=0;i<n;i++){
        const mainBox = document.createElement("div");
        mainBox.style.display = "flex";
        mainBox.style.flexDirection = "row";
        container.appendChild(mainBox);
        for(let j=0;j<n;j++){
            const box = document.createElement("div");
            box.style.height = defh;
            box.style.width = defw;
            box.style.border="1px solid white";
            box.style.background = "black";
            mainBox.appendChild(box);
        }
    }

    // for (let i = 0; i < n * n; i++) {
    //     const box = document.createElement("div");
    //     box.style.height = defh;
    //     box.style.width = defw;
    //     box.style.border="1px solid white";
    //     box.style.background = "black";
        
    //     container.appendChild(box); 
    // }
}