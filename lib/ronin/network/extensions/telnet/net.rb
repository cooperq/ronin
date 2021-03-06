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

require 'ronin/network/telnet'

require 'net/telnet'

module Net
  #
  # Creates a new Telnet connection.
  #
  # @param [String] host
  #   The host to connect to.
  #
  # @param [Hash] options
  #   Additional options.
  #
  # @option options [Integer] :port (Ronin::Network::Telnet.default_port)
  #   The port to connect to.
  #
  # @option options [Boolean] :binmode
  #   Indicates that newline substitution shall not be performed.
  #
  # @option options [String] :output_log
  #   The name of the file to write connection status messages and all
  #   received traffic to.
  #
  # @option options [String] :dump_log
  #   Similar to the +:output_log+ option, but connection output is also
  #   written in hexdump format.
  #
  # @option options [Regexp] :prompt (Ronin::Network::Telnet.default_prompt)
  #   A regular expression matching the host command-line prompt sequence,
  #   used to determine when a command has finished.
  #
  # @option options [Boolean] :telnet (true)
  #   Indicates that the connection shall behave as a telnet connection.
  #
  # @option options [Boolean] :plain
  #   Indicates that the connection shall behave as a normal TCP
  #   connection.
  #
  # @option options [Integer] :timeout (Ronin::Network::Telnet.default_timeout)
  #   The number of seconds to wait before timing out both the initial
  #   attempt to connect to host, and all attempts to read data from the
  #   host.
  #
  # @option options [Integer] :wait_time
  #   The amount of time to wait after seeing what looks like a prompt.
  #
  # @option options [Net::Telnet, IO] :proxy (Ronin::Network::Telnet.proxy)
  #   A proxy object to used instead of opening a direct connection to the
  #   host.
  #
  # @option options [String] :user
  #   The user to login as.
  #
  # @option options [String] :password
  #   The password to login with.
  #
  # @yield [session]
  #   If a block is given, it will be passed the newly created Telnet
  #   session.
  #
  # @yieldparam [Net::Telnet] session
  #   The newly created Telnet session.
  #
  # @return [Net::Telnet]
  #   The Telnet session
  #
  # @example
  #   Net.telnet_connect('towel.blinkenlights.nl')
  #   # => #<Net::Telnet: ...>
  #
  def Net.telnet_connect(host,options={},&block)
    sess_opts = {}
    sess_opts['Host'] = host
    sess_opts['Port'] = (options[:port] || Ronin::Network::Telnet.default_port)
    sess_opts['Binmode'] = options[:binmode]
    sess_opts['Output_log'] = options[:output_log]
    sess_opts['Dump_log'] = options[:dump_log]
    sess_opts['Prompt'] = (options[:prompt] || Ronin::Network::Telnet.default_prompt)

    if (options[:telnet] && !options[:plain])
      sess_opts['Telnetmode'] = true
    end

    sess_opts['Timeout'] = (options[:timeout] || Ronin::Network::Telnet.default_timeout)
    sess_opts['Waittime'] = options[:wait_time]
    sess_opts['Proxy'] = (options[:proxy] || Ronin::Network::Telnet.proxy)

    user = options[:user]
    passwd = options[:passwd]

    sess = Net::Telnet.new(sess_opts)
    sess.login(user,passwd) if user

    block.call(sess) if block
    return sess
  end

  #
  # Starts a new Telnet session.
  #
  # @param [String] host
  #   The host to connect to.
  #
  # @param [Hash] options
  #   Additional options.
  #
  # @yield [session]
  #   If a block is given, it will be passed the newly created
  #   Telnet session. After the block has returned, the Telnet session
  #   will be closed.
  #
  # @yieldparam [Net::Telnet] session
  #   The newly created Telnet session.
  #
  # @return [nil]
  #
  # @example
  #   Net.telnet_session('towel.blinkenlights.nl') do |movie|
  #     movie.each_line { |line| puts line }
  #   end
  #
  # @see Net.telnet_session
  #
  def Net.telnet_session(host,options={},&block)
    Net.telnet_connect(host,options) do |sess|
      block.call(sess) if block
      sess.close
    end

    return nil
  end
end
