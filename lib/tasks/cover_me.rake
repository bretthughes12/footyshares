namespace :cover_me do
  
  desc "Generates and opens code coverage report."
  task :report do
    require 'cover_me'
    
    CoverMe.config do |c|
      # where is your project's root:
    #  c.project.root # => "Rails.root" (default)
    
      # what files are you interested in coverage for:
    #  c.file_pattern # => [
    #    /(#{CoverMe.config.project.root}\/app\/.+\.rb)/i,
    #    /(#{CoverMe.config.project.root}\/lib\/.+\.rb)/i
    #  ] (default)
      
      # what files do you want to explicitly exclude from coverage
    #  c.exclude_file_patterns # => [] (default)
    
      # where do you want the HTML generated:
     # c.html_formatter.output_path # => File.join(CoverMe.config.project.root, 'coverage') (default)
    
      # what do you want to happen when it finishes:
      c.at_exit = Proc.new {
        if CoverMe.config.formatter == CoverMe::HtmlFormatter
          index = File.join(CoverMe.config.html_formatter.output_path, 'index.html')
          if File.exists?(index)
             system("firefox \"#{Rails.root}/coverage/index.html\"" )
          end
        end
      }
    end
    
    CoverMe.complete!
  end
  
end

task :test do
  Rake::Task['cover_me:report'].invoke
end

task :spec do
  Rake::Task['cover_me:report'].invoke
end