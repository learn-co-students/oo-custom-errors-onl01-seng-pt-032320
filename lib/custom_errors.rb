class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
        self.partner = person
        if person.class != Person
          begin
            raise PartnerError
          rescue PartnerError => error
              puts error.message
          end
        else
          person.partner = self
        end
      end
  
  class PartnerError < StandardError
    def message
           "you must give the get_married method an argument of an instance of the person class!"
  end
   end
end

beyonce = Person.new("Beyonce")
beyonce.get_married("Jay-Z")
puts beyonce.name

 

# Now we have a nice, informative, custom error message that will make it really
# clear to our users what went wrong if they encounter this error. Now we're ready
# to implement our `rescue`.

# ### Step 2: Implementing the `rescue`

# The basic pattern of error rescuing is as follows:

# ```ruby
# begin
#   raise YourCustomError
# rescue YourCustomError
# end
# ```

# Let's implement this code in our `#get_married` method:

# ```ruby
# def get_married(person)
#     self.partner = person
#     if person.class != Person
#       begin
#         raise PartnerError
#       rescue PartnerError => error
#           puts error.message
#       end
#     else
#       person.partner = self
#     end
# end
# ```

# If the object passed into the method as an argument *is not* an instance of the
# `Person` class, we will `begin` our error handling. First, we `raise` our
# `PartnerError`, then we `rescue` our `PartnerError`. The `rescue` method creates
# an instance of the `PartnerError` class and `puts` out the result of calling
# `message` on that instance.

# At this point, the code in `custom_errors.rb` should look like this:

# ```ruby
# class Person
#   attr_accessor :partner, :name

#   def initialize(name)
#     @name = name
#   end

#   def get_married(person)
#     self.partner = person
#     if person.class != Person
#       begin
#         raise PartnerError
#       rescue PartnerError => error
#           puts error.message
#       end
#     else
#       person.partner = self
#     end
#   end

#   class PartnerError < StandardError
#     def message
#       "you must give the get_married method an argument of an instance of the person class!"
#     end
#   end
# end

# beyonce = Person.new("Beyonce")
# beyonce.get_married("Jay-Z")
# puts beyonce.name
# ```

# Now, run the file one more time, and you'll see that not only is our custom
# error message printed out but the program continues to run and will execute the
# `puts beyonce.name` line:

# ```bash
# you must give the get_married method an argument of an instance of the person class!
# Beyonce
# ```

# <p data-visibility='hidden'>View <a href='https://learn.co/lessons/oo-custom-errors' title='Custom Errors'>Custom Errors</a> on Learn.co and start learning to code for free.</p>






