# Documentation: http://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class XxNet < Formula
  desc "a web proxy tool"
  homepage "https://github.com/XX-net/XX-Net"
  url "https://github.com/XX-net/XX-Net/archive/3.3.0.tar.gz"
  sha256 "9aee994e0808dabe99ae8dc07e583728673d9fc0f7663e76e605936d13db4f19"

  depends_on "python" => :run


  def install
	rm_rf %w[ start.bat start.vbs ] # remove windows execute
	mv "start", "xx-net"

	prefix.install Dir["*"] 

	# a dummy script for xx-net execute
	xxnet_exec = prefix+"xxnet-exec.sh"
	xxnet_exec.write <<-EOS.undent
	 	#!/bin/sh
		BASENAME=`basename $0`
		EXEC="#{prefix}/$BASENAME"
		test -f "$EXEC" && exec "$EXEC" "$@"
	EOS
	xxnet_exec.chmod 0755
	bin.install_symlink xxnet_exec => "xx-net" 
  end

  test do
    system "false"
  end
end
