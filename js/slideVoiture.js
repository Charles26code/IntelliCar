// Caroussel modèles

function slideVoiture(side) {

    if (side =='left') {

        for (let i = 1; i < 11; i++) {

            recupClass = document.getElementById('voiture-' + i).className;

            num = recupClass.split("-");

            totalPlace = parseInt(num[1]) + 1;

            if (parseInt(totalPlace) > 10) {
                totalPlace = 1;
                newClass = "place-" + totalPlace;

            } 

            else {
                newClass = "place-" + totalPlace;
            }

            document.getElementById('voiture-' + i).classList.remove(recupClass);

            document.getElementById('voiture-' + i).classList.add(newClass);
        }
    } 

    else {

        for (let i = 1; i < 11; i++) {

            recupClass = document.getElementById('voiture-' + i).className;

            num = recupClass.split("-");

            totalPlace = parseInt(num[1]) - 1;

            if (parseInt(totalPlace) < 1) {
                totalPlace = 10;
                newClass = "place-" + totalPlace;

            }
            else {
                newClass = "place-" + totalPlace;
            }

            document.getElementById('voiture-' + i).classList.remove(recupClass);

            document.getElementById('voiture-' + i).classList.add(newClass);

        }
    }

}