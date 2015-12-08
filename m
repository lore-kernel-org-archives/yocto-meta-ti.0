Return-Path: <joshua.vanderpool@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A12DBE00AD8; Tue,  8 Dec 2015 11:11:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jdvdt2[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3ED9DE00546
	for <meta-ti@yoctoproject.org>; Tue,  8 Dec 2015 11:10:56 -0800 (PST)
Received: by ioir85 with SMTP id r85so34545972ioi.1
	for <meta-ti@yoctoproject.org>; Tue, 08 Dec 2015 11:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=zw9IHgCXYygpWMUdTwKNUHOei2N0KJ3t8b3hMYegiaU=;
	b=e2Gjs5WSbfC/r4PLm1uj6yN3qSpX1ZFnyhIM5cSmPiPNz2dOn3oBy+gfcUrldKQH7G
	ia8OFfckaiGrSMv7KK5HyzymeSO0BkPil/e9h2UCk227u28vC6IxC3ORF+yjtdp69Gn5
	d/fdacsjgZQugtw2DC9Q5QsKLupsZVj8F8Y1jo3fZkLhKDN/pC3GDhE/4EYYrH40Wjs5
	0Z+lId1syajAuDcrFhLjbGy4QpUgbQAqt1EKnWU8dcLRmdP/m+FkabgdcMnwu41IvxC8
	HJ8ZVYHBChOBt2kSWOSh6DQQmYdiSEFlTRdPr8ola1vbPEd1avzE7XPZKvq+h6qcqmhv
	XiMA==
MIME-Version: 1.0
X-Received: by 10.107.10.199 with SMTP id 68mr1450215iok.75.1449601855352;
	Tue, 08 Dec 2015 11:10:55 -0800 (PST)
Sender: joshua.vanderpool@gmail.com
Received: by 10.64.85.6 with HTTP; Tue, 8 Dec 2015 11:10:55 -0800 (PST)
Date: Tue, 8 Dec 2015 14:10:55 -0500
X-Google-Sender-Auth: RkWrlxTBTOYpjiue0piZFmX2SFM
Message-ID: <CAOYMvD1FdJsUM21hAp8_umo-+qzG9srWAW9B-ZgtCt7wQxhK8w@mail.gmail.com>
From: Joshua Vanderpool <jdVdt2@gmail.com>
To: meta-ti@yoctoproject.org
Subject: libtool-cross_2.4.6.bb configure failure
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
X-List-Received-Date: Tue, 08 Dec 2015 19:11:00 -0000
Content-Type: multipart/alternative; boundary=001a113edd70a77635052667bb60

--001a113edd70a77635052667bb60
Content-Type: text/plain; charset=UTF-8

I have used the instructions found here
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

To setup a arago build of the am57xx-evm as a starting point.  I then
./oe-layertool-setup.sh -f configs/arago-fido-config.txt

I assumed that this had support for the am57xx, however i have been
unsuccessful to build the core-image-minimal.

I am using the compiler as stated in the wiki.

once i get a build working then i have to add in my custom layers for the
board i designed.
I would like to know the layers i should use to have the best video support
at qt5 will be used and the video ports on the AM57xx.

Thanks for any support and your time.

Warning this is the output:

jvanderpool@jvanderpool-workstation:~/dev/tisdk/build$ MACHINE=am57xx-evm
bitbake core-image-minimal
NOTE: Started PRServer with DBfile:
/home/jvanderpool/dev/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1,
PORT: 45120, PID: 13826
NOTE: Your conf/bblayers.conf has been automatically updated.
NOTE: INCLUDING gnutls as buildable despite INCOMPATIBLE_LICENSE because it
has been whitelisted###        | ETA:  00:00:06
Parsing recipes: 100%
|####################################################################################|
Time: 00:01:15
Parsing of 2084 .bb files complete (0 cached, 2084 parsed). 2613 targets,
376 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION        = "1.26.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-14.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "am57xx-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2015.11"
TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard
cortexa15"
TARGET_FPU        = "vfp-neon"
meta-arago-distro
meta-arago-extras = "master:0b4f6cf573446ee854c1b128aac59210e45d708b"
meta-qt5          = "jethro:0454fb083c38f2155a8be3b61930ad1ddf995695"
meta-networking
meta-ruby
meta-python
meta-oe           = "fido:df2f700d66bace65f5d802225232d01cf511fe81"
meta-ti           = "fido:bc10ffc2e4637a3c0cc020b686c93e92c93ee756"
meta-linaro-toolchain = "fido:08a46787862966f2236c5a9b3eb4d4ec68263593"
meta              = "fido:f0873b83d693af4a103999160d67fcf25c7eedc1"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL
http://www.openssl.org/source/openssl-1.0.2d.tar.gz, attempting MIRRORS if
available
ERROR: Function failed: do_configure (log file is located at
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265)
ERROR: Logfile of failure stored in:
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.15
| Copyright (C) 2014 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <
http://gnu.org/licenses/gpl-2.0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1
| NOTE: Executing ACLOCAL="aclocal
--system-acdir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/"
autoreconf --verbose --install --force --exclude=libtoolize -I
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
-I
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
| autoreconf: Entering directory `.'
| autoreconf: configure.ac: not using Gettext
| autoreconf: running: aclocal
--system-acdir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/
-I
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
-I
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
-I
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
-I
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
--force -I m4
| autoreconf: configure.ac: tracing
| autoreconf: running:
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf
--include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
--include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
--force
| autoreconf: running:
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoheader
--include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
--include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
--force
| autoreconf: running: automake --add-missing --copy --force-missing
| autoreconf: running: gnu-configize
| autoreconf: Leaving directory `.'
| NOTE: Running
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/configure
 --build=x86_64-linux  --host=arm-linux-gnueabi
--target=arm-linux-gnueabi  --prefix=/usr
 --exec_prefix=/usr  --bindir=/usr/bin  --sbindir=/usr/sbin
--libexecdir=/usr/lib/libtool
 --datadir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share
 --sysconfdir=/etc  --sharedstatedir=/com  --localstatedir=/var
--libdir=/usr/lib
 --includedir=/usr/include  --oldincludedir=/usr/include
--infodir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/info
 --mandir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/man
 --disable-silent-rules  --disable-dependency-tracking
 --with-libtool-sysroot=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/meta-openembedded/meta-oe/site/endian-little
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/endian-little
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-common
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-32
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-linux
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-glibc
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-linux
| configure: loading site script
/home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common
| ## ------------------------- ##
| ## Configuring libtool 2.4.6 ##
| ## ------------------------- ##
|
| checking for GNU M4 that supports accurate traces...
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
| checking whether
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
accepts --gnu... yes
| checking how m4 supports trace files... --debugfile
| checking for a BSD-compatible install... /usr/bin/install -c
| checking whether build environment is sane... yes
| checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip
| checking for a thread-safe mkdir -p... /bin/mkdir -p
| checking for gawk... gawk
| checking whether make sets $(MAKE)... yes
| checking whether make supports nested variables... yes
| checking whether make supports nested variables... (cached) yes
| checking build system type... x86_64-pc-linux-gnu
| checking host system type... arm-unknown-linux-gnueabi
| configure: autobuild project... GNU Libtool
| configure: autobuild revision... 2.4.6
| configure: autobuild hostname... jvanderpool-workstation
| configure: autobuild mode... default
| configure: autobuild timestamp... 20151208T160947Z
| checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc
 -march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
-mtune=cortex-a15
--sysroot=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
| checking whether the C compiler works... no
| configure: error: in
`/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build':
| configure: error: C compiler cannot create executables
| See `config.log' for more details
| Configure failed. The contents of all config.log files follows to aid
debugging
| ERROR: oe_runconf failed
| WARNING:
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.do_configure.32265:1
exit 1 from
|   exit 1
| ERROR: Function failed: do_configure (log file is located at
/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265)
ERROR: Task 414
(/home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
libtool-cross_2.4.6.bb, do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 330 tasks of which 0 didn't need to be rerun
and 1 failed.
NOTE: Writing buildhistory
Waiting for 0 running tasks to finish:

*** Please tell me who you are.

Run

  git config --global user.email "you@example.com"
  git config --global user.name "Your Name"

to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address (got
'jvanderpool@jvanderpool-workstation.(none)')

Summary: 1 task failed:
  /home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
libtool-cross_2.4.6.bb, do_configure

--001a113edd70a77635052667bb60
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have used the instructions found here=C2=A0<a href=3D"ht=
tp://arago-project.org/wiki/index.php/Setting_Up_Build_Environment">http://=
arago-project.org/wiki/index.php/Setting_Up_Build_Environment</a><div><br><=
/div><div>To setup a arago build of the am57xx-evm as a starting point.=C2=
=A0 I then=C2=A0</div><div><div>./oe-layertool-setup.sh -f configs/arago-fi=
do-config.txt=C2=A0</div></div><div><br></div><div>I assumed that this had =
support for the am57xx, however i have been unsuccessful to build the core-=
image-minimal.</div><div><br></div><div>I am using the compiler as stated i=
n the wiki.</div><div><br></div><div>once i get a build working then i have=
 to add in my custom layers for the board i designed.=C2=A0</div><div>I wou=
ld like to know the layers i should use to have the best video support at q=
t5 will be used and the video ports on the AM57xx.</div><div><br></div><div=
>Thanks for any support and your time.</div><div><br></div><div>Warning thi=
s is the output:<br><br></div><div><div>jvanderpool@jvanderpool-workstation=
:~/dev/tisdk/build$ MACHINE=3Dam57xx-evm bitbake core-image-minimal</div><d=
iv>NOTE: Started PRServer with DBfile: /home/jvanderpool/dev/tisdk/build/ca=
che/prserv.sqlite3, IP: 127.0.0.1, PORT: 45120, PID: 13826</div><div>NOTE: =
Your conf/bblayers.conf has been automatically updated.</div><div>NOTE: INC=
LUDING gnutls as buildable despite INCOMPATIBLE_LICENSE because it has been=
 whitelisted### =C2=A0 =C2=A0 =C2=A0 =C2=A0| ETA: =C2=A000:00:06</div><div>=
Parsing recipes: 100% |####################################################=
################################| Time: 00:01:15</div><div>Parsing of 2084 =
.bb files complete (0 cached, 2084 parsed). 2613 targets, 376 skipped, 0 ma=
sked, 0 errors.</div><div>NOTE: Resolving any missing task queue dependenci=
es</div><div><br></div><div>Build Configuration:</div><div>BB_VERSION =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.26.0&quot;</div><div>BUILD_SYS =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&quot;</div><div>NATIVELSBSTRING=
 =C2=A0 =3D &quot;Ubuntu-14.04&quot;</div><div>TARGET_SYS =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D &quot;arm-linux-gnueabi&quot;</div><div>MACHINE =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;am57xx-evm&quot;</div><div>DISTRO =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arago&quot;</div><div>DISTRO_VE=
RSION =C2=A0 =C2=A0=3D &quot;2015.11&quot;</div><div>TUNE_FEATURES =C2=A0 =
=C2=A0 =3D &quot;arm armv7a vfp thumb neon callconvention-hard cortexa15&qu=
ot;</div><div>TARGET_FPU =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;vfp-neon&quot=
;</div><div>meta-arago-distro=C2=A0</div><div>meta-arago-extras =3D &quot;m=
aster:0b4f6cf573446ee854c1b128aac59210e45d708b&quot;</div><div>meta-qt5 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;jethro:0454fb083c38f2155a8be3b6193=
0ad1ddf995695&quot;</div><div>meta-networking =C2=A0=C2=A0</div><div>meta-r=
uby =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0</div><div>meta-python =C2=A0 =C2=A0 =
=C2=A0=C2=A0</div><div>meta-oe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot=
;fido:df2f700d66bace65f5d802225232d01cf511fe81&quot;</div><div>meta-ti =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:bc10ffc2e4637a3c0cc020b686c9=
3e92c93ee756&quot;</div><div>meta-linaro-toolchain =3D &quot;fido:08a467878=
62966f2236c5a9b3eb4d4ec68263593&quot;</div><div>meta =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;fido:f0873b83d693af4a103999160d67fcf25=
c7eedc1&quot;</div><div><br></div><div>NOTE: Preparing RunQueue</div><div>N=
OTE: Executing SetScene Tasks</div><div>NOTE: Executing RunQueue Tasks</div=
><div>WARNING: Failed to fetch URL <a href=3D"http://www.openssl.org/source=
/openssl-1.0.2d.tar.gz">http://www.openssl.org/source/openssl-1.0.2d.tar.gz=
</a>, attempting MIRRORS if available</div><div>ERROR: Function failed: do_=
configure (log file is located at /home/jvanderpool/dev/tisdk/build/arago-t=
mp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtoo=
l-cross/2.4.6-r0/temp/log.do_configure.32265)</div><div>ERROR: Logfile of f=
ailure stored in: /home/jvanderpool/dev/tisdk/build/arago-tmp-external-lina=
ro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0=
/temp/log.do_configure.32265</div><div>Log data follows:</div><div>| DEBUG:=
 Executing python function sysroot_cleansstate</div><div>| DEBUG: Python fu=
nction sysroot_cleansstate finished</div><div>| DEBUG: SITE files [&#39;end=
ian-little&#39;, &#39;bit-32&#39;, &#39;arm-common&#39;, &#39;arm-32&#39;, =
&#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &#39;a=
rm-linux-gnueabi&#39;, &#39;common&#39;]</div><div>| DEBUG: Executing shell=
 function autotools_preconfigure</div><div>| DEBUG: Shell function autotool=
s_preconfigure finished</div><div>| DEBUG: Executing python function autoto=
ols_copy_aclocals</div><div>| DEBUG: SITE files [&#39;endian-little&#39;, &=
#39;bit-32&#39;, &#39;arm-common&#39;, &#39;arm-32&#39;, &#39;common-linux&=
#39;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &#39;arm-linux-gnueabi&#=
39;, &#39;common&#39;]</div><div>| DEBUG: Python function autotools_copy_ac=
locals finished</div><div>| DEBUG: Executing shell function do_configure</d=
iv><div>| automake (GNU automake) 1.15</div><div>| Copyright (C) 2014 Free =
Software Foundation, Inc.</div><div>| License GPLv2+: GNU GPL version 2 or =
later &lt;<a href=3D"http://gnu.org/licenses/gpl-2.0.html">http://gnu.org/l=
icenses/gpl-2.0.html</a>&gt;</div><div>| This is free software: you are fre=
e to change and redistribute it.</div><div>| There is NO WARRANTY, to the e=
xtent permitted by law.</div><div>|=C2=A0</div><div>| Written by Tom Tromey=
 &lt;<a href=3D"mailto:tromey@redhat.com">tromey@redhat.com</a>&gt;</div><d=
iv>| =C2=A0 =C2=A0 =C2=A0 =C2=A0and Alexandre Duret-Lutz &lt;<a href=3D"mai=
lto:adl@gnu.org">adl@gnu.org</a>&gt;.</div><div>| AUTOV is 1</div><div>| NO=
TE: Executing ACLOCAL=3D&quot;aclocal --system-acdir=3D/home/jvanderpool/de=
v/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon=
-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/&quot; autoreconf =
--verbose --install --force --exclude=3Dlibtoolize -I /home/jvanderpool/dev=
/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-=
linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/ -I /home/jvanderpool=
/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-n=
eon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/</div><div>| a=
utoreconf: Entering directory `.&#39;</div><div>| autoreconf: <a href=3D"ht=
tp://configure.ac">configure.ac</a>: not using Gettext</div><div>| autoreco=
nf: running: aclocal --system-acdir=3D/home/jvanderpool/dev/tisdk/build/ara=
go-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/li=
btool-cross/2.4.6-r0/build/aclocal-copy/ -I /home/jvanderpool/dev/tisdk/bui=
ld/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnue=
abi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/ -I /home/jvanderpool/dev/tisdk=
/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-=
gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/ -I /home/jvanderpool/de=
v/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon=
-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/ -I /home/jvanderpoo=
l/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-=
neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/ --force -I m=
4</div><div>| autoreconf: <a href=3D"http://configure.ac">configure.ac</a>:=
 tracing</div><div>| autoreconf: running: /home/jvanderpool/dev/tisdk/build=
/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf=
 --include=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-to=
olchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libt=
ool-2.4.6/m4/ --include=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-exter=
nal-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/=
2.4.6-r0/libtool-2.4.6/tests/ --force</div><div>| autoreconf: running: /hom=
e/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/=
x86_64-linux/usr/bin/autoheader --include=3D/home/jvanderpool/dev/tisdk/bui=
ld/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnue=
abi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/ --include=3D/home/jvanderpool/=
dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-ne=
on-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/ --force</div><=
div>| autoreconf: running: automake --add-missing --copy --force-missing</d=
iv><div>| autoreconf: running: gnu-configize</div><div>| autoreconf: Leavin=
g directory `.&#39;</div><div>| NOTE: Running /home/jvanderpool/dev/tisdk/b=
uild/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gn=
ueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/configure =C2=A0--build=3Dx86_64=
-linux <span class=3D"" style=3D"white-space:pre">		</span> =C2=A0--host=3D=
arm-linux-gnueabi <span class=3D"" style=3D"white-space:pre">		</span> =C2=
=A0--target=3Darm-linux-gnueabi <span class=3D"" style=3D"white-space:pre">=
		</span> =C2=A0--prefix=3D/usr <span class=3D"" style=3D"white-space:pre">=
		</span> =C2=A0--exec_prefix=3D/usr <span class=3D"" style=3D"white-space:=
pre">		</span> =C2=A0--bindir=3D/usr/bin <span class=3D"" style=3D"white-sp=
ace:pre">		</span> =C2=A0--sbindir=3D/usr/sbin <span class=3D"" style=3D"wh=
ite-space:pre">		</span> =C2=A0--libexecdir=3D/usr/lib/libtool <span class=
=3D"" style=3D"white-space:pre">		</span> =C2=A0--datadir=3D/home/jvanderpo=
ol/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/=
usr/share <span class=3D"" style=3D"white-space:pre">		</span> =C2=A0--sysc=
onfdir=3D/etc <span class=3D"" style=3D"white-space:pre">		</span> =C2=A0--=
sharedstatedir=3D/com <span class=3D"" style=3D"white-space:pre">		</span> =
=C2=A0--localstatedir=3D/var <span class=3D"" style=3D"white-space:pre">		<=
/span> =C2=A0--libdir=3D/usr/lib <span class=3D"" style=3D"white-space:pre"=
>		</span> =C2=A0--includedir=3D/usr/include <span class=3D"" style=3D"whit=
e-space:pre">		</span> =C2=A0--oldincludedir=3D/usr/include <span class=3D"=
" style=3D"white-space:pre">		</span> =C2=A0--infodir=3D/home/jvanderpool/d=
ev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/=
share/info <span class=3D"" style=3D"white-space:pre">		</span> =C2=A0--man=
dir=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain=
/sysroots/am57xx-evm/usr/share/man <span class=3D"" style=3D"white-space:pr=
e">		</span> =C2=A0--disable-silent-rules <span class=3D"" style=3D"white-s=
pace:pre">		</span> =C2=A0--disable-dependency-tracking <span class=3D"" st=
yle=3D"white-space:pre">		</span> =C2=A0--with-libtool-sysroot=3D/home/jvan=
derpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx=
-evm</div><div>| configure: loading site script /home/jvanderpool/dev/tisdk=
/sources/meta-openembedded/meta-oe/site/endian-little</div><div>| configure=
: loading site script /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site=
/endian-little</div><div>| configure: loading site script /home/jvanderpool=
/dev/tisdk/sources/oe-core/meta/site/arm-common</div><div>| configure: load=
ing site script /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-3=
2</div><div>| configure: loading site script /home/jvanderpool/dev/tisdk/so=
urces/oe-core/meta/site/common-linux</div><div>| configure: loading site sc=
ript /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-glibc</di=
v><div>| configure: loading site script /home/jvanderpool/dev/tisdk/sources=
/oe-core/meta/site/arm-linux</div><div>| configure: loading site script /ho=
me/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common</div><div>| ## --=
----------------------- ##</div><div>| ## Configuring libtool 2.4.6 ##</div=
><div>| ## ------------------------- ##</div><div>|=C2=A0</div><div>| check=
ing for GNU M4 that supports accurate traces... /home/jvanderpool/dev/tisdk=
/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4=
</div><div>| checking whether /home/jvanderpool/dev/tisdk/build/arago-tmp-e=
xternal-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4 accepts --gnu... =
yes</div><div>| checking how m4 supports trace files... --debugfile</div><d=
iv>| checking for a BSD-compatible install... /usr/bin/install -c</div><div=
>| checking whether build environment is sane... yes</div><div>| checking f=
or arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip</div><div>| checkin=
g for a thread-safe mkdir -p... /bin/mkdir -p</div><div>| checking for gawk=
... gawk</div><div>| checking whether make sets $(MAKE)... yes</div><div>| =
checking whether make supports nested variables... yes</div><div>| checking=
 whether make supports nested variables... (cached) yes</div><div>| checkin=
g build system type... x86_64-pc-linux-gnu</div><div>| checking host system=
 type... arm-unknown-linux-gnueabi</div><div>| configure: autobuild project=
... GNU Libtool</div><div>| configure: autobuild revision... 2.4.6</div><di=
v>| configure: autobuild hostname... jvanderpool-workstation</div><div>| co=
nfigure: autobuild mode... default</div><div>| configure: autobuild timesta=
mp... 20151208T160947Z</div><div>| checking for arm-linux-gnueabi-gcc... ar=
m-linux-gnueabihf-gcc =C2=A0-march=3Darmv7-a -marm =C2=A0-mthumb-interwork =
-mfloat-abi=3Dhard -mfpu=3Dneon -mtune=3Dcortex-a15 --sysroot=3D/home/jvand=
erpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-=
evm</div><div>| checking whether the C compiler works... no</div><div>| con=
figure: error: in `/home/jvanderpool/dev/tisdk/build/arago-tmp-external-lin=
aro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r=
0/build&#39;:</div><div>| configure: error: C compiler cannot create execut=
ables</div><div>| See `config.log&#39; for more details</div><div>| Configu=
re failed. The contents of all config.log files follows to aid debugging</d=
iv><div>| ERROR: oe_runconf failed</div><div>| WARNING: /home/jvanderpool/d=
ev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neo=
n-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.do_configure.32265:1 exit 1=
 from</div><div>| =C2=A0 exit 1</div><div>| ERROR: Function failed: do_conf=
igure (log file is located at /home/jvanderpool/dev/tisdk/build/arago-tmp-e=
xternal-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cr=
oss/2.4.6-r0/temp/log.do_configure.32265)</div><div>ERROR: Task 414 (/home/=
jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/<a href=
=3D"http://libtool-cross_2.4.6.bb">libtool-cross_2.4.6.bb</a>, do_configure=
) failed with exit code &#39;1&#39;</div><div>NOTE: Tasks Summary: Attempte=
d 330 tasks of which 0 didn&#39;t need to be rerun and 1 failed.</div><div>=
NOTE: Writing buildhistory</div><div>Waiting for 0 running tasks to finish:=
</div><div><br></div><div>*** Please tell me who you are.</div><div><br></d=
iv><div>Run</div><div><br></div><div>=C2=A0 git config --global user.email =
&quot;<a href=3D"mailto:you@example.com">you@example.com</a>&quot;</div><di=
v>=C2=A0 git config --global <a href=3D"http://user.name">user.name</a> &qu=
ot;Your Name&quot;</div><div><br></div><div>to set your account&#39;s defau=
lt identity.</div><div>Omit --global to set the identity only in this repos=
itory.</div><div><br></div><div>fatal: unable to auto-detect email address =
(got &#39;jvanderpool@jvanderpool-workstation.(none)&#39;)</div><div><br></=
div><div>Summary: 1 task failed:</div><div>=C2=A0 /home/jvanderpool/dev/tis=
dk/sources/oe-core/meta/recipes-devtools/libtool/<a href=3D"http://libtool-=
cross_2.4.6.bb">libtool-cross_2.4.6.bb</a>, do_configure</div></div><div><b=
r></div></div>

--001a113edd70a77635052667bb60--
