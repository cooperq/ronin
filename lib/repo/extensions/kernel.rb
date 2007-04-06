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

module Ronin
  module Repo
    def Repo.attr_context(*contexts)
      for context in contexts
	Kernel.module_eval <<-"end_eval"
          def ronin_#{context}(&block)
	    $current_context_block = block
          end
        end_eval
      end
    end

    # Generic context
    attr_context :context

    # Category context
    attr_context :category

    # Exploit context
    attr_context :exploit

    # Payload context
    attr_context :payload

    # PlatformExploit context
    attr_context :platformexploit

    # BufferOverflow context
    attr_context :bufferoverflow

    # FormatString context
    attr_context :formatstring

    protected

    $current_context_block = nil

    def has_context?
      !($current_context_block.nil?)
    end

    def get_context
      block = $current_context_block
      $current_context_block = nil
      return block
    end
  end
end
