$a1=0
$c1=0
require './user.rb'
module Request
	def Request.friends(n1,m,p,g,dummyname='a1b')
		flag1=0
        f1=File.new('friendslist.txt','r')
        fj=f1.read
        f1.close
    if dummyname!='a1b'
        if fj.size==0
            a=[]
            ar=[]
            h1={}
            a.push(dummyname)
            h1.store(n1,a)
            ar.push(h1)
            abc=File.new('Singupdata.txt','r')
            abc1=abc.read
            abc.close
            f1=File.new('friendslist.txt','w')
            f1.write(ar)
            f1.close
            puts 'request Accept'
            User.see(n1,m,p,g)
        elsif fj.size!=0
            f1=File.new('friendslist.txt','r')
            f2=f1.read
            f1.close
            f2=eval(f2)
            for i in 0...f2.length do 
                temp=f2[i].keys
                temp1=f2[i].values
                for j in temp do
                    if j==dummyname then
                       for j1 in temp1 do
                           for g1 in j1 do 
                              if g1==n1
                                flag1+=1
                              end
                            end
                       end
                    end
                end
            end
            if flag1>0
                 f1=File.new('friendslist.txt','r')
                f3=f1.read
                f1.close
                f3=eval(f3)
                a=[]
                h1={}
                a.push(dummyname)
                h1.store(n1,a)
                f3.push(h1)
                f1=File.new('friendslist.txt','w')
                f1.write(f3)
                puts 'request Accept'
                f1.close
                User.see(n1,m,p,g)
            end
            if flag1==0
                f1=File.new('friendslist.txt','r')
                f3=f1.read
                f1.close
                f3=eval(f3)
                a=[]
                h1={}
                a.push(dummyname)
                h1.store(n1,a)
                f3.push(h1)
                f1=File.new('friendslist.txt','w')
                f1.write(f3)
                puts 'request Accept'
                f1.close
                User.see(n1,m,p,g)
            end
        end
    else
         d=1
         drx=0
         t=File.new('friendslist.txt','r')
         k=t.read
         t.close
         p "******************************friend List****************************"
        if k.size!=0
            k=eval(k)
         for i in 0...k.length do 
              tm=k[i].keys
              for i1 in tm do 
                 if i1==n1
                    drx+=1
                    tm1=k[i].values
                     for j1 in tm1 do
                        for k1 in j1 do 
                          puts "#{d}:--->#{k1}"
                          d+=1
                        end
                      end
                  end
               end
            end
     
           if drx>0
             User.see(n1,m,p,g)
           else
             puts "No Friends here"
             User.see(n1,m,p,g)
           end
     else
        p 'no friends'
        User.see(n1,m,p,g)
    end
    end
    end
	def Request.req(n1,m,p,g)
        flag12=0
		f1=File.new('friendslist.txt','r')
        f11=f1.read
        f1.close
        if f11.size==0
            za=0
            flag=0
            f1=File.new('userdatarequest.txt','r')
            a1=f1.read
            f1.close
           if a1.size==0 then
            p 'no requests'
            User.see(n1,m,p,g)
           else
            a1=eval(a1)
              for i in 0...a1.length do 
                k=a1[i].keys
                v=a1[i].values
                for i1 in v do 
                    for i2 in i1 do 
                        if i2==n1 then
                            for i3 in k do 
                                flag+=1
                                puts "#{flag}:---------------------#{i3}"
                                break
                            end
                        end
                    end
                end
              end 
            f1=File.new('userdatarequest.txt','r')
            a1=f1.read
            f1.close
            a1=eval(a1)
            p 'Which User You Want to Accept Request'
            reqname=gets.chomp
		    for i in 0...a1.length do
		     	trep=a1[i].values
		     	jrep=a1[i].keys
		     	for i1 in trep do 
                    for k1 in i1 do 
                    	for k2 in jrep do 
                    		if k2==n1 then
                    			if k1==reqname
                    				flag+=1
                    				break
                    			end
                    		end
                    	end
                    end
                end
		    end
		    if flag>0
		    	Request.friends(n1,m,p,g,reqname)
		    else
		    	print 'This name is not available in your request list'
	            User.see(n1,m,p,g)	
	        end
	    end
        else
        	flag=0
        	f2=File.new('userdatarequest.txt','r')
            f12=f2.read
            f2.close
           f11=eval(f11)
           f12=eval(f12)
           for i in 0...f12.length do 
           temp=f12[i].keys
           jrep=f12[i].values
           for i1 in 0...f11.length do 
            temp1=f11[i1].keys
            jrep1=f11[i1].values
            for j in temp1 do 
                for j1 in jrep do 
                    for j2 in j1 do 
                        if j2==j 
                            for z1 in temp do 
                                for z2 in jrep1 do 
                                    for z3 in z2 do 
                                        if z1==z3
                                            j1.delete(j)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            end
            end
            z5=File.new('userdatarequest.txt','w')
            z5.write(f12)
            z5.close
            flag=0
            f1=File.new('userdatarequest.txt','r')
            a1=f1.read
            f1.close
           if a1.size==0 then
            p 'no requests'
            User.see(n1,m,p,g)
           else
            zx=1
            a1=eval(a1)
              for i in 0...a1.length do 
                k=a1[i].keys
                v=a1[i].values
                for i1 in v do 
                    for i2 in i1 do 
                        if i2==n1 then
                            zx+=1
                            for i3 in k do 
                                flag+=1
                                puts "#{flag}:---------------------#{i3}"
                                break
                            end
                        end
                    end
                end
              end
            if zx>1 then
            f1=File.new('userdatarequest.txt','r')
            a1=f1.read
            f1.close
            a1=eval(a1)
            p 'Which User You Want to Accept Request'
            reqname=gets.chomp
		    for i in 0...a1.length do
		     	trep=a1[i].values
		     	jrep=a1[i].keys
		     	for i1 in trep do 
                    for k1 in i1 do 
                    		if n1==k1 then
                                for k2 in jrep do 
                    			   if k2==reqname
                    			     	flag12+=1
                    			    	break
                    			   end
                    		    end
                    	    end
                    end
                end
		    end
		    if flag12>0
		    	Request.friends(n1,m,p,g,reqname)
		    else
		    	print 'This name is not available in your request list'
	            User.see(n1,m,p,g)	
	        end
            else
                p 'no request here'
                 User.see(n1,m,p,g)
            end
             end 
    end
	end
	def Request.more(n,mail,p,g)
		m=1
		f=File.new('Singupdata.txt','r')
		j=f.read
		j=eval(j)
		for i in 0...j.length do  
			puts "#{m} :->         #{j[i]['name']}"
			m+=1
		end
		puts "if you want to send some request in there then press 1"
		puts 'for exit then press -1'
		puts 'if you want to go to Home page then press 0'
		ask=gets.chomp
        if ask=='1'
        	Request.specific(n,mail,p,g)
        elsif ask=='-1'
        	exit
        elsif ask=='1'
        	a=A.new
        else
        	print "invaild option"
            User.see(n,mail,p,g)
        end
	end
	def Request.specific(n,mail,p,g)
		flag=0
		m=1
		a=[]
		f=File.new('Singupdata.txt','r')
		j=f.read
		f.close
		j=eval(j)
		for i in 0...j.length do  
			puts "#{m} :->         #{j[i]['name']}"
			m+=1
			a.push(j[i]['name'])
		end 
		puts 'tell us which user you want to send request','for Back then press 0','For Exit then press -1'
		tell=gets.chomp
	    if tell=="0" then
	    	Request.more(n,mail,p,g)
	    elsif tell=='-1'
	    	exit
	    else
        bmx=0
		f=File.new('Singupdata.txt','r')
		j=f.read
		j=eval(j)
		f.close
		k=[]
        a11=File.new('friendslist.txt','r')
        a12=a11.read
        a11.close
        a12=eval(a12)
        for i in 0...a12.length do 
            tema=a12[i].keys
            jrepa=a12[i].values
            for j11 in tema do 
                if tell==j11
                    for j1 in jrepa do 
                        for j2 in j1 do 
                            if j2==n 
                                bmx+=1
                                sleep(0.5)
                                break
                            end
                        end
                    end
                end
            end
        end
        if bmx==0
		   for i in 0...j.length do  
			    k.push(j[i]['name'])
		   end
		   for i in k do 
			if i==tell
				flag+=1
				break
			else
				flag=0
			end
		   end
		 if flag>0
			Request.update_request(tell,n,mail,p,g)
		 else
			p 'invaild name'
			raise
         end
        end
        if bmx>0
        p 'these are alredy friends'
        sleep(1)
        raise
        end
    end
    rescue
    	retry
	end
	def Request.update_request(tell,n,mail,p,g)
		z12=0
		f1=File.new('userdatarequest.txt','r')
		m=f1.read
		f1.close
		if m.size==0
			a=[]
			b={}
			arr=[]
			f1=File.new('userdatarequest.txt','r')
			tem=f1.read
			f1.close
			print tem
			a.push(tell)
			b.store(n,a)
			arr.push(b)
			sleep(0.5)
			print "request sent"
			f1=File.new('userdatarequest.txt','w')
			f1.write(arr)
			f1.close
			User.see(n,mail,p,g)
		else
			f2=File.new('userdatarequest.txt','r')
			te=f2.read
			f2.close  
			te=eval(te)
			for i in 0...te.length do
				pre=te[i].keys
				for j in pre
				   if j==n
				   	  tpre=te[i].values
					  for i1 in tpre do
                          for j1 in i1 do 
                          	if tell==j1
                          		p "request alredy sent"
                          		sleep(0.5)
                          		raise
                          	elsif tell==n 
                          		p "you can't send request to your self"
                          		raise
                          	else
                          		z12+=1
                          	end
                          end
                      end
					end
				end
			end
			if z12>0
			    for i in tpre do 
				    i.push(tell)
				end
				f2=File.new('userdatarequest.txt','w')
			    f2.write(te)
				f2.close  
			    sleep(0.5)
			    print "request sent"
				User.see(n,mail,p,g)
			else
				a=[]
			    b={}
				f1=File.new('userdatarequest.txt','r')
			    tem=f1.read
			    f1.close
			    tem=eval(tem)
			    a.push(tell)
			    b.store(n,a)
			    tem.push(b)
			    sleep(0.5)
			    print "request sent"
			    f1=File.new('userdatarequest.txt','w')
			    f1.write(tem)
			    f1.close
			    User.see(n,mail,p,g)
			end
		end
    end

end
