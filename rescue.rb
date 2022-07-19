def a
	b=gets.to_i
	if(b==1)
		p "ok"
	else
		raise
	end
	rescue
		retry
end
a