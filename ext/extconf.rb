require 'mkmf'

dir_config('proj')

if not find_header('proj_api.h', '../../../../../../../../.heroku/vendor/include')
  
  puts '###############'
  puts 'DEBUG:'
  puts Dir.pwd
  puts __FILE__
  puts Dir.glob("/**/proj_api.h", File::FNM_DOTMATCH)
  puts '###############'
  
  raise('Cannot find proj_api.h header')
end

have_header('projects.h')

unless have_library('proj', 'pj_init') or
       have_library('libproj', 'pj_init')
       
  puts '###############'
  puts 'DEBUG:'
  puts Dir.pwd
  puts __FILE__
  puts Dir.glob("/**/libproj*", File::FNM_DOTMATCH)
  puts Dir.glob("/**/proj*", File::FNM_DOTMATCH)
  puts '###############'
       
  raise('Cannot find proj4 library')
end

create_makefile 'proj4_ruby'
