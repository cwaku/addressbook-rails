const regionSelect = document.getElementById("region-select");
const citySelect = document.getElementById("city-select");
const suburbSelect = document.getElementById("suburb-select");

// deleteButtons.forEach(button => {
//   button.addEventListener("click", () => {
//     const contactId = button.dataset.contactId;
//     const contactName = button.dataset.contactName;

//     // set contactId to button with data-contact-id attribute
//     const deleteBtns = document.getElementsByClassName("delete-contact-btn");
//     for (let i = 0; i < deleteBtns.length; i++) {
//       deleteBtns[i].getAttribute("data-contact-id", contactId);
//     }

//     console.log(contactId);
//   });
// });

regionSelect.addEventListener("change", () => {
  const regionId = regionSelect.value;

  fetch(`/regions/${regionId}/cities.json`)
    .then(response => response.json())
    .then(cities => {
      citySelect.innerHTML = "<option value=''>Select a city</option>";

      cities.forEach(city => {
        const option = document.createElement("option");
        option.text = city.name;
        option.value = city.id;
        citySelect.appendChild(option);
      });
    });

  suburbSelect.innerHTML = "<option value=''>Select a suburb</option>";

});

citySelect.addEventListener("change", () => {
    const cityId = citySelect.value;

    fetch(`/cities/${cityId}/suburbs.json`)
        .then(response => response.json())
        .then(suburbs => {
        suburbSelect.innerHTML = "<option value=''>Select a suburb</option>";

        suburbs.forEach(suburb => {
            const option = document.createElement("option");
            option.text = suburb.name;
            option.value = suburb.id
            suburbSelect.appendChild(option);
        });
        });
    });
