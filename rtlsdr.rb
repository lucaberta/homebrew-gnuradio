require 'formula'

class Rtlsdr < Formula
  homepage 'http://sdr.osmocom.org/trac/wiki/rtl-sdr'
  head 'https://github.com/osmocom/rtl-sdr.git'

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'cmake' => :build
  depends_on 'libusb'

  def install
    args = ["--prefix=#{prefix}"]
    system "autoreconf", "-fi" if build.head?
    system "./configure", *args
    system "make install"
  end
end
