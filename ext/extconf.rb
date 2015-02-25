require 'mkmf'

Dir.chdir '/'
puts Dir.glob("**/*", File::FNM_DOTMATCH)

dir_config('proj')

if not find_header('proj_api.h', '/app/.heroku/vendor/include')
  raise('Cannot find proj_api.h header')
end

have_header('projects.h')

unless have_library('proj', 'pj_init') or
       have_library('libproj', 'pj_init')
  raise('Cannot find proj4 library')
end

create_makefile 'proj4_ruby'
