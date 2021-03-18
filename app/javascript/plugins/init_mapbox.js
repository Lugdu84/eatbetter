import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    if (mapElement) { // only build a map if there's a div#map to inject into
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const markers = JSON.parse(mapElement.dataset.markers);
        const lat = markers.coordinates[1];
        const lng = markers.coordinates[0];
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v10',
            zoom: 9,
            center: [lat, lng],
            scrollZoom: false
        });

        //map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        //        mapboxgl: mapboxgl }));
        if (markers.features.length > 0 )
        {
            map.on('load', function (e) {
                /*map.addSource('markers', {
                    type: 'geojson',
                    data: markers,
                    // cluster: true,
                    // clusterMaxZoom: 14,
                    //clusterRadius: 100
                });*/
                map.addLayer({
                    'id': 'markers',
                    'type': 'circle',
                    'source': {
                        'type': 'geojson',
                        'data': markers
                    }
                });
                map.on('click', 'markers', function (e) {
                    map.flyTo({
                        center: e.features[0].geometry.coordinates
                    });
                });

                map.on('click', function (e) {
                    const marker = map.queryRenderedFeatures(e.point, {

                    })
                    if (marker[0].layer.id === "markers")
                    {
                        const activeItem = document.getElementsByClassName('card-active');
                        if (activeItem[0]) {
                            activeItem[0].classList.remove('card-active');
                        }
                        const cardActive = document.getElementById(marker[0].properties.id);
                        cardActive.classList.add('card-active');
                        const bounds = cardActive.getBoundingClientRect();
                        cardActive.scrollIntoView();

                    }
                });
            });

            const addMarkers = () => {
                /* For each feature in the GeoJSON object above: */
                markers.features.forEach(function(marker) {
                    /* Create a div element for the marker. */
                    const el = document.createElement('div');
                    el.id =`marker-${marker.properties.id}`;
                    el.className = 'map-markers';
                    el.classList.add('all-marker', 'marker');
                    /**
                     * Create a marker using the div element
                     * defined above and add it to the map.
                     **/
                    const popup = new mapboxgl.Popup({
                        closeButton: false,
                    }).setHTML(marker.properties.infoWindow);
                    new mapboxgl.Marker(el, { offset: [0, 0] })
                        .setLngLat(marker.geometry.coordinates)
                        .setPopup(popup)
                        .addTo(map);
                });
            }

            const filterMarkers = (id) => {
                /* For each feature in the GeoJSON object above: */
                markers.features.forEach(function(marker) {
                    /* Create a div element for the marker. */
                    //const el = document.getElementsByClassName('map-markers');
                    const el = document.getElementById(`marker-${marker.properties.id}`);
                    if (marker.properties.id === id) {
                        el.classList.add('marker-active');
                    } else {
                        el.classList.remove('marker-active');
                    }
                    /**
                     * Create a marker using the div element
                     * defined above and add it to the map.
                     **/
                    new mapboxgl.Marker(el, { offset: [0, 0] })
                        .setLngLat(marker.geometry.coordinates)
                        .addTo(map);
                });
            }
            addMarkers();
            const cards = document.querySelector('.cards-farm');
            cards.onscroll = (e) => {
                markers.features.forEach ((marker) => {
                    const id = marker.properties.id;
                    if (isElementOnScreen(id)){
                        // Set card Active
                        const activeItem = document.getElementsByClassName('card-active');
                        if (activeItem[0]) {
                            activeItem[0].classList.remove('card-active');
                        }
                        const cardActive = document.getElementById(id);
                        cardActive.classList.add('card-active');
                        map.flyTo({
                            center: marker.geometry.coordinates,
                        });
                        filterMarkers(id);
                    }
                });
            };
        }
    }

    const isElementOnScreen = (id) => {
        const element = document.getElementById(id);
        const bounds = element.getBoundingClientRect();
        return (bounds.left < window.innerWidth / 2) && (bounds.right > window.innerWidth / 2) ;
    }
};

export { initMapbox };