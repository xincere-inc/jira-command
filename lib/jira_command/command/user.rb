require 'thor'
require 'optparse'
require 'pry'
require_relative '../config'
require_relative '../jira/user'

module JiraCommand
  module Command
    class User < Thor
      default_command :project

      desc 'project', 'list issues in specified project'
      option 'project', aliases: 'p', required: true
      def project
        config = JiraCommand::Config.new.read

        user_api = JiraCommand::Jira::User.new(config)
        user_api.show_assignable(project: options['project'])
      end
    end
  end
end