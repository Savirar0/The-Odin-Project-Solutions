// 1. Array to hold all the book objects
const myLibrary = [];

// 2. The Book Constructor
function Book(title, author, pages, read) {
    // TODO: Assign properties to 'this'
    // TODO: Generate a unique ID using crypto.randomUUID() and assign it to the book
    this.title=title;
    this.author=author;
    this.pages=pages;
    this.read=read;
    this.id = crypto.randomUUID();
}

// 3. Prototype function to toggle read status
Book.prototype.toggleRead = function() {
    this.read = !this.read;
};

// 4. Function to handle form submission
function addBookToLibrary(event) {
    // Prevent the form from submitting to a server and refreshing the page
    event.preventDefault(); 

    // TODO: Grab the values from the input fields (title, author, pages, read)
    const titleIn=document.getElementById('title');
    const authorIn=document.getElementById('author');
    const pagesIn=document.getElementById('pages');
    const readIn=document.getElementById('read');
    // TODO: Create a new Book instance using those values
    const title = titleIn.value;
    const author = authorIn.value;
    const pages = pagesIn.value;
    const read = readIn.checked;
    // TODO: Push the new book into the myLibrary array
    const book = new Book(title,author,pages,read);
    myLibrary.push(book);
    // TODO: Call displayBooks() to update the screen
    displayBooks();
    // TODO: Close the dialog and clear the form inputs
    dialog.close();
    form.reset();
}

// 5. Function to render the books on the screen
// The Prototype function to flip the read status
Book.prototype.toggleRead = function() {
    this.read = !this.read; // Flips true to false, or false to true
};

function displayBooks() {
    const container = document.getElementById('library-container');
    
    // 1. Wipe the screen clean! 
    // If we don't do this, adding 1 book will re-print all the old ones again.
    container.innerHTML = '';
    
    // 2. Loop through every single book currently sitting in the array
    myLibrary.forEach((book) => {
        
        // 3. Create a blank <div>
        const card = document.createElement('div');
        
        // 4. Give it the CSS class so it looks pretty
        card.classList.add('book-card');
        
        // 5. Attach the unique ID to the HTML element itself
        card.dataset.id = book.id;
        
        // 6. Inject the HTML into the card. 
        // We use a ternary operator (?) to check if book.read is true or false
        // to determine what color the button should be and what text it should say!
        card.innerHTML = `
            <h3>${book.title}</h3>
            <p><strong>Author:</strong> ${book.author}</p>
            <p><strong>Pages:</strong> ${book.pages}</p>
            
            <div class="card-actions">
                <button class="${book.read ? 'read-btn' : 'not-read-btn'}" id="toggle-${book.id}">
                    ${book.read ? 'Read' : 'Not Read'}
                </button>
                
                <button class="delete-btn" id="delete-${book.id}">
                    Delete
                </button>
            </div>
        `;
        
        // 7. Shove the finished card onto the actual webpage
        container.appendChild(card);

        // --------------------------------------------------------
        // 8. ADD THE EVENT LISTENERS FOR THE BUTTONS WE JUST MADE
        // --------------------------------------------------------
        
        // Grab the specific toggle button inside THIS specific card
        const toggleBtn = card.querySelector(`#toggle-${book.id}`);
        toggleBtn.addEventListener('click', () => {
            book.toggleRead(); // Change the data
            displayBooks();    // Re-draw the screen to show the new color!
        });

        // Grab the specific delete button inside THIS specific card
        const deleteBtn = card.querySelector(`#delete-${book.id}`);
        deleteBtn.addEventListener('click', () => {
            // Find exactly where this book lives in the array
            const bookIndex = myLibrary.findIndex((b) => b.id === book.id);
            
            // Slice it out of the array
            myLibrary.splice(bookIndex, 1);
            
            // Re-draw the screen so the card vanishes!
            displayBooks(); 
        });
        
    });
}
// --- DOM Element Selection & Event Listeners ---

const dialog = document.getElementById('book-dialog');
const newBookBtn = document.getElementById('new-book-btn');
const closeBtn = document.getElementById('close-dialog-btn');
const form = document.getElementById('book-form');

// Open the modal when "Add New Book" is clicked
newBookBtn.addEventListener('click', () => {
    dialog.showModal();
});

// Close the modal when "Cancel" is clicked
closeBtn.addEventListener('click', () => {
    dialog.close();
    form.reset(); // Clears the inputs
});

// Listen for the form submission
form.addEventListener('submit', addBookToLibrary);

// Optional: Add a couple of fake books to the array manually here at the bottom 
// and call displayBooks() so you have something to look at while you build!