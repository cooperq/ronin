#
# Ronin - A decentralized repository for the storage and sharing of computer
# security advisories, exploits and payloads.
#
# Copyright (c) 2007 Hal Brodigan (postmodern at users.sourceforge.net)
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

require 'repo/context'

module Ronin
  module Repo
    class ObjectContext < Context

      # Object metadata
      attr_reader :metadata

      def initialize
	super
	@metadata = { :name => "", :version => "", :author => "" }
      end

      private

      def name
	return @metadata[:name]
      end

      def name=(new_name)
	@metadata[:name] = new_name
      end

      def version
	return @metadata[:version]
      end

      def version=(new_version)
	@metadata[:version] = new_version
      end

      def author
	return @metadata[:author]
      end

      def author=(new_author)
	@metadata[:author] = new_author
      end

    end
  end
end
