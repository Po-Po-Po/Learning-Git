const moment = require('moment');
const fs = require('fs');

const logger = (action) => {
    fs.readFile('./db/stats.json', (err, data) => {
        if (err){
            console.log(err);
        } else {
            var stat = JSON.parse(data);
            stat.push({
                time: moment().format('DD MMM YYYY, h:mm:ss a'),
                action: action,
            });
            fs.writeFile('./db/stats.json', JSON.stringify(stat, null, 4), (err) => {
                if (err) { 
                    console.log(err);
                }
            });
        }
    })
};

module.exports = logger;