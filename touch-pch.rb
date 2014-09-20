#!/usr/bin/ruby

def touch_pch_recursive(directory_path)
	if directory_path == nil
		return
	end
    
	Dir.foreach(directory_path) do |item|
		if item == "." or item == ".."
			next
		end

		full_path = File.join(directory_path, item)
		if File.directory?(full_path)
			touch_pch_recursive(full_path)
		end

  		if File.extname(item) == ".pch"
            puts "Touching #{full_path} ..."
            system "touch \"#{full_path}\""
  		end
  	end
end

directory_path = ARGV[0]
touch_pch_recursive(directory_path)
