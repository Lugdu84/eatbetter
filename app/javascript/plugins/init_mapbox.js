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
            zoom: 10,
            center: [lat, lng],
            scrollZoom: false
        });

        //map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
        //        mapboxgl: mapboxgl }));
        if (markers.features.length > 0 )
        {
            map.on('load', function (e) {
                map.loadImage(
                    'https://res.cloudinary.com/dwtp8jc27/image/upload/v1615743453/EatBetter/markers/picto_wjkzds.png',
                    function (error, image) {
                        if (error) throw error;
                        map.addImage('custom-marker', image);
                        map.addSource('markers', {
                            type: 'geojson',
                            data: markers,
                           // cluster: true,
                           // clusterMaxZoom: 14,
                            //clusterRadius: 100
                        });
                        map.addLayer({
                            'id': 'markers',
                            'type': 'symbol',
                            'source': 'markers',
                            'layout': {
                                'icon-image': 'custom-marker'
                            }
                        });
                        map.on('click', 'markers', function (e) {
                            map.flyTo({
                                center: e.features[0].geometry.coordinates
                            });
                        });

                        //map.jumpTo({center: markers.features[0].geometry.coordinates});
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
                                //TODO implements take center in parentNode
                            }
                        });
                    }
                )
            });

        }
        const cards = document.querySelector('.cards-farm');
        cards.onscroll = (e) => {
            markers.features.forEach ((marker) => {
                const id = marker.properties.id;
                if (isElementOnScreen(id)){
                    map.flyTo({
                        center: marker.geometry.coordinates,
                    });
                    //TODO Implement change icon of markerActive
                }
            });

        };
    }

    const isElementOnScreen = (id) => {
        const element = document.getElementById(id);
        const bounds = element.getBoundingClientRect();
        //console.log(bounds.left);
        //console.log(bounds.right);
        return (bounds.left < window.innerWidth / 2) && (bounds.right > window.innerWidth / 2) ;
    }
};

export { initMapbox };