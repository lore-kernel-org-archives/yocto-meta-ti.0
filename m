Return-Path: <lists@webconect.ch>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0306DE00803; Sun, 10 Apr 2016 10:41:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [217.26.49.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 2429 seconds by postgrey-1.32 at yocto-www;
	Sun, 10 Apr 2016 10:41:17 PDT
Received: from mxout013.mail.hostpoint.ch (mxout013.mail.hostpoint.ch
	[217.26.49.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C809E00522
	for <meta-ti@yoctoproject.org>; Sun, 10 Apr 2016 10:41:17 -0700 (PDT)
Received: from [10.0.2.46] (helo=asmtp013.mail.hostpoint.ch)
	by mxout013.mail.hostpoint.ch with esmtp (Exim 4.84 (FreeBSD))
	(envelope-from <lists@webconect.ch>) id 1apIj8-0002QV-Fw
	for meta-ti@yoctoproject.org; Sun, 10 Apr 2016 19:00:46 +0200
Received: from 77-58-230-166.dclient.hispeed.ch ([77.58.230.166]
	helo=webconect.local) by asmtp013.mail.hostpoint.ch with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.84 (FreeBSD))
	(envelope-from <lists@webconect.ch>) id 1apIj8-0002lF-Cv
	for meta-ti@yoctoproject.org; Sun, 10 Apr 2016 19:00:46 +0200
X-Authenticated-Sender-Id: lists@webconect.ch
Date: Sun, 10 Apr 2016 19:01:38 +0200
From: Elias Diem <lists@webconect.ch>
To: meta-ti@yoctoproject.org
Message-ID: <20160410170138.GA3694@webconect.local>
MIME-Version: 1.0
Subject: Problem with libdrm.inc or eudev_%.bbappend
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Apr 2016 17:41:21 -0000
X-Groupsio-MsgNum: 8399
Content-Type: multipart/mixed; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Hi

I'm trying to build a layer[1] and experience some problems.

Steps to reproduce:

- I source `oe-init-build-env` like this:
  
  $ . /path/to/oe-init-build-env builddir

- Then inside builddir, I change the two files `local.conf` 
  and `bblayers.conf`. These two files are attached.

- Then I start bitbake as follows:

  $ bitbake mume-image

  This will produce the following warning:

  WARNING: Host distribution "Gentoo" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.

  And then it will produce the following error message:

  ERROR: ParseError at /home/edi/var/yocto/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb:1: Could not include required file recipes-graphics/drm/libdrm.inc

  The layer's README[2] tells me to use the branch `fido` 
  for meta-ti. Apparently this branch does not contain a 
  file named `libdrm.inc`.

- I then change the meta-ti's branch to `master`. This 
  branch contains the file `libdrm.inc`. I start bitbake 
  again:

  $ bitbake mume-image

  This will produce a new error:

  ERROR: No recipes available for:
    /home/edi/var/yocto/meta-ti/recipes-core/udev/eudev_%.bbappend

At this point, I don't know how to debug further. May 
someone help me here?


[1] https://github.com/ursfassler/meta-mume
[2] https://github.com/ursfassler/meta-mume/blob/master/README

-- 
Greetings
Elias



--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="local.conf"

#
# This file is your local configuration file and is where all local user settings
# are placed. The comments in this file give some guide to the options a new user
# to the system might want to change but pretty much any configuration option can
# be set in this file. More adventurous users can look at local.conf.extended 
# which contains other examples of configuration which can be placed in this file
# but new users likely won't need any of them initially.
#
# Lines starting with the '#' character are commented out and in some cases the 
# default values are provided as comments to show people example syntax. Enabling
# the option is a question of removing the # character and making any change to the
# variable as required.

#
# Machine Selection
#
# You need to select a specific machine to target the build with. There are a selection
# of emulated machines available which can boot and run in the QEMU emulator:
#
#MACHINE ?= "qemuarm"
#MACHINE ?= "qemuarm64"
#MACHINE ?= "qemumips"
#MACHINE ?= "qemuppc"
#MACHINE ?= "qemux86"
#MACHINE ?= "qemux86-64"
#
# There are also the following hardware board target machines included for 
# demonstration purposes:
#
#MACHINE ?= "beaglebone"
#MACHINE ?= "genericx86"
#MACHINE ?= "genericx86-64"
#MACHINE ?= "mpc8315e-rdb"
#MACHINE ?= "edgerouter"
#
# This sets the default machine to be qemux86 if no other machine is selected:
MACHINE ??= "beaglebone"

#
# Where to place downloads
#
# During a first build the system will download many different source code tarballs
# from various upstream projects. This can take a while, particularly if your network
# connection is slow. These are all stored in DL_DIR. When wiping and rebuilding you
# can preserve this directory to speed up this part of subsequent builds. This directory
# is safe to share between multiple builds on the same machine too.
#
# The default is a downloads directory under TOPDIR which is the build directory.
#
#DL_DIR ?= "${TOPDIR}/downloads"

#
# Where to place shared-state files
#
# BitBake has the capability to accelerate builds based on previously built output.
# This is done using "shared state" files which can be thought of as cache objects
# and this option determines where those files are placed.
#
# You can wipe out TMPDIR leaving this directory intact and the build would regenerate
# from these files if no changes were made to the configuration. If changes were made
# to the configuration, only shared state files where the state was still valid would
# be used (done using checksums).
#
# The default is a sstate-cache directory under TOPDIR.
#
#SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

#
# Where to place the build output
#
# This option specifies where the bulk of the building work should be done and
# where BitBake should place its temporary files and output. Keep in mind that
# this includes the extraction and compilation of many applications and the toolchain
# which can use Gigabytes of hard disk space.
#
# The default is a tmp directory under TOPDIR.
#
#TMPDIR = "${TOPDIR}/tmp"

#
# Default policy config
#
# The distribution setting controls which policy settings are used as defaults.
# The default value is fine for general Yocto project use, at least initially.
# Ultimately when creating custom policy, people will likely end up subclassing 
# these defaults.
#
DISTRO ?= "poky"
# As an example of a subclass there is a "bleeding" edge policy configuration
# where many versions are set to the absolute latest code from the upstream 
# source control systems. This is just mentioned here as an example, its not
# useful to most new users.
# DISTRO ?= "poky-bleeding"

#
# Package Management configuration
#
# This variable lists which packaging formats to enable. Multiple package backends 
# can be enabled at once and the first item listed in the variable will be used 
# to generate the root filesystems.
# Options are:
#  - 'package_deb' for debian style deb files
#  - 'package_ipk' for ipk files are used by opkg (a debian style embedded package manager)
#  - 'package_rpm' for rpm style packages
# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk"
# We default to rpm:
PACKAGE_CLASSES ?= "package_rpm"

#
# SDK/ADT target architecture
#
# This variable specifies the architecture to build SDK/ADT items for and means
# you can build the SDK packages for architectures other than the machine you are 
# running the build on (i.e. building i686 packages on an x86_64 host).
# Supported values are i686 and x86_64
#SDKMACHINE ?= "i686"

#
# Extra image configuration defaults
#
# The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
# images. Some of these options are added to certain image types automatically. The
# variable can contain the following options:
#  "dbg-pkgs"       - add -dbg packages for all installed packages
#                     (adds symbol information for debugging/profiling)
#  "dev-pkgs"       - add -dev packages for all installed packages
#                     (useful if you want to develop against libs in the image)
#  "ptest-pkgs"     - add -ptest packages for all ptest-enabled packages
#                     (useful if you want to run the package test suites)
#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
#  "tools-debug"    - add debugging tools (gdb, strace)
#  "eclipse-debug"  - add Eclipse remote debugging support
#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng, valgrind)
#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
#  "debug-tweaks"   - make an image suitable for development
#                     e.g. ssh root access has a blank password
# There are other application targets that can be used here too, see
# meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
# We default to enabling the debugging tweaks.
EXTRA_IMAGE_FEATURES = "debug-tweaks"

#
# Additional image features
#
# The following is a list of additional classes to use when building images which
# enable extra features. Some available options which can be included in this variable 
# are:
#   - 'buildstats' collect build statistics
#   - 'image-mklibs' to reduce shared library files size for an image
#   - 'image-prelink' in order to prelink the filesystem image
#   - 'image-swab' to perform host system intrusion detection
# NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
# NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
# NOTE: image-prelink is currently broken due to problems with the prelinker.  It is advised
# that you do NOT run the prelinker at this time. 
USER_CLASSES ?= "buildstats image-mklibs"

#
# Runtime testing of images
#
# The build system can test booting virtual machine images under qemu (an emulator)
# after any root filesystems are created and run tests against those images. To
# enable this uncomment this line. See classes/testimage(-auto).bbclass for
# further details.
#TEST_IMAGE = "1"
#
# Interactive shell configuration
#
# Under certain circumstances the system may need input from you and to do this it 
# can launch an interactive shell. It needs to do this since the build is 
# multithreaded and needs to be able to handle the case where more than one parallel
# process may require the user's attention. The default is iterate over the available
# terminal types to find one that works.
#
# Examples of the occasions this may happen are when resolving patches which cannot
# be applied, to use the devshell or the kernel menuconfig
#
# Supported values are auto, gnome, xfce, rxvt, screen, konsole (KDE 3.x only), none
# Note: currently, Konsole support only works for KDE 3.x due to the way
# newer Konsole versions behave
#OE_TERMINAL = "auto"
# By default disable interactive patch resolution (tasks will just fail instead):
PATCHRESOLVE = "noop"

#
# Disk Space Monitoring during the build
#
# Monitor the disk space during the build. If there is less that 1GB of space or less
# than 100K inodes in any key build location (TMPDIR, DL_DIR, SSTATE_DIR), gracefully
# shutdown the build. If there is less that 100MB or 1K inodes, perform a hard abort
# of the build. The reason for this is that running completely out of space can corrupt
# files and damages the build in ways which may not be easily recoverable.
# It's necesary to monitor /tmp, if there is no space left the build will fail
# with very exotic errors.
BB_DISKMON_DIRS = "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    ABORT,${TMPDIR},100M,1K \
    ABORT,${DL_DIR},100M,1K \
    ABORT,${SSTATE_DIR},100M,1K \
    ABORT,/tmp,10M,1K"

#
# Shared-state files from other locations
#
# As mentioned above, shared state files are prebuilt cache data objects which can 
# used to accelerate build time. This variable can be used to configure the system
# to search other mirror locations for these objects before it builds the data itself.
#
# This can be a filesystem directory, or a remote url such as http or ftp. These
# would contain the sstate-cache results from previous builds (possibly from other 
# machines). This variable works like fetcher MIRRORS/PREMIRRORS and points to the 
# cache locations to check for the shared objects.
# NOTE: if the mirror uses the same structure as SSTATE_DIR, you need to add PATH
# at the end as shown in the examples below. This will be substituted with the
# correct path within the directory structure.
#SSTATE_MIRRORS ?= "\
#file://.* http://someserver.tld/share/sstate/PATH;downloadfilename=PATH \n \
#file://.* file:///some/local/dir/sstate/PATH"


#
# Qemu configuration
#
# By default qemu will build with a builtin VNC server where graphical output can be
# seen. The two lines below enable the SDL backend too. By default libsdl-native will
# be built, if you want to use your host's libSDL instead of the minimal libsdl built
# by libsdl-native then uncomment the ASSUME_PROVIDED line below.
PACKAGECONFIG_append_pn-qemu-native = " sdl"
PACKAGECONFIG_append_pn-nativesdk-qemu = " sdl"
#ASSUME_PROVIDED += "libsdl-native"


# CONF_VERSION is increased each time build/conf/ changes incompatibly and is used to
# track the version of this file when it was generated. This can safely be ignored if
# this doesn't mean anything to you.
CONF_VERSION = "1"

--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="bblayers.conf"

# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
# changes incompatibly
LCONF_VERSION = "6"

BBPATH = "${TOPDIR}"
BBFILES ?= ""

BBLAYERS ?= " \
  /home/edi/var/yocto/poky/meta \
  /home/edi/var/yocto/poky/meta-yocto \
  /home/edi/var/yocto/poky/meta-yocto-bsp \
  /home/edi/var/mume/meta-mume \
  /home/edi/var/yocto/meta-qt5 \
  /home/edi/var/yocto/meta-openembedded/meta-oe \
  /home/edi/var/yocto/meta-openembedded/meta-webserver \
  /home/edi/var/yocto/meta-openembedded/meta-networking \
  /home/edi/var/yocto/meta-openembedded/meta-python \
  /home/edi/var/yocto/meta-openembedded/meta-ruby \
  /home/edi/var/yocto/meta-openembedded/meta-systemd \
  /home/edi/var/yocto/meta-ti \
  "

BBLAYERS_NON_REMOVABLE ?= " \
  /home/edi/var/yocto/poky/meta \
  /home/edi/var/yocto/poky/meta-yocto \
  "


--LZvS9be/3tNcYl/X--
