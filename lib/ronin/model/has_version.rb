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

require 'ronin/model'

module Ronin
  module Model
    module HasVersion
      def self.included(base)
        base.module_eval do
          include Ronin::Model

          # The version of the model
          property :version, String, :default => '0.1', :index => true

          #
          # Finds all models with a specific version.
          #
          # @param [String] version
          #   The specific version to search for.
          #
          # @return [Array]
          #   The models with the specific version.
          #
          def self.revision(version)
            self.all(:version => version.to_s)
          end

          #
          # Finds latest version of the model.
          #
          def self.latest
            self.first(:order => [:version.desc])
          end
        end
      end
    end
  end
end
