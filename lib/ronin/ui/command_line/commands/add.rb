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

require 'ronin/ui/command_line/command'
require 'ronin/platform/overlay'

module Ronin
  module UI
    module CommandLine
      module Commands
        class Add < Command

          desc "add PATH", "Add a local overlay to the Overlay cache"
          method_option :cache, :type => :string, :aliases => '-C'
          method_option :media, :type => :string, :aliases => '-m'
          method_option :local, :type => :boolean, :aliases => '-L'
          method_option :rsync, :type => :boolean
          method_option :svn, :type => :boolean
          method_option :hg, :type => :boolean
          method_option :git, :type => :boolean
          method_option :uri, :type => :string, :aliaes => '-U'

          def default(path)
            if options[:cache]
              Platform.load_overlays(options[:cache])
            end

            overlay_options = {:path => path}

            overlay_options[:media] = if options[:media]
                                        options[:media].to_sym
                                      elsif options.local?
                                        nil
                                      elsif options.rsync?
                                        :rsync
                                      elsif options.svn?
                                        :svn
                                      elsif options.hg?
                                        :hg
                                      elsif options.git?
                                        :git
                                      end

            if options[:uri]
              overlay_options[:uri] = options[:uri]
            end

            begin
              Platform.add(overlay_options) do |overlay|
                print_info "Overlay #{overlay.name.dump} added."
              end
            rescue Platform::OverlayNotFound, Platform::OverlayCached => e
              print_error e.message
              exit -1
            end
          end

        end
      end
    end
  end
end
