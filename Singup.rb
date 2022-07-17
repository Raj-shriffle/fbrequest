require "./Login.rb"
module Singup 
	    $ar=[]
		def Singup.sing(id,nam,mail,pas,mobile,gender)
			f=File.new('Singupdata.txt','r')
			j=f.read
			j=eval(j)
			f.close
			b={}
			id=id
			name=name
			mail=mail
			pas=pas
			mobile=mobile
			gender=gender
			b.store('id',id)
			b.store('name',nam)
			b.store('mail',mail)
			b.store('pas',pas)
			b.store('G',gender)
            f=File.new('Singupdata.txt','a')
            if(f.size==0)
            	p 'this will print'
            	$ar.push(b)
            	f.write($ar)
            	f.close
            else
            	f.close
            	f1=File.new('Singupdata.txt','w')
            	j.push(b)
            	f1.write(j)  
            	f1.close
            end
            puts 'wait for the conformation'
            sleep(2)
            puts 'ok Singup Success fully'
            Login.log
		end
end