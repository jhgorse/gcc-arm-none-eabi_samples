<h1>create_cmake.rb</h1>
This is a simple ruby script and sample lib which takes
a list of libraries (with paths) and executables and generates a CMakeLists.txt file. 
The CMakeLists.txt file will generate build files on many platforms include linux, os x, windows in the 
form of makefiles and visual studio solutions. See <a href="http://www.cmake.org/">cmake.org</a> for all
supported build systems.

In this example to generate the CMakeLists.txt file first a lib.list and an exec.list is needed, see the included files
for examples of formats (file lists but order matters, put your latest dependency last on the lib list).

In the project directory run:

	ruby create_cmake.rb lib.list exec.list test > CMakeLists.txt

Then from the project root type

	cd build
	cmake ..
	
And cmake will determine a default build system for your architecture. For mine (OS X Lion) the default is make.

You can specificy specific builds by typing:
	cmake
This yields a listing of supported platforms. Here's an example of what showed up on my home system:
The following generators are available on this platform:
<pre>
	Unix Makefiles              = Generates standard UNIX makefiles.
	Xcode                       = Generate XCode project files.
	CodeBlocks - Unix Makefiles = Generates CodeBlocks project files.
	Eclipse CDT4 - Unix Makefiles = Generates Eclipse CDT 4.0 project files.
	KDevelop3                   = Generates KDevelop 3 project files.
	KDevelop3 - Unix Makefiles  = Generates KDevelop 3 project files.
</pre>

For example, you may create an Xcode project with:

	cmake -G Xcode (path to CMakeLists.txt file)
	
	
