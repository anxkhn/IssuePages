# create_post.rb

# Ensure the correct number of command-line arguments are provided
unless ARGV.length == 2
  puts "Usage: ruby create_post.rb <title> <body>"
  exit 1
end

# Extract title and body from command-line arguments
title = ARGV[0]
body = ARGV[1]

# Generate the current date and time for the post
date = Time.now.strftime("%Y-%m-%d")

# Generate a unique filename for the post based on the title
# Replace spaces with dashes and convert to lowercase
filename = "#{date}-#{title.downcase.strip.gsub(' ', '-')}.md"

# Construct the post content with front matter and body
post_content = <<~POST
  ---
  layout: post
  title: "#{title}"
  ---
  
  #{body}
POST

# Define the path to the _posts directory
posts_dir = "_posts"

# Create the post file in the _posts directory
post_file_path = File.join(posts_dir, filename)

# Write the post content to the post file
File.write(post_file_path, post_content)

# Print a message indicating that the post has been created
puts "Post created successfully at #{post_file_path}"
