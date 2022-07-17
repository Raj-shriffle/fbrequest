require "./Login.rb"
require 'io/console'
require_relative "Singup"
require "securerandom"
require "./Authlogin.rb"
$a=1
$b=[]
$z=1
class A
	include Login
	def initialize
		    print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"                
            puts "*******************************************************Welcome to the FaceBook***********************************"
            puts "\n\n\n\n\n\n"
            puts "\t\t\t\t\t\t\t1.Log_in"
            puts "\t\t\t\t\t\t\t2.New user please Singup"
            puts "\t\t\t\t\t\t\t3.For the exit"
            ask=gets.chomp
            case ask 
            	 when "1" 
            	 	Login.log
            	 when "2"
            	 	sing
            	 when "auth"
            	 	Auth.ask
            	 when "3"
            	 	exit
            	 else
            	 	p 'invaild option'
            	 	sleep(2)
            	 	raise 
            end
        rescue
        	print "\t\t\t\t\t\t\tinvaild option Enter Again!!"
        	retry
    end
    def sing
            begin
               	temp=[]
               	$a=SecureRandom.random_number(100)
                fh=File.new("Homeid.txt","r")
                v=fh.read
                fh.close
            if (j=v.include?($a.to_s))
                	puts "dublicate randome genrate #$a"
                	raise
            end
                     rescue
                     retry
            end
               if(j==false)
               	   temp.push($a)
               	   fh=File.new('Homeid.txt','a')
               	   fh.write(temp)
               	   fh.close
                   @id=$a
                   fh.close
                   @id=$a
                   info
               end
    end
    def info
    	    if $z==1
    	       print "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"                
               puts "********************************************Welcome To The Sinup page Please Fill your data here**********************"
               puts "\n\n\n\n\n\n"
            else
            	puts 'Enter Again vaild infomartion'
            end
            puts 'Enter Your Name (Name length should be grater then 3) or exit press 0'
	        n=gets.chomp
	         if(n=="0")
	         	a=A.new
	         end
	        nv=/^[a-zA-Z]{3,15}$/
	        if nv.match?(n) 
	            puts 'Enter Your Mail With '
	            m=gets.chomp
	            mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
	            if mv.match?(m) then 
	               puts 'Enter your password (Password length should be 10 digit)'
	               pa = STDIN.noecho(&:gets).chomp
	               pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
	               if pv.match?(pa) then 
	                  puts 'Enter your Mobile no (mobile no should be writen by 10 digit with country code)'
	                  mob=gets.chomp
	                  mobv=/^(?:[+]{1}+[9]{1}+[1]{1}+[6789]{1}+[0-9]{9})$/ 
	                  if mobv.match?(mob) 
	                      puts "Enter your Gender"
	                      gen=gets.chomp
	                      if (gen=="Male" || gen=="M" || gen=="m" || gen=="Female" || gen=="F" || gen=="f") then
	                                       puts "Please wait"
	                                       sleep(2)
	                                       Singup.sing(@id,n,m,pa,mob,gen)
	                      else
	                      	    p 'Gender should be one Capital Character'
	                      end
	                  else
	                  	  raise
	                  	  p 'Mobile No shuld be 10 with + india Contry Code'
        	          end
        	       else 
        	       	  raise
        	       	  p 'Password Shold be 10 length with One Digit only'
        	       end
        	    else
        	    	raise
        	    	p 'Email should be end with .com with no special symbols'
        	    end
        else
            p 'Name length should be greter 3 length'
            raise
        end	      
    rescue
    	$z+=1
    	retry
	end
end
a=A.new