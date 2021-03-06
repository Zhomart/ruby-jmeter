$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'ruby-jmeter'

test do
  threads count: 1 do
    Loop count:10 do
      counter 'CounterConfig.name' => 'visit',
        'CounterConfig.start' => 1,
        'CounterConfig.incr' => 1,
        'CounterConfig.end' => 100

      visit name: 'Home Page', url: 'http://google.com/'
    end
  end
end.run(path: '/usr/share/jmeter-2.11/bin/', gui: true)
