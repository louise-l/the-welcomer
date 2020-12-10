const findActivities = () => {
  const formElement = document.querySelector('.submit-activity');
  if (formElement) {
    formElement.addEventListener('click', (event) => {

      const addressHTML = document.querySelector('.targeted-activity');
      const address = document.querySelector('.targeted-activity').value;
      const mapboxKey = 'pk.eyJ1IjoiY2hhcmxlc3ByIiwiYSI6ImNraDY2Mng1ZTA1cnUyc2wycnpod2h5YmoifQ.XvjMe2F6c6U-fTfdEWHvZQ';
      const address_team = addressHTML.dataset.address;

      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address_team}+${address}.json?access_token=${mapboxKey}`)
        .then(response => response.json())
        .then((data) => {
          const info = {
            poiName0: data.features[0].text,
            poiAddress0: data.features[0].properties.address,
            poiRelevance0: data.features[0].relevance,
            poiName1: data.features[1].text,
            poiAddress1: data.features[1].properties.address,
            poiRelevance1: data.features[1].relevance,
            poiName2: data.features[2].text,
            poiAddress2: data.features[2].properties.address,
            poiRelevance2: data.features[2].relevance,
            poiName3: data.features[3].text,
            poiAddress3: data.features[3].properties.address,
            poiRelevance3: data.features[3].relevance,
            poiName4: data.features[4].text,
            poiAddress4: data.features[4].properties.address,
            poiRelevance4: data.features[4].relevance,
          };
        const divActivity = document.querySelector('.activity-container');
        divActivity.innerHTML = '';
        if (info['poiRelevance0'] > 0.8) {
          divActivity.insertAdjacentHTML ('beforeend', `
            <div class='white-card margin-box-activity p-2 '>
              <h2 class='activity-title text-center'>${info['poiName0']}</h2>
              <p class='activity-address text-center'>${info['poiAddress0']}</p>
            </div>
            `);
        };
        if (info['poiRelevance1'] > 0.8) {
          divActivity.insertAdjacentHTML ('beforeend', `
            <div class='white-card margin-box-activity p-2 '>
              <h2 class='activity-title text-center'>${info['poiName1']}</h2>
              <p class='activity-address text-center'>${info['poiAddress1']}</p>
            </div>
            `);
        };
        if (info['poiRelevance2'] > 0.8) {
          divActivity.insertAdjacentHTML ('beforeend', `
            <div class='white-card margin-box-activity p-2 '>
              <h2 class='activity-title text-center'>${info['poiName2']}</h2>
              <p class='activity-address text-center'>${info['poiAddress2']}</p>
            </div>
            `);
        };
        if (info['poiRelevance3'] > 0.8) {
          divActivity.insertAdjacentHTML ('beforeend',`
            <div class='white-card margin-box-activity p-2 '>
              <h2 class='activity-title text-center'>${info['poiName3']}</h2>
              <p class='activity-address text-center'>${info['poiAddress3']}</p>
            </div>
            `);
        };
        if (info['poiRelevance4'] > 0.8) {
          divActivity.insertAdjacentHTML ('beforeend',`
            <div class='white-card margin-box-activity p-2 '>
              <h2 class='activity-title text-center'>${info['poiName4']}</h2>
              <p class='activity-address text-center'>${info['poiAddress4']}</p>
            </div>
          `);
        };
        setField()
      });
    });
  };
};


const setField = () => {
  const boxAct = document.querySelectorAll('.margin-box-activity');
  if (boxAct.length !== 0) {
    const setValue = document.querySelector('.targeted-activity');
    boxAct.forEach((box) => {
      if (box) {
        box.addEventListener('click', (event) => {
          const newValue = box.getElementsByTagName('p')[0].innerText;
          setValue.value = newValue;
        });
      };
    });
  }
};

export {findActivities, setField }

