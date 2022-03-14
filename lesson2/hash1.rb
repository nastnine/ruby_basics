hash = {
  january: 31,
  february: 28,
   march: 31,
    april: 30,
     may: 31
}
hash.each do |month,days|
  if days == 30
    puts "#{month}"
end
