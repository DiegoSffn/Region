document.addEventListener('DOMContentLoaded', function() {
    // Función genérica para cargar la URL en el editorContainer
    function cargarUrlEnEditorContainer(url) {
        document.querySelector('#editorContainer').innerHTML = '<iframe src="' + url + '" width="100%" height="500"></iframe>';
    }

    // Obtener todos los botones con la clase "open-editor-button"
    var buttons = document.querySelectorAll('.open-editor-button');

    // Agregar un evento click a cada botón
    buttons.forEach(function(button) {
        button.addEventListener('click', function() {
            var url = this.getAttribute('data-url');
            cargarUrlEnEditorContainer(url);
        });
    });
});

