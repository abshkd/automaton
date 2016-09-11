#ab@3computing.com
# 
# This generates a hosts file that you can use to replace /etc/hosts file and
# block unwanted sites.
# exclude.txt - File with hostnames you dont want to snub
# hosts - File with blacklisted hostname

require 'open-uri'
open('hosts.txt','w') do |file|
    file << open('http://winhelp2002.mvps.org/hosts.txt').read
end

if File.file?("exclude.txt")
    f= File.readlines("exclude.txt")
end    

if f.nil?
    File.rename('hosts.txt','hosts')
else
    re = Regexp.union(f)
    puts re
    puts f
    open('hosts','w') do |hosts|
        File.foreach('hosts.txt') do |line|
            hosts.puts(line) unless line.match(re)
        end
    end
    File.delete 'hosts.txt'
end    
