module.exports = function(grunt) {

  require('load-grunt-tasks')(grunt);

  var concatAnim;

  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    /** 合并css **/
    concat: {
      dist: {
        src: [ 'source/_base.css', 'source/**/*.css' ], // _base.css required for .animated helper class
        dest: 'common.css'
      }
    },




    /** 智能处理浏览器前缀 **/
    autoprefixer: {
      options: {
        browsers: ['last 3 versions', 'bb 10', 'android 3']
      },
      no_dest: {
        src: 'cartoon.css' // output file
      }
    },


    /** 压缩css **/
    cssmin: {
      minify: {
        src: ['cartoon.css'],
        dest: 'cartoon.min.css'
      }
    },

    /** 监听修改 **/
    watch: {
      css: {
        files: [ 'source/**/*', 'cartoon-config.json' ],
        tasks: ['default']
      }
    }

  });

  // fuction to perform custom task
  concatAnim = function () {

    var categories = grunt.file.readJSON('cartoon-config.json'),
      category, files, file,
      target = [ 'source/common.css' ],
      count = 0;

    for ( category in categories ) {
      if ( categories.hasOwnProperty(category) ) {
        files = categories[category]
        for (file in files) {
          if ( files.hasOwnProperty(file) && files[file] ) {
            target.push('source/' + category + '/' + file + '.css');
            count += 1;
          }
        }
      }
    }

    if (!count) {
      grunt.log.writeln('No animations activated.');
    } else {
      grunt.log.writeln(count + (count > 1 ? ' animations' : ' animation') + ' activated.');
    }

    grunt.config('concat', { 'cartoon.css': target });
    grunt.task.run('concat');

  };

  // register task

  /** 自定义 **/
  grunt.registerTask('concat-anim', 'Concatenates activated animations', concatAnim);
  grunt.registerTask('default', ['concat-anim', 'autoprefixer', 'cssmin']);
  /** 实时修改 **/
  grunt.registerTask('dev', ['watch']);

};
