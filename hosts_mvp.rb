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

open('hosts','w') do |hosts|
    File.foreach('hosts.txt') do |line|
        if f.nil?
            hosts.puts(line)
        else 
            hosts.puts(line)  unless f.include? line
        end
    end
end

File.delete 'hosts.txt'
