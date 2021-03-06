// NOTE: gulp and browserSync are no longer being used during development
//       so this file is probably out of date
//       left here in case I ever goback to using it (unlikely as it installs half the world
///      as dependencies + CORS problemd when running locally)

var gulp = require('gulp');
var browserSync = require('browser-sync').create();
var proxyMiddleware = require('http-proxy-middleware');

const logLevel = 'silent';

const apiProxy = proxyMiddleware('/api.php', {
  // target: 'http://aspallar.wikia.com/api.php',
  target: 'http://magicarena.wikia.com/api.php',
  changeOrigin: true,
  logLevel: logLevel
});

const wikiProxy = proxyMiddleware('/wiki/', {
  // target: 'http://aspallar.wikia.com/wiki/',
  target: 'https://magicarena.wikia.com/wiki/',
  changeOrigin: true,
  logLevel: logLevel
});

gulp.task('serve', function() {

    browserSync.init({
        // proxy: "localhost:10200"
        port: 10200,
        server: {
            baseDir: "./src/web",
            middleware: [apiProxy, wikiProxy]
        }
    });

    // gulp.watch(['node_modules/bootstrap/scss/bootstrap.scss', 'src/scss/*.scss'], ['sass']);
    gulp.watch(["src/web/**/*.html", "src/web/**/*.css", "src/web/**/*.js"]).on('change', browserSync.reload);
});

gulp.task('default', gulp.series('serve'));
