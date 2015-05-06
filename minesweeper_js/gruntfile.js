
module.exports = function(grunt) {

    var files = [
        'libs/*.js',
        'test/*.js',
        'app.js',
        'gruntfile.js'
    ];

    grunt.initConfig({
        watch: {
            js: {
                files: files,
                tasks: [
                    'jshint',
                    'mochaTest'
                ]
            }
        },
        jshint: {
            all: files
        },
        mochaTest: {
            options: {
                reporter: 'spec',
                timeout: 3000
            },
            src: [
                'test/*.js'
            ]
        }
    });

    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-jshint');
    grunt.loadNpmTasks('grunt-mocha-test');

    grunt.registerTask('default', [
        'watch'
    ]);

    grunt.registerTask('test', [
        'mochaTest'
    ]);
    
    
};