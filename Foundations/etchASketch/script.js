
const button = document.querySelector(".entry");
const myPopup = new Popup({
    id: "resizePopUp",
    title: "Resize!",
    content: `<div style="display: flex; flex-direction: column; gap: 10px; align-items: center;">
            <p>Enter a number between 1 and 100</p>
            <input type="number" id="sizeInput" placeholder="e.g. 16" style="padding: 5px;">
            <button id="confirmSize" style="padding: 5px 10px;">Create Grid</button>
        </div>
    `,
});
button.addEventListener('click', () => {
    myPopup.show();
});
let n = Document.querySelector("#inputSize").value;
