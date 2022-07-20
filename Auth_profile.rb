require "./Authlogin.rb"
module Auth_view
	def Auth_view.profile(getname,getpas)
		file=File.new('admin_info.txt','r')
		a=file.read
		a=eval(a)
		file.close
		for i in 0...a.length do  
			if (a[i]['name']==getname) && (a[i]['pass']==getpas)
				n=a[i]['name']
				m=a[i]['mail']
				p1=a[i]['pass']
				mob=a[i]['Mob']
			end  
		end
		print "\n\n\n\n\n\n\n\n"
		puts "\t\t\t\t\t\t\t\tAdmin Profile"
		puts "Name                           #{n}"
		puts "Mail                           #{m}"
		puts "Password                       #{p1}"
		puts "Mobile                         #{mob}"
		puts "\n\n"
		Auth_view.take(getname,getpas)
	end
	def Auth_view.data
		k=1
		j={}
		file=File.new('Singupdata.txt','r')
		a=file.read
		a=eval(a)
		for i in 0...a.length do  
               j.store(i,a[i]['name'])
        end
		puts "\t\t\t\t\t\t\t\tUsers"
        mj=j.values
        for i in mj do 
         puts "#{k}                           #{i}"
         k+=1
        end
        Auth_view.take
    end
    def Auth_view.take(a='a',b='b')
    	puts "****************************************Welcome Admin************************"
        puts '1.view_Profile'
        puts '2.view_Users'
        puts '3.update_users'
        puts '4.logout'
        puts '5.Delete_users'
        puts '6.Exit'
        ask=gets.chomp.to_i
        case ask  
           when 1
           	Auth_view.profile(a,b)
           when 2
           	Auth_view.data
           when 3 
           	Auth_view.Userdata_operation
           when 4
           	Auth.ask
           when 5
           	Auth_view.delete
           when 6
           	 exit
           when 8
           	 exit
           else 
           	p 'invaild option'
           	sleep(1)
           	 raise
        end
    rescue 
    	retry
	end
	def Auth_view.Userdata_operation
		v=1
		getdata=File.new('Singupdata.txt','r')
		take=getdata.read
		take=eval(take)
		getdata.close
		blank={}
		for i in 0...take.length do 
			blank.store(i,take[i]['name'])
		end
		puts "\t\t\t\t\t\t\tAll Users"
		tem=blank.values
		for i in tem do 
			puts "#{v}                        #{i}"
			v+=1
		end
		puts "\t\t\t\t\t\t\tWhich User Data You Want To Update Enter Their Name"
		Auth_view.update_options
	end
	def Auth_view.update_options
		      array=[]
		      flag=0
		      input=gets.chomp
              dataget=File.new("Singupdata.txt",'r')
              arr=dataget.read
              arr=eval(arr)
              dataget.close
              for i in 0...arr.length do 
              	if arr[i]['name']==input
              		array.push(arr[i]['name'])
              		array.push(arr[i]['mail'])
              		array.push(arr[i]['pas'])
              		array.push(arr[i]['G'])
              		flag+=1
              		break
                end
              end
              if flag>0
                  Auth_view.select_op(*array,input)
              else
              	p 'inviald','Enter vaild name'
              	raise
              end
          rescue
          	 retry       	
	end
	def Auth_view.select_op(*array,input)
       data=File.new("Singupdata.txt",'r')
       ar=data.read
       ar=eval(ar)
       data.close
       puts '1.update Name','2.Update mail','3.update pass','4.update G','5.back'
       op=gets.chomp
       if op=="1"
       	  for i in 0...ar.length do 
       	 	if ar[i]['name']==array[0]
       	 		puts 'Enter Your Update Name'
       	 		update_name=gets.chomp
       	 		ar[i]['name']=update_name
       	 		puts 
       	 		as=File.new("Singupdata.txt",'w')
       	 		as.write(ar)
       	 		p  'name update'
       	 		as.close
       	 		requestfileupdate=File.new('userdatarequest.txt','r')
       	 		demo=requestfileupdate.read 
       	 		requestfileupdate.close
       	 		demo=eval(demo)
       	 		for i in 0...demo.length do 
       	 			jtre=demo[i].keys
       	 			tre=demo[i].values
       	 			if jtre.include?(input)
       	 				puts
       	 			end
       	 		end
       	 		Auth_view.take
       	 	end
       	end
       elsif op=="2"
       	for i in 0...ar.length do 
       	 	if ar[i]['mail']==array[1]
       	 		puts 'Enter Your Mail'
       	 		update_mail=gets.chomp
       	 		ar[i]['mail']=update_mail
       	 		print 'name updated'
       	 		puts 
       	 		as=File.new("Singupdata.txt",'w')
       	 		as.write(ar)
       	 		p  'mail update'
       	 		as.close
       	 		Auth_view.take
       	 	end
       	 end
       	elsif op=="3"
       	 for i in 0...ar.length do 
       	 	if ar[i]['pas']==array[2]  
       	 		puts 'Enter Your Pass'
       	 		update_pas=gets.chomp
       	 		ar[i]['pas']=update_pas
       	 		print 'name updated'
       	 		puts 
       	 		as=File.new("Singupdata.txt",'w')
       	 		as.write(ar)
       	 		p 'Password update'
       	 		as.close
       	 		Auth_view.take
       	 	end
       	 end
       	elsif op=="4"
       	 for i in 0...ar.length do 
       	 	 if ar[i]['G']==array[3]  
       	 		puts 'Enter your Gender'
       	 		update_gen=gets.chomp
       	 		ar[i]['G']=update_gen
       	 		print 'Gender updated'
       	 		puts 
       	 		as=File.new("Singupdata.txt",'w')
       	 		as.write(ar)
       	 		print 'Password update'
       	 		as.close
       	 		Auth_view.take
       	 	 end
       	 end
       	 elsif op=="5"
                Auth_view.data
       	else
       		p 'invaild option'
       		sleep(0.5)
       		raise
       	end
      rescue
      	retry
	end
	def Auth_view.logout
		a=A.new
	end
	def Auth_view.delete
	 fatchdata=File.new("Singupdata.txt","r")
	 get=fatchdata.read
	 get=eval(get)
	 fatchdata.close
	 puts 'which user data you want to delete'
	 take=gets.chomp
	 for i in 0...get.length do 
	 	if get[i]['name']==take
	 		get.delete(get[i])
	 		p 'data deleted'
	 		fatchdata=File.new("Singupdata.txt","w")
            fatchdata.write(get)
            fatchdata.close
            break
        end
      end
      j2=File.new('admin_info.txt','r')
      g2=j2.read
      g2=eval(g2)
      Auth_view.data
	end
end