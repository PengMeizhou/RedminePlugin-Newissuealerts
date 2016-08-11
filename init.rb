require 'redmine'


require 'dispatcher' unless Rails::VERSION::MAJOR >= 3

if Rails::VERSION::MAJOR >= 3
  ActionDispatch::Callbacks.to_prepare do
    require_dependency 'issue'
    # Guards against including the module multiple time (like in tests)
    # and registering multiple callbacks
    require 'redmine_newissuealerts/issue_patch'
    unless Issue.included_modules.include? RedmineNewissuealerts::IssuePatch
      Issue.send(:include, RedmineNewissuealerts::IssuePatch)
    end
  
    require_dependency 'projects_helper'
    require 'redmine_newissuealerts/projects_helper_patch'
    unless ProjectsHelper.included_modules.include? RedmineNewissuealerts::ProjectsHelperPatch
      ProjectsHelper.send(:include, RedmineNewissuealerts::ProjectsHelperPatch)
    end
  end
end
# Patches to the Redmine core.

# It requires the file in lib/redmine_newissuealerts/hooks.rb
require_dependency 'redmine_newissuealerts/hooks'

Redmine::Plugin.register :newissuealerts do
  name 'Newissuealerts plugin'
  author 'Peng Meizhou'
  description 'This is a plugin for Redmine new issue alerts'
  version '0.0.1'
  url 'https://github.com/PengMeizhou/RedminePlugin-Newissuealerts'
  author_url 'https://github.com/PengMeizhou/RedminePlugin-Newissuealerts'
  
   # This plugin adds a project module
  # It can be enabled/disabled at project level (Project settings -> Modules)
  project_module :newissuealerts do
    permission :edit_newissuealerts, {:projects => :settings, :newissuealerts => [:index, :edit]}, :require => :member
    permission :new_newissuealerts, {:projects => :settings, :newissuealerts => [:index, :new]}, :require => :member
    permission :view_newissuealerts, {:projects => :settings, :newissuealerts => :index}, :require => :member
  end
end
