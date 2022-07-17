require 'byebug'
require 'io/console'
require './user.rb'
module Login
 	def Login.log
        puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
        puts "************************************************WELCOME TO THE LOGIN PAGE**********************************************"
        puts "\n\n\n\n\n\n"
        puts 'If You Want Close application then press:-0'
        puts 'If you want to go Home page then press:- -1'
        puts 'Enter your Mail'
        email=gets.chomp
        if email=='0'
            exit
        elsif email=='-1'
            a=A.new
        else
            mv=/^(?:[a-zA-Z0-9]+[@]{1}+[g]{1}+[m]{1}+[a]{1}+[i]{1}+[l]{1}+[.]{1}+[c]{1}+[o]{1}+[m]{1})$/
            if mv.match?(email)==false
                p 'invaiild email'
                sleep(0.5)
                raise
            end
            puts 'Enter your Password is Hidden '
            password= STDIN.noecho(&:gets).chomp
            pv=/^(?:[a-zA-Z]{1,5}+[0-9]{1,5})$/
            if pv.match?(password)==false
                p 'invaiild password'
                sleep(0.5)
                raise
            else
                fm=File.new('Singupdata.txt','r')
                m=fm.read
                m=eval(m)
                fm.close
                for i in 0...m.length do  
                 b=m[i].keys
                 if password==m[i]['pas'] && email==m[i]['mail']
                   p 'login success fully'
                   u=User.u(email,password)
                 end
                end
            end
        end
    rescue
        retry
end
end