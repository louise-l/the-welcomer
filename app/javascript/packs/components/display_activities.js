const displayActivities = () => {
  const formElement = document.querySelector('.submit-activity');
  if (formElement) {
    formElement.addEventListener('click', (event) => {

      const addressHTML = document.querySelector('.targeted-activity');
      const address = document.querySelector('.targeted-activity').value;
      const mapboxKey = 'pk.eyJ1IjoiY2hhcmxlc3ByIiwiYSI6ImNraDY2Mng1ZTA1cnUyc2wycnpod2h5YmoifQ.XvjMe2F6c6U-fTfdEWHvZQ';
      const address_team = addressHTML.dataset.address;

      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address_team + " " +address}.json?access_token=${mapboxKey}`)
        .then(response => response.json())
        .then((data) => {
          const coordinates = {
            lng: data.features[0].geometry.coordinates[0],
            lat: data.features[0].geometry.coordinates[1]
          };
          // injectCoordinates(coordinates);
          //injectMap(coordinates);
        });
    });
  };
};

export {displayActivities}
