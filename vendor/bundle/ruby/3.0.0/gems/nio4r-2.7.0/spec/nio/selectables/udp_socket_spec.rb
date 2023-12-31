# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2012-2017, by Tony Arcieri.
# Copyright, 2017, by Gregory Longtin.
# Copyright, 2017, by Olle Jonsson.
# Copyright, 2019-2023, by Samuel Williams.
# Copyright, 2020, by Thomas Dziedzic.

require "spec_helper"

RSpec.describe UDPSocket, if: !defined?(JRUBY_VERSION) do
  let(:udp_port) { 23_456 }

  let :readable_subject do
    server = UDPSocket.new
    server.bind("127.0.0.1", 0)

    peer = UDPSocket.new
    peer.send("hi there", 0, "127.0.0.1", server.local_address.ip_port)

    server
  end

  let :unreadable_subject do
    sock = UDPSocket.new
    sock.bind("127.0.0.1", 0)
    sock
  end

  let :writable_subject do
    server = UDPSocket.new
    server.bind("127.0.0.1", 0)

    peer = UDPSocket.new
    peer.connect("127.0.0.1", server.local_address.ip_port)

    cntr = 0
    begin
      peer.send("X" * 1024, 0)
      cntr += 1
      t = select [], [peer], [], 0
    rescue Errno::ECONNREFUSED => e
      skip "Couldn't make writable UDPSocket subject: #{e.class}: #{e}"
    end while t && t[1].include?(peer) && cntr < 5

    peer
  end

  let :unwritable_subject do
    pending "come up with a UDPSocket that's blocked on writing"
  end

  it_behaves_like "an NIO selectable"
end
