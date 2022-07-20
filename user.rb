$count =0
$count1=0
$count2=0
$count3=0
require './fbrequest.rb'
module User
	def User.u(mail,pas)
	  fu=File.new('Singupdata.txt','r')
	  v=fu.read
	  v=eval(v)
	  for i in 0...v.length do  
	     if pas==v[i]['pas'] && mail==v[i]['mail'] then
	         name=v[i]['name']
	         mail=v[i]['mail']
	         pass=v[i]['pas']
	         gender=v[i]['G']
	         User.see(name,mail,pass,gender)
	     end 
	  end
	  fu.close
	end
	def User.see(name,mail,pass,gender)
		print "\n\n\n\n\n\n\n"
		puts "********************************Welcome #{name}***********************************************"
		puts '1.View_Profile','2.UPDATE_PROFILE','3.LogOut','4.Friends','5.see Requests and accept','6.Send request','close program press 0'
		ask=gets.chomp
		if ask=="1"
			puts '**********************************************USER PROFILE*************************************************'
		    print "Name :-   #{name}"
		    puts  
		    print "Email :-  #{mail}"
		    puts 
		    print "Pass  :-  #{pass}"
		    puts 
		    print "Gen   :-  #{gender}"
		    User.see(name,mail,pass,gender)
		elsif ask=="2"
			puts "A.Update_Name"
			puts "B.Update_mail"
			puts "C.Update_pass"
			puts "D.update Gender"
			puts "E.BACK"
            User.updat(name,mail,pass,gender)
	    elsif ask=="3"
	    	puts "\t\t\t\t\t\t\tLogout successfully"
	    	puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts puts 
	    	a=A.new
	    elsif ask=="4"
	    	Request.friends(name,mail,pass,gender)
	    elsif ask=="5"
	    	Request.req(name,mail,pass,gender)
	    elsif ask=="6"
	    	Request.more(name,mail,pass,gender)
	    elsif ask=='0'
	    	exit
	    else
	    	p 'invaild!!'
	    	sleep(1)
	    	raise
	    end
	   rescue 
	   	retry
	end
	def User.updat(n,m,p1,gender)
	   puts "Enter Your Choice Here"
	   take=gets.chomp
	   if take=="A"
	   	User.update_name(n,m,p1,gender)
	   elsif take=="B"
	   	User.update_mail(n,m,p1,gender)
	   elsif take=="C"
	   	User.update_pass(n,m,p1,gender)
	   elsif take=="D"
	   	User.update_gender(n,m,p1,gender)
	   elsif take=="E"
	   	 User.see(n,m,p1,gender)
	   else
	   	 p 'invaild option'
	   	 raise
	   end
	   rescue
	   	retry
	end    
	def User.update_name(n,m,p1,gender)
		te=[]
		up=File.new('Singupdata.txt','r')
			g=up.read
			g=eval(g)
		  for i in 0...g.length do 
		  	te.push(g[i])
		  end
		up.close
		for i in 0...te.length do 
				if te[i]['name']==n
				  if $count==0
			          puts "enter Update name"
			          b=gets.chomp
			          nv=/^[a-zA-Z]{3,15}$/
			         if b.match?(nv)
				        te[i]['name']=b
				        p "data update"
				        uf=File.new("Singupdata.txt","w")
				        uf.write(te)
			            uf.close
			            User.see(n,m,p1,gender)
			         else
			    	    raise
			         end
			      else
			      	puts "The Name length should be greter then 3"
			      	puts "Enter again"
			          b=gets.chomp
			          nv=/^[a-zA-Z]{3,15}$/
			         if b.match?(nv)
				        te[i]['name']=b
				        p "data update"
				        uf=File.new("Singupdata.txt","w")
				        uf.write(te)
			            uf.close
			            User.see(n,m,p1,gender)
			         else
			         	print 'Enter vaild name'
			         	sleep(1)
			    	    raise
			         end
			       end
			    end
		end
	rescue
		$count+=1
		retry
	end
	def User.update_mail(n,m,p1,gender)
		te=[]
		up=File.new('Singupdata.txt','r')
			g=up.read
			g=eval(g)
		  for i in 0...g.length do 
		  	te.push(g[i])
		  end
		up.close
		for i in 0...te.length do 
				if te[i]['mail']==m 
					if $count1==0
				       puts "enter update email"
				       b=gets.chomp
				       mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
				       if b.match?(mv)
				           te[i]['mail']=b
				           uf=File.new("Singupdata.txt","w")
				           uf.write(te)
				           p "Data Updated"
			               uf.close
			               User.see(n,m,p1,gender)
			           else 
			           	raise 
			           end
			        else
			           puts "Password length should be 10 digit!!"
			           puts "Enter again"
				       b=gets.chomp
				       mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
				       if b.match?(mv)
				           te[i]['mail']=b
				           uf=File.new("Singupdata.txt","w")
				           uf.write(te)
				           p "Data Updated"
			               uf.close
			               User.see(n,m,p1,gender)
			           else 
			           	raise 
			           end
			        end
			    end
	    end
	rescue
		$count1+=1
	retry
    end
	def User.update_pass(n,m,p1,gender)
		te=[]
		up = File.new('Singupdata.txt','r')
		g=up.read
		g=eval(g)
		for i in 0...g.length do 
			te.push(g[i])
		end
		up.close
		for i in 0...te.length do 
				if te[i]['pas']==p1
					if $count2==0
					    p "Enter Updated Password"
					    b=gets.chomp
					    pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
					    if b.match?(pv)
				           te[i]['pas']=b
				           uf=File.new("Singupdata.txt","w")
				           uf.write(te)
				           p "Data Updated"
			               uf.close
			               User.see(n,m,p1,gender)
			            else
			            	raise
			            end
			        else
			        	p "Enter your Mobile no (mobile no should be writen by 10 digit with country code"
			        	p "Enter again Vaild Paasword"
					    b=gets.chomp
					    pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
					    if b.match?(pv)
				           te[i]['pas']=b
				           puts "enter updte pass"
				           uf=File.new("Singupdata.txt","w")
				           uf.write(te)
				           p "Data Updated"
			               uf.close
			               User.see(n,m,p1,gender)
			            else
			            	raise
			            end
			        end
		        end
	    end
	    rescue
	     $count2+=1
	     retry
    end
	def User.update_gender(n,m,p1,gender)
		te=[]
		up = File.new('Singupdata.txt','r')
		g=up.read
		g=eval(g)
		for i in 0...g.length do 
			te.push(g[i])
		end
		up.close
			for i in 0...te.length do 
				if te[i]['G']==gender
					if $count3==0
						puts "Enter update Gender Confrom"
					    b=gets.chomp
						if (b=="Male" || b=="M" || b=="m" || b=="Female" || b=="F" || b=="f")
			 	           te[i]['G']=b
			 	           p "Data Updated"
				           uf=File.new("Singupdata.txt","w")
				           uf.write(te)
			               uf.close
			               User.see(n,m,p1,gender)
			            else
			            	raise
			            end
			        else
			        	puts "Enter Again vaild  Gender Confrom"
					    b=gets.chomp
						if (b=="Male" || b=="M" || b=="m" || b=="Female" || b=="F" || b=="f")
			 	           te[i]['G']=b
			 	           p "Data Updated"
				           uf=File.new("Singupdata.txt","w")
				           uf.write(te)
			               uf.close
			               User.see(n,m,p1,gender)
			            else
			            	raise
			            end
			        end
			    end
	        end	
	    rescue 
	    	$count3+=1
	        retry
    end
end