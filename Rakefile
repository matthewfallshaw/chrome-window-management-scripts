%w[rubygems rake].each {|l| require l }
 
task :default => :install_libraries

desc "Install Applescript libraries to ~/Library/Script Libraries/"
task :install_libraries

Dir["*Library.scpt"].each do |lib|
  libdir = File.expand_path("~/Library/Script Libraries/")
  libfile = File.join(libdir, lib)
  desc lib
  file libfile => lib do
    mkdir_p libdir
    cp lib, libdir
  end
  task install_libraries: libfile
end
