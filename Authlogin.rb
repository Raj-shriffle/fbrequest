require "securerandom"
require "./Auth_profile.rb"
require 'io/console'
module Auth
	$b=1
	def Auth.ask
	    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"  
		puts '******************************************************Admin*************************************************************'
		puts '1.Create Admin'
		puts '2.Login'
		puts '3.Home page'
		puts '4.Exit'
		ask=gets.chomp
		if ask=="1"
			Auth.create
		elsif ask=="2"
            Auth.login
        elsif ask=="3"
        	a=A.new
        elsif ask=='4'
        	exit
        else 
        	print 'invaild option'
        	sleep(1)
        	raise
        end
    rescue 
    	retry
	end
	def Auth.create
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 
		puts "****************************************************Welcome To Admin Singup Page************************************************"
		puts "\n\n\n\n\n\n"
		puts 'Enter Your name or for exit press 0'
		n=gets.chomp
		if n=="0"
				Auth.ask
		else
			   	Auth.name_check(n)
		end
	end	
	def Auth.name_check(n)
		nv=/^[a-zA-Z]{3,15}$/
		if nv.match?(n)
			Auth.email_check(n)
		else
			p 'Enter Again Name'
			sleep(2)
			raise
		end
	rescue
		retry
end
	def Auth.email_check(name)
		   p 'Enter Your Mail'
		   m=gets.chomp
		   mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
		   if mv.match?(m)
			  Auth.pass_check(name,m)
		   else
		   	  p 'incorrect mail'
			  sleep(0.5)
			  raise
		   end
	rescue
		retry
end
    def Auth.pass_check(name,email)
		puts 'Enter your password (Password length should be 10 digit)'
		pa = STDIN.noecho(&:gets).chomp
		pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
		if pv.match?(pa)
			Auth.mob_check(name,email,pa)
		else
			p 'A minimum 10 characters password contains a combination of uppercase or lowercase with digit'
		    sleep(1)
			raise
        end
	rescue
		retry
end
	def Auth.mob_check(name,email,pass)
		puts 'Enter your Mobile no'
		mob =gets.chomp
		mobv=/^(?:[+]{1}+[9]{1}+[1]{1}+[6789]{1}+[0-9]{9})$/
		if mobv.match?(mob)
			Auth.validation(name,email,pass,mob)
		else
			raise
		end
	rescue
		p 'Phone no not less that 10 char with india country code'
		sleep(1)
		retry
end
	def Auth.validation(n,m,pa,mob)
		                 k12=File.new('admin_info.txt','r')
		    	         j2=k12.read 
		    	         k12.close
		    	         $b=SecureRandom.random_number(100)
		    	         if j2.size==0
		                      a=[]
		                      h={}
		                      id=$b
		                      h.store("id",id)
		                     h.store("name",n)
		                     h.store("mail",m)
		                     h.store("pass",pa)
		                     h.store("Mob",mob)
		                     f3=File.new("admin_info.txt",'w')
		                     a.push(h)
		                     f3.write(a)
		                     f3.close
		                     p 'wait for the conformation'
		                     sleep(1)
		                     p 'data inserted'
		                     sleep(1)
		                     Auth.login
		                 else
		                 	byebug
		                    if j2.include?($b.to_s)
				                puts "dublicate"
				            raise
		                    else
		                     j2=eval(j2)
		                      h={}
		                      id=$b
		                      h.store("id",id)
		                     h.store("name",n)
		                     h.store("mail",m)
		                     h.store("pass",pa)
		                     h.store("Mob",mob)
		                     j2.push(h)
		                     f3=File.new("admin_info.txt",'w')
		                     f3.write(j2)
		                     f3.close
		                     p 'wait for the conformation'
		                     sleep(1)
		                     p 'data inserted'
		                     sleep(1)
		                     Auth.login
		                    end
		                end
		            rescue
		            	retry
		       
    end	
	def Auth.login
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 
		puts "****************************************************Welcome To Admin Login Page************************************************"
		puts "\n\n\n\n\n\n"
		puts 'Enter Your Name /OR/ for exit press 0'
		askname=gets.chomp
		if askname=='0'
			Auth.ask 
		else
		    f=File.new('admin_info.txt','r')
		    j=f.read 
		    j=eval(j)
            for i in 0...j.length do  
    	    if j[i]['name']==askname
               Auth.paslog_check(askname)
    	    else
    	    	p 'Name Not Correct'
    	    	sleep(1)
    		    raise
    	    end
            end
        end
    rescue
    	retry
   end
    def Auth.paslog_check(n)
    	p 'Enter Your Password'
    	askpas = STDIN.noecho(&:gets).chomp
    	f=File.new('admin_info.txt','r')
		j=f.read 
		j=eval(j)
            for i in 0...j.length do  
    	    if j[i]['pass']==askpas
    	    	p 'please wait for a movement'
    	    	sleep(1)
    	    	p 'login successfully'
    	    	sleep(1)
    	    	print "\n\n\n\n\n\n\n\n\n"
               Auth_view.take(n,askpas)

    	    else
    	    	p 'Password Not Match'
    	    	sleep(1)
    		    raise
    	    end
            end
        rescue
    	retry
    end
end
