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

require 'ronin/network/extensions/telnet'

module Ronin
  module Network
    module Telnet
      # Default telnet port
      DEFAULT_PORT = 23

      # The default prompt regular expression
      DEFAULT_PROMPT = /[$%#>] \z/n

      # The default timeout
      DEFAULT_TIMEOUT = 10

      #
      # @return [Integer]
      #   The default Ronin Telnet port.
      #
      def Telnet.default_port
        @@telnet_default_port ||= DEFAULT_PORT
      end

      #
      # Sets the default Ronin Telnet port.
      #
      # @param [Integer] port
      #   The new default Ronin Telnet port.
      #
      def Telnet.default_port=(port)
        @@telnet_default_port = port
      end

      #
      # @return [Regexp]
      #   The default Ronin Telnet prompt pattern.
      #
      def Telnet.default_prompt
        @@telnet_default_prompt ||= DEFAULT_PROMPT
      end

      #
      # Sets the default Ronin Telnet prompt pattern.
      #
      # @param [Regexp] prompt
      #   The new default Ronin Telnet prompt pattern.
      #
      def Telnet.default_prompt=(prompt)
        @@telnet_default_prompt = prompt
      end

      #
      # @return [Integer]
      #   The default Ronin Telnet timeout.
      #
      def Telnet.default_timeout
        @@telnet_default_timeout ||= DEFAULT_TIMEOUT
      end

      #
      # Sets the default Ronin Telnet timeout.
      #
      # @param [Integer] timeout
      #   The new default Ronin Telnet timeout.
      #
      def Telnet.default_timeout=(timeout)
        @@telnet_default_timeout = timeout
      end

      #
      # @return [Telnet, IO, nil]
      #   The Ronin Telnet proxy.
      #
      def Telnet.proxy
        @@telnet_proxy ||= nil
      end

      #
      # Sets the Ronin Telnet proxy.
      #
      # @param [Telnet, IO, nil] new_proxy
      #   The new Ronin Telnet proxy.
      #
      def Telnet.proxy=(new_proxy)
        @@telnet_proxy = new_proxy
      end
    end
  end
end
