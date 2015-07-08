module Star_Wars

# Displays your options
  def display_choices
    puts <<-END
    What would you like to do/say?
      Options: #{yield}
      Enter the letter corresponding to your choice.
    END
  end

# This is yoour first option, answering (y) or (n) will take the user to the next set of ooptions while (a) ends the game
  def display_intro
    puts "You've woken up to find yourself in a med. Something speaks as you're vision begins to
    come back. 'Hello, I'm C-3PO and you're on the Millenium Falcon. It appears your vitals
    have stabilized. Do you remember anything?'"
    puts
    sleep(2)
    display_choices { "(y)es, (n)o, (a)ttack the droid" }
    med_bay
  end


# If answered yes or no you will go to this next, answering c will be game over
  def med_bay
    case gets.chomp.downcase
    when "y"
      puts "C-3PO helps you up."
      puts
      sleep(2)
      puts "You: \"Take me to your pilot.\""
      puts
      sleep(2)
      puts "C-3PO: \"Yes, ok...\""
      puts
      sleep(2)
      puts "The droid walks you past few empty rooms as well as one filled with a large wookie"
      puts
      sleep(2)
      display_choices { "(k)eep going on into control room, (c)heck out the room with the wookie" }
        next_choice
     when "n"
      puts "C-3PO helps you up."
      puts
      sleep(2)
      puts "C-3PO: \"Well sir we picked you up back on Tatooine. You seemed to have been knocked out.\""
      puts
      sleep(2)
      puts "You: \"Take me to your pilot.\""
      puts
      sleep(2)
      puts "C-3PO: \"Yes, ok...\""
      puts
      sleep(2)
        display_choices { "(k)eep going on into control room, (c)heck out the room with the
            wookie" }
            next_choice
      when "a"
      puts "You attack the droid but turn around to see a large wookie who knocks you out."
          game_over
      else
          med_bay
      end
    end
  end

# If answer k  or c you will go to this option, answering (a) will take the user to the next set of options while (t) at this option will be game over
def next_choice
  case gets.chomp.downcase
    when "k"
      puts "You make your way into the control room to find no one there. Suddenly you hear someone behind you."
      puts
      sleep(2)
      puts "Han Solo: \"What're you doing in here!? C-3PO, I you to keep the idiot in the med bay.\""
      puts
      sleep(2)
      puts "C-3PO: \"Sir, I tried to stop him, but\""
      puts
      sleep(2)
      puts "Han Solo: \"Yeah, I'm sure you did. Well kid I can drop you off back in Tatooine or you can come with me to Alderaan.\""
      puts
      sleep(2)
       display_choices { "(t)atooine, (a)lderaan" }
       destination_choice
    when "c"
      puts "you try to make your way into the wookie's room, but it yells as you enter and knocks you back out."
      game_over
    else
      next_choice
    end
  end

# Next options; (y) takes user to next set of options while (n) ends the game
def destination_choice
  case gets.chomp.downcase
    when "t"
      puts "Han Solo: \"Fine, buddy, but dont expect me to come back for you when you're lost in the desert again.\""
      puts
      sleep(2)
      puts "The Millenium Falcon turns around and lands in a dusty desert. You get out of the ship to find yourself alone."
      puts
      game_over
    when "a"
      puts "Han Solo: \"That's what I like to hear. Hey Chewy get in here, we're headed to Alderaan!\""
      puts
      sleep(2)
      puts "The large wookie enters the control room."
      puts
      sleep(2)
      puts "Chewbaca: \"Rrrrlllggghlllghgh rrrlllgghhgh!!\""
      puts
      sleep(2)
      puts "Han Solo: \"I know you don't trust him yet Chewy, neither do I, but he might be able to help us.\""
      puts
      sleep(2)
      puts "Chewbaca: \"Rrrllgghhh!!\""
      puts
      sleep(2)
      puts "Han Solo: \"I'm watchin' him Chewy, I'm the pilot, remember? If he acts up I give you persmission to send him back to the med bay, lets play some cards.\""
      puts
      sleep(2)
      display_choices { "(y)es, (n)o" }
      card_game
    else
      destination_choice
    end
  end

# In this set of options if the user calls they will win the card game and go to the next set of options while if they fold they lose the card game but still go on
def card_game
  case gets.chomp.downcase
  when "y"
    puts "after losing a few rounds of cards of cards a strange old man sits next to you."
    puts
    sleep(2)
    puts "Han Solo: \"I'm all in kid.\""
    puts
    sleep(2)
    puts "The old man whispers to you 'he's got an Ace high call him.'"
    puts
    sleep(2)
    display_choices { "(c)all, (f)old"}
    card_game2
  when "n"
    puts "Han Solo: \"Ahh you're no fun, should've left you in the desert.\""
    game_over
  else
    card_game
  end
end

# (y)es sends the user to win the game, while (n)o ends the game in defeat
def card_game2
  case gets.chomp.downcase
  when "c"
    puts "Han Solo flips over his cards to reveal what is an Ace high!"
    puts
    sleep(2)
    puts "Han Solo: \"Hey buddy what'd you say to him?\""
    puts
    sleep(2)
    puts "Old Man: \Nothing. Hello I am Obi-Wan Kenobi\""
    puts
    sleep(2)
    puts "Han Solo: \"Yeah whatever, old man.\""
    puts
    sleep(2)
    puts "Chewbaca: \"Rrrrrgggllhh\""
    puts
    sleep(2)
    puts "Han Solo: \"Well we're here. Let's get a drink\""
    puts
    sleep(2)
    display_choices { "(y)es, (n)o"}
    bar
  when "f"
    puts "you lose the rest of your money on the way to Alderaan."
    puts
    sleep(2)
    puts "Han Solo: \"Well we're here. Let's get a drink\""
    puts
    sleep(2)
    display_choices { "(y)es, (n)o"}
    bar
  else
    card_game2
  end
end


def bar
  case gets.chomp.downcase
  when"y"
    puts "Alderaan has been destroyed, but you're still here. You get a drink with Han Solo."
    game_over
  when "n"
    puts "Han Solo: \"You are boring\""
    puts
    sleep(2)
    puts "Han Solo leaves you on a destroyed Alderaan"
    game_over
  else
    bar
  end
end

# Method to end the game at various points throughout
def game_over
  puts "Game over."
  puts "\nPlay again? Y/N"
  choice = $stdin.gets.chomp.upcase
  if choice == 'Y'
    display_intro
  else
    exit(0)
  end
end
