var addItemButton = document.getElementById('add-item-button');
addItemButton.addEventListener('click', unhide);

function unhide() {
	document.getElementById('add-item-form').style.display = "block";
}

var cancelButton = document.getElementById('form-cancel');
cancelButton.addEventListener('click', hide);

function hide() {
	document.getElementById('add-item-form').style.display = "none";
}