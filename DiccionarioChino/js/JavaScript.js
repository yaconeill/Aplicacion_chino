function text_validate() {
    var word = document.getElementById("tbpalabra").value;
    var pron = document.getElementById("tbpron").value;
    var defn = document.getElementById("tbdefn").value;
    var wordExp = "[\u4e00-\u9fa5]";
    var pronExp = "([a-z]{1,6}[1-5]?)+";
    if (word.length === 0) {
        alert('Debe introducir una palabra.');
    }
    if (pron.length === 0) {
        alert('Debe introducir la pronunciación.');
    }
    if (defn.length === 0) {
        alert('Debe introducir una definición.');
    }
    if (word !== '') {
        if (!word.match(wordExp)) {
            alert("Campo palabra incorrecto. Introducir solo carácteres chinos.");
            return false;
        }
    }
    if (pron !== '') {
        if (!pron.match(pronExp)) {
            alert("Campo pronunciación incorrecto. El formato del texto debe ser como el siguiente: shang1hai3.");
            return false;
        }
    }
    return true;
}
function mass_validate() {
    var row = document.getElementById("GVmassadd").rows.length;
    for (var i = 0; i < row; i++) {
        var falta = "";
        var word = document.getElementById("GVmassadd_txbpalabra_" + i.toString()).value;
        var pron = document.getElementById("GVmassadd_txbpron_" + i.toString()).value;
        var defn = document.getElementById("GVmassadd_txbdefn_" + i.toString()).value;
        var wordExp = "[\u4e00-\u9fa5]";
        if (word.length === 0) {
            //alert('Debe introducir una palabra de la línea ' + (i + 1) + '.');
            falta = ' "palabra"';
        }
        if (pron.length === 0) {
            //alert('Debe introducir la pronunciación de la línea ' + (i + 1) + '.');
            falta += ' "pronunciación"';
        }
        if (defn.length === 0) {
            //alert('Debe introducir una definición de la línea ' + (i + 1) + '.');
            falta += ' "definición"';
        }
        if (falta.length > 2) {
            alert('En la línea ' + (i + 1) + ' faltan los campos:' + falta);
                return false;
        }
        if (word !== '') {
            if (!word.match(wordExp)) {
                alert('Campo palabra de la línea ' + (i + 1) + ' incorrecto. Introducir solo carácteres chinos.');
                return false;
            }
        }
    }
    return true;
}