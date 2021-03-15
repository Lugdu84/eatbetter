import places from 'places.js';
// autocomplete for create or search
const initAutocomplete = () => {
    const addressInput = document.getElementById('query');
    /*if (addressInput) {
        places({ container: addressInput });
    }*/

    const placesAutoComplete = places({
        container: addressInput,
    });
    /*placesAutoComplete.on('locate', function resultSelected(e) {
        console.log(e);
    });*/

    const findMe = document.getElementById('locate-me')
    findMe.addEventListener('click', function(e) {
        e.preventDefault();
        findMe.textContent = 'Localisation...';

        const afterLocal = () => {
            findMe.textContent = 'Me géolocaliser';
        }

        const error = () => {
            // no localisation
            alert('Localisation impossible !');
            afterLocal();
        };

        const success = (position) => {
            let coords = position.coords;
            const lat = coords.latitude.toFixed(6);
            const lng = coords.longitude.toFixed(6);
            placesAutoComplete.reverse(lat + ',' + lng);
            afterLocal();
        }
        navigator.geolocation.getCurrentPosition(success, error);
    });
    placesAutoComplete.on('reverse', function resultSelected(e) {
        const suggestion = e.suggestions[0];
        document.getElementById('query').value = suggestion.city;
    });
};

export { initAutocomplete };