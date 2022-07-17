require "securerandom"
require "./Auth_profile.rb"
module Auth
	$b=1
	def Auth.ask
	    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"  
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
		$a=[]
		h={}
		begin
		$b=SecureRandom.random_number(100)
		# puts $b
		f1=File.new('admin_ids.txt','r')
		l=f1.read
		if l.size==0
			tem=[]
			tem.push($b)
			f1.close
			f2=File.new('admin_ids.txt','w')
			f2.write(tem)
			f2.close
			puts 'Enter Your name or for exit press 0'
			n=gets.chomp
			nv=/^[a-zA-Z]{3,15}$/
			if(n=="0")
				a=A.new
			end
			puts 'Enter your mail'
			m=gets.chomp
			mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
			puts 'Enter your Password'
			pa=gets.chomp
			pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
			puts 'Enter your Mobile no'
		    mob =gets.chomp
		    mobv=/^(?:[+]{1}+[9]{1}+[1]{1}+[6789]{1}+[0-9]{9})$/
		    if (nv.match?(n) && mv.match?(m) && pv.match?(pa) && mobv.match?(mob))
		            id=$b
		            h.store("id",id)
		            h.store("name",n)
		            h.store("mail",m)
		            h.store("pass",pa)
		            h.store("Mob",mob)
		            f3=File.new("admin_info.txt",'w')
		            $a.push(h)
		            f3.write($a)
		            sleep(2)
		            print 'wait for the conformation'
		            puts 'data inserted'
		            Auth.login
		    else 
		    	raise
		    end
		else 
			f1.close
			if l.include?($b.to_s)
				puts "dublicate"
				raise
		    else
		    	id=$b
		    	k12=File.new('admin_ids.txt','r')
		    	j2=k12.read 
		    	k12.close
		    	j2=eval(j2)
                j2.push($b)
                k13=File.new('admin_info.txt','r')
                collectdata=k13.read 
                k13.close
                collectdata=eval(collectdata)
                puts 'Enter your name and for exit press 0'
			    n=gets.chomp
			    nv=/^[a-zA-Z]{3,15}$/
			    if n=="0"
			    	print 'please wait for a moment'
			    	sleep(2)
			    	print 'logout success fully'
			    	sleep(0.5)
			    	a=A.new
			    end
			    puts 'Enter your mail'
			    m=gets.chomp
			    mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
			    puts 'Enter your Password'
			    pa=gets.chomp
			    pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
			    puts 'Enter your Mobile no'
		        mob =gets.chomp
		        mobv=/^(?:[+]{1}+[9]{1}+[1]{1}+[6789]{1}+[0-9]{9})$/ 
		        if (nv.match?(n) && mv.match?(m) && pv.match?(pa) && mobv.match?(mob))
		             h.store("id",id)
		             h.store("name",n)
		             h.store("mail",m)
		             h.store("pass",pa)
		             h.store("Mob",mob)
		             collectdata.push(h)
		             k14=File.new('admin_info.txt','w')
		             k14.write(collectdata)
		             k14.close
		             k12=File.new('admin_ids.txt','w')
                     k12.write(j2)
                     k12.close
		             puts 'data inserted'
		             puts 'please wait!!!'
		             sleep(2)
                     Auth.login
                else
                	raise
                end
            end
		end
	rescue
		retry
	end
	end
	def Auth.login
		puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 
		puts "****************************************************Welcome To Admin Login Page************************************************"
		puts "\n\n\n\n\n\n"
		f=File.new('admin_info.txt','r')
		j=f.read 
		j=eval(j)
		puts 'Enter Your Name for exit press 0'
		askname=gets.chomp
        if askname=="0"
        	a=A.new
        end
		puts 'Enter Your Password'
		askpas=gets.chomp
		for i in 0...j.length do  
			if (j[i]['name']==askname) && (j[i]['pass']==askpas)
				Auth_view.profile(askname,askpas)
		    else
		    	p 'invaild password Enter again'
		    	sleep(0.5)
		    	raise
            end
	    end
	  rescue
	  	retry
	end
end
