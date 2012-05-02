module TestKitchen
  module Project
    class Cookbook < Ruby

      attr_writer :lint

      def lint(arg=nil)
        set_or_return(:lint, arg, {:default => true})
      end

      def language(arg=nil)
        "chef"
      end

      def install_command(runtime=nil)
        "sudo gem update --system; gem install bundler && #{cd} && #{path} bundle install"
      end

      def test_command(runtime=nil)
        "#{cd} && #{path} bundle exec cucumber -t @#{name} features"
      end

      private

      def cd
        "cd #{File.join(guest_test_root, 'test')}"
      end

      def path
        'PATH=$PATH:/var/lib/gems/1.8/bin'
      end

    end
  end
end
