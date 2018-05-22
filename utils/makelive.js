/*global require, process*/
/*jshint -W097 */ /*Use the function form of 'use strict'*/
'use strict';

var es = require('event-stream');

var deployLine = '';

process.stdin
    .pipe(es.split())
    .pipe(es.mapSync(function(line) {
        if (deployLine.length > 0)
            console.log(deployLine);

        var match = /(^\s*)\/\*deploy\s(.*)\*\//.exec(line);
        if (match) {
            deployLine = match[1] + match[2];
        } else {
            if (deployLine.length > 0) {
                deployLine = '';
            } else {
                console.log(line);
            }
        }
    })
    .on('error', function(err) {
        console.log('Error:', err);
    })
);
