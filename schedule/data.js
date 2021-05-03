var results = []
const fetch = require('node-fetch');
const Bluebird = require('bluebird');
fetch.Promise = Bluebird;
fetch("https://apis.wemap.asia/geocode-1/search?text=135 cầu giấy&key=GqfwrZUEfxbwbnQUhtBMFivEysYIxelQ")
    .then(response => response.json()).then(data => {
        coordinate = data.features[0].geometry.coordinates
        results.push({
            "longitude": coordinate[0],
            "latitude": coordinate[1]
        })
        console.log(results)
    })


// const fs = require('fs');
// const jsonContent = JSON.stringify(results);

// fs.writeFile("./alphabet.json", jsonContent, 'utf8', function(err) {
//     if (err) {
//         return console.log(err);
//     }

//     console.log("The file was saved!");
// });