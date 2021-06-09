def determine_current_date
    current_date = Time.new
    current_date.strftime("%m/%d/%Y")
end

class Blog
    @@blog_array=[]
    @@total_blogposts=0

    def Blog.add_it_up(post)
        @@total_blogposts += 1
    end
    
    def Blog.current_count
        puts "There are #{@@total_blogposts} blogposts"
    end
    
    def Blog.save_array(post)
        @@blog_array << post
    end
                                                        #How show post? push post?
    def Blog.publish
        @@blog_array.each do |info|
            p info
        end    
    end
    
end

class BlogPost < Blog
    def BlogPost.add_new

        post = new

        puts "Name your blog post"
        post.title = gets.chomp
        
        puts "Nice. Who are you again?"
        post.author = gets.chomp
        
        puts "What do you have to say for yourself?"
        post.content = gets.chomp
        
        post.date = determine_current_date
        
        post.add_new

        post.save

        puts "Do you want to create another blog post? Y/N"
        answer = gets.downcase.chomp
        if answer == "y"
        BlogPost.add_new
        
        end
    end

    def title
        @title
    end
    def title=(title)
        @title = title
    end

    def author
        @author
    end
    def author=(author)
        @author = author
    end

    def content
        @content
    end
    def content=(content)
        @content = content
    end

    def date
        @date
    end
    def date=(date)
        @date = date
    end

    def add_new
        BlogPost.add_it_up(self)
    end
    def save
        BlogPost.save_array(self)
    end
end

puts "Do you want to create another blog post? Y/N"
answer = gets.downcase.chomp
if answer == "y"
BlogPost.add_new
Blog.current_count
Blog.publish
end


