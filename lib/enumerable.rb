module Enumerable
  # You can now do an easy progress bar in your #each loops.  
  #
  #   (1..1000000).to_a.each_with_progressbar { |x| x + 1 }
  #   Progress:      100% |oooooooooooooooooooooooooooooooooooooooooo| ETA:  00:00:00
  #   
  # Understands the following options:
  #
  #   :title => "My label" (default: "Progress")
  #   :length => [a number] (default: calls #length)
  #
  # On each iteration, the progress bar is updated.  An 
  # unusual side-effect of the frequent updates is that
  # it isn't particularly efficient so watch out for
  # fast loops with millions of cycles.
  #
  def each_with_progressbar(options={})
    options[:title] ||= "Progress"
    options[:length] ||= self.length

    ConsoleProgressbar.new(options[:title], options[:length]) do |bar|
      each do |obj|
        bar.inc
        yield obj
      end
    end
    puts ""
  end
end
