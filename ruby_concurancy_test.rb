def data(input)
  output = `rake load:data[#{input}]` # Note tidle operator ` will create separate process
  puts output
end

def run
  threads = []
  Start=0
  SIZE = 4
  Total = 5
  End = (SIZE*Total)-1
  (Start..End).to_a.shuffle.shuffle.each do |input|
    threads << Thread.new { data(input) }
  end
  puts threads.inspect
  # Why am I using threads?
  # To acheive concurancy I am creating each process in separate thread.
  threads.each(&:join)
end
run
