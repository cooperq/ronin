#
# Ronin - A Ruby platform for exploit development and security research.
#
# Copyright (c) 2006-2010 Hal Brodigan (postmodern.mod3 at gmail.com)
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#

require 'rubygems'
require 'static_paths'
require 'fileutils'

module Ronin
  module Config
    include StaticPaths

    register_static_dir File.join(File.dirname(__FILE__),'..','..','static')

    # The users home directory
    HOME = File.expand_path(ENV['HOME'] || ENV['HOMEPATH'])

    # Ronin home directory
    PATH = FileUtils.mkdir_p(File.join(HOME,'.ronin'))

    # Configuration files directory
    CONFIG_DIR = FileUtils.mkdir_p(File.join(PATH,'config'))

    # Temporary file directory
    TMP_DIR = FileUtils.mkdir_p(File.join(PATH,'tmp'))

    #
    # Loads the Ronin configuration file.
    #
    # @param [Symbol, String, nil] name
    #   The optional name of the file to load within +CONFIG_DIR+.
    #
    # @example Load the config file at <tt>~/.ronin/config/ronin.rb</tt>
    #   Config.load
    #   # => true
    #
    # @example Load a specific config file in <tt>~/.ronin/config/</tt>
    #   Config.load :sql
    #   # => true
    #
    def Config.load(name=:ronin)
      path = File.expand_path(File.join(CONFIG_DIR,name.to_s))

      require path if File.file?(path)
    end

    #
    # Auto-creates a directory within {TMP_DIR}.
    #
    # @param [String] sub_path
    #   The sub-path within {TMP_DIR}.
    #
    # @return [String]
    #   The full path within {TMP_DIR}.
    #
    def Config.tmp_dir(sub_path=nil)
      if sub_path
        sub_path = File.expand_path(File.join('',sub_path))
        path = File.join(TMP_DIR,sub_path)

        unless File.exist?(path)
          FileUtils.mkdir_p(path)
        end

        return path
      end

      return TMP_DIR
    end
  end
end
