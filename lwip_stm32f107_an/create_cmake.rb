if ARGV.size != 3
	puts "usage: libraries_list exec_list project_name"
	exit
end

rawlibfiles = IO.readlines(ARGV[0])
rawexecfiles = IO.readlines(ARGV[1])
name = ARGV[2]

libfiles,execfiles = [],[]
rawlibfiles.each do |libfile|
	libfile = libfile.chomp # remove carriage return for string manip
	libfiles << libfile
end

rawexecfiles.each do |execfile|
	execfile = execfile.chomp
	execfiles << execfile
#	puts 'testing exec base ' + File.basename( execfile, File.extname(execfile) )
end

libnames,libpaths,deplist = [],[],[]
libfiles.each do |libfile|
  nicklib = libfile.gsub('/','_')
  if (nicklib) 
    libnames << nicklib
  else
    libnames << libfile
  end
	libpaths << File.dirname(libfile)
	deplist.insert(0,libnames.last)
#	puts "testing libpath #{libpaths.last} and names #{libnames.last} libfile #{libfile}"
end
#puts "testing dependency list #{deplist.join(' ')}"

puts "cmake_minimum_required(VERSION 2.8)"
puts "project(#{name})"
puts 'SET_PROPERTY(GLOBAL PROPERTY USE_FOLDERS ON)'

libfiles.each_with_index do |libfile,i|
	puts 'add_library('+libnames[i]
	Dir.glob(libfile+'/*.cpp') do |cppfile|
		puts '	${CMAKE_SOURCE_DIR}/'+cppfile
	end
	Dir.glob(libfile+'/*.cc') do |cppfile|
		puts '	${CMAKE_SOURCE_DIR}/'+cppfile
	end
	Dir.glob(libfile+'/*.c') do |cppfile|
		puts '	${CMAKE_SOURCE_DIR}/'+cppfile
	end
	Dir.glob(libfile+'/*.h') do |hfile|
		puts '	${CMAKE_SOURCE_DIR}/'+hfile
	end
	Dir.glob(libfile+'/*.hpp') do |hfile|
		puts '	${CMAKE_SOURCE_DIR}/'+hfile
	end
	puts ')'
	puts 'message(STATUS "added '+libnames[i]+' library")'
	puts 'SET_PROPERTY(TARGET '+libnames[i]+'                PROPERTY FOLDER "lib")'

end
3.times { puts '' }
puts 'message(STATUS "adding include directories")'
puts 'include_directories('
libfiles.each do |libfile|
	puts '	${CMAKE_SOURCE_DIR}' + '/' + libfile
end
puts ')'
puts 'message(STATUS "added include directories")'
3.times { puts '' }

exec_names = []
execfiles.each do |execfile|

	exec_base = File.basename( execfile, File.extname(execfile) )
	exec_names << exec_base
	
	puts 'add_executable(' + exec_base + ' ' + execfile+')'
  puts 'target_link_libraries(' + exec_base + ' ' + deplist.join(' ') + ' ${EXTERNAL_LIBS})'
	puts 'message(STATUS "added ' + exec_base + ' exec and target link libraries ' + deplist.join(' ') + '")'
	puts ''
end

#puts 'target_link_libraries('+exec_names.join(' ') + ' ' + deplist.join(' ')+' ${EXTERNAL_LIBS})'
#puts ''

puts 'set(CMAKE_BUILD_TYPE Release)'
