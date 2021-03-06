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

require 'rexml/document'

module Ronin
  class Product

    include Model

    # Primary key
    property :id, Serial

    # Name
    property :name, String, :index => true

    # Version
    property :version, String, :index => true

    # Venders
    property :vendor, String

    # Validates
    validates_present :name, :version

    #
    # Creates a new Product object.
    #
    # @param [Hash] attributes
    #   Attributes of the product.
    #
    # @option attributes [String] :name
    #   The name of the product.
    #
    # @option attributes [String] :vendor
    #   The vendor of the product.
    #
    # @option attributes [String] :version
    #   The vesion of the product.
    #
    def initialize(attributes={})
      attributes[:vendor] ||= attributes[:name]

      super(attributes)
    end

    #
    # Converts the product to a String.
    #
    # @return [String]
    #   The product vendor, name and version.
    #
    def to_s
      [self.vendor, self.name, self.version].compact.join(' ')
    end

  end
end
