var gulp        = require('gulp');
var browserSync = require('browser-sync').create();

gulp.task('serve', function() {

    browserSync.init({
        // proxy: "localhost:10200"
        port: 10200,
        server: {
            baseDir: "./src/web"
        }
    });

    // gulp.watch(['node_modules/bootstrap/scss/bootstrap.scss', 'src/scss/*.scss'], ['sass']);
    gulp.watch(["src/web/**/*.html", "src/web/**/*.css", "src/web/**/*.js"]).on('change', browserSync.reload);
});

gulp.task('default', ['serve']);
