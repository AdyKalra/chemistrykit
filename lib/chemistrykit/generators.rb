module ChemistryKit
  class Generator < Thor::Group
    include Thor::Actions

     argument :name

    def self.source_root
      File.dirname(__FILE__)
    end

    def create_lib_file
      template('templates/newproj.tt', "#{name}/lib/#{name}.rb")
    end

    # def create_test_file
    #   test = options[:test_framework] == "rspec" ? :spec : :test
    #   create_file "#{name}/#{test}/#{name}_#{test}.rb"
    # end

    def copy_licence
      if yes?("Use MIT license?")
        # Make a copy of the MITLICENSE file at the source root
        copy_file "LICENSE", "#{name}/LICENSE"
      else
        say "Shame on you…", :red
      end
    end

  end
end
