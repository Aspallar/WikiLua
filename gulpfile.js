var gulp        = require('gulp');
var browserSync = require('browser-sync').create();
var proxyMiddleware = require('http-proxy-middleware');

const logLevel = 'silent';

const apiProxy = proxyMiddleware('/api.php', {
  target: 'http://magicarena.wikia.com/api.php',
  // target: 'http://aspallar.wikia.com/api.php',
  changeOrigin: true,
  logLevel: logLevel
});

const wikiProxy = proxyMiddleware('/wiki/', {
  target: 'http://magicarena.wikia.com',
  // target: 'http://aspallar.wikia.com/wiki/',
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

gulp.task('default', ['serve']);
