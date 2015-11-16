# PoullouQueue

Queue management abstraction.

## Setup

  In Gemfile :

  ```ruby
  gem 'poullouqueue', git: 'https://github.com/Poullou/poullouqueue.git', branch: 'master'
  ```

  Then initialize :

  ```ruby
  queue = PoullouQueue::Queue.new
  ```

## Interfaces

### Available interfaces

It is possible to use available interfaces such as InMemory interface :

  ```ruby
  queue = PoullouQueue::Queue.new(interface: :in_memory)
  ```

Available interfaces :
* in_memory

In memory interface is set by default.

### Custom interfaces

Custom interface must be a ruby module which respond to many methods :

  ```ruby
  module CustomInterface

    def push(*elements); end

    def pull(amount = nil); end

    def size; end

    def empty?; end

    private

    def initialize_interface; end
  end
  ```

Initialize interface method is call on queue initialization.

Custom interfaces are used this way :

  ```ruby
    queue = PoullouQueue::Queue.new(interface: CustomInterface)
  ```

## Helpers

### Repetition

It is possible to execute a block every x seconds :

  ```ruby
    queue.every(5) do |q|
      ...
    end
  ```

Proc condition can be join to enhance repetition :

  ```ruby
    queue.every(2, ->(queue){ queue.size > 10 }) do |q|
      ...
    end
  ```

In this example, every two seconds, if queue size is greater than ten elements, block is executed.

Every methods use its own thread to watch the queue.

Block exception are rescued and logged in order to not breaking the thread.

### Log

Logger are initialized this way :

  ```ruby
   queue = PoullouQueue::Queue.new(logger: logger)
  ```

Default logger redirect to STDOUT with warn level.
