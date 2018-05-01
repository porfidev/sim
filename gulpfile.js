/**
 * Dependencias
 */
var gulp        = require('gulp');
var concat      = require('gulp-concat');
var uglify      = require('gulp-uglify');
var minifyHTML  = require('gulp-minify-html');

gulp.task('js', function () {
    gulp.src([
        'resources/js/sim.js'
        ]
    )
    .pipe(concat('sim.js'))
    //.pipe(uglify())
    .pipe(gulp.dest('public/js/'));
});