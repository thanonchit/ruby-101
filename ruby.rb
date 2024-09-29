# Define User class
class User
    attr_accessor :name, :email, :password
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = []
    end
  
    # Method to enter a room
    def enter_room(room)
      room.add_user(self)
      @rooms << room
      puts "#{@name} has entered the room: #{room.name}"
    end
  
    # Method to send a message to a room
    def send_message(room, content)
      if @rooms.include?(room)
        message = Message.new(self, room, content)
        room.broadcast(message)
      else
        puts "You are not in this room!"
      end
    end
  
    # Method to acknowledge receiving a message
    def acknowledge_message(room, message)
      puts "#{@name} received a message in #{room.name}: #{message.content}"
    end
  end
  
  # Define Room class
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    # Method to add user to the room
    def add_user(user)
      @users << user unless @users.include?(user)
    end
  
    # Method to broadcast a message to all users
    def broadcast(message)
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  end
  
  # Define Message class
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  # Example usage:
  
  # Create users
  mels = User.new("mels", "mels@vlr.gg", "032546")
  aspas = User.new("aspas", "aspas@world.gg", "aspaszin")
  yay = User.new("yay", "yay@noteam.gg", "el diablo")
  # Create a room
  chat_room = Room.new("vlr chat", "Valorant community")
  
  # Users enter the room
  mels.enter_room(chat_room)
  aspas.enter_room(chat_room)
  
  # mels sends a message
  mels.send_message(chat_room, "No where to run!")
  
  # aspas sends a message
  aspas.send_message(chat_room, "Come on let's go!")

  # yay sends a message
  yay.send_message(chat_room, "You want to play let's play!")
  