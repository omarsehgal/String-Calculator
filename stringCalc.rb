#!/usr/bin/ruby


# samle input will be "", "56", "847"
def myAdd1(str)
  if str.empty?
    return 0
  end 
  strArray = str.split(/,/)

  if strArray.size > 3
    return "-E- too many numbers"  
  end

  tot = 0
  strArray.each do |s|
    tot = Integer(s) + tot  
  end
  return tot
end

# allows "5,3,6,7,5,4,3"
def myAdd2(str)
  if str.empty?
    return 0
  end 
  strArray = str.split(/,/)
  tot = 0
  strArray.each do |s|
    tot = Integer(s) + tot  
  end
  return tot
end

# handles newlines but does not allow 1,\n
def myAdd3(str)
  if str =~ /,\n|\n,/
    return "-E- malformed parameter"
  end

  if str.empty?
    return 0
  end 
  strArray = str.split(/,|\n/)
  tot = 0
  strArray.each do |s|
    tot = Integer(s) + tot  
  end
  return tot
end

# handles newlines, custom delimiter but does not allow 1,\n
def myAdd4(str)
  d = ""
  if str =~ /^\/\/(.)/    
    d = $1  
  end
  
  puts "delimiter is: #{d}"
  
  if str =~ /,\n|\n,/
    return "-E- malformed parameter"
  end

  if str.empty?
    return 0
  end 
  
  if d.empty?
    strArray = str.split(/,|\n/)
  else 
    # first split by newline
    chunks = str.split(/\n/)
    
    # chunk two is what we want to use for further processing
    strArray = chunks[1].split(/#{d}/)  
  end  
  
  puts "size of the array is: #{strArray.size}"
  
  tot = 0  
  # we don't want the first guy which is the delimiter
  strArray.each do |s|
    tot = Integer(s) + tot  
  end
  return tot
end

# checks for negative numbers passed
def myAdd5(str)
  # check for negatives
  begin
    if str =~ /(-\d)/
      raise "-E- negative numbers not allowed: #{$1}"
    end
  rescue
    puts "-W- rescued negative numbers: #{(str.scan(/(-\d)/)).join(',')}"
    exit;
  end  

  d = ""
  if str =~ /^\/\/(.)/    
    d = $1  
  end
  
  if str =~ /,\n|\n,/
    return "-E- malformed parameter"
  end

  if str.empty?
    return 0
  end 
  
  if d.empty?
    strArray = str.split(/,|\n/)
  else 
    # first split by newline
    chunks = str.split(/\n/)
    
    # chunk two is what we want to use for further processing
    strArray = chunks[1].split(/#{d}/)  
  end  
  
  puts "size of the array is: #{strArray.size}"
  
  tot = 0  
  # we don't want the first guy which is the delimiter
  strArray.each do |s|
    tot = Integer(s) + tot  
  end
  return tot
end


# testing 1
puts "case 1:\n"
puts myAdd1("4,5,6")
puts myAdd1("5,6")
puts myAdd1("6")
puts myAdd1("")
puts myAdd1("4,5,6,7")

# testing 2
puts "\ncase 2:\n"
puts myAdd2("4,5,6,7,8")

# testing 3
puts "\ncase 3:\n"
puts myAdd3("4\n5,6")
puts myAdd3("5,6")
puts myAdd3("6")
puts myAdd3("")
puts myAdd3("4,5\n,6\n7")

# testing 4
puts "\ncase 4:\n"
puts myAdd4("//;\n5;6")
puts myAdd4("//;\n5;6;7")
puts myAdd1("5,6")
puts myAdd1("6")

# testing 4
puts "\ncase 4:\n"
puts myAdd5("//;\n-5;-6;-7")
