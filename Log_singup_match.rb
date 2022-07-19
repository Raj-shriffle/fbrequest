module Logsing
	def Logsing
		ls=File.New("logdatafile.txt","r")
		sing=File.new("Singupdatafile.txt","r")
		lg=ls.read
		lg1=sing.read
		puts lg  
		puts lg1
		sing.close
		ls.close
	end
end