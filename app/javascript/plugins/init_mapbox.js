import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
    const mapElement = document.getElementById('map');

    if (mapElement) { // only build a map if there's a div#map to inject into
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v10',
            zoom: 10,
            scrollZoom: false
        });
        const markers = JSON.parse(mapElement.dataset.markers);
        map.on('load', function (e) {
            map.loadImage(
                'https://res.cloudinary.com/dwtp8jc27/image/upload/v1615743453/EatBetter/markers/picto_wjkzds.png',
                function (error, image) {
                    if (error) throw error;
                    map.addImage('custom-marker', image);
                    map.addSource('markers', {
                        type: 'geojson',
                        data: markers,
                        cluster: true,
                        clusterMaxZoom: 14,
                        clusterRadius: 50
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

                    map.jumpTo({center: markers.features[0].geometry.coordinates});
                    map.on('click', function (e) {
                        const marker = map.queryRenderedFeatures(e.point, {

                        })
                        if (marker[0].layer.id === "markers")
                        {
                            const activeMarker = document.getElementById(`${marker[0].id}`);
                            activeMarker.classList.add('active-id');
                        }
                    });
                }
            )
        });
    }
};

export { initMapbox };