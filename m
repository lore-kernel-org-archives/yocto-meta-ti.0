Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B34E7E00B3A; Tue,  8 Dec 2015 12:02:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54E08E00B30
	for <meta-ti@yoctoproject.org>; Tue,  8 Dec 2015 12:02:04 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB8K23bM009233;
	Tue, 8 Dec 2015 14:02:03 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB8K23WW004752;
	Tue, 8 Dec 2015 14:02:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 14:02:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB8K23BF012291;
	Tue, 8 Dec 2015 14:02:03 -0600
Date: Tue, 8 Dec 2015 15:01:47 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Joshua Vanderpool <jdVdt2@gmail.com>
Message-ID: <20151208200147.GA15136@edge>
References: <CAOYMvD1FdJsUM21hAp8_umo-+qzG9srWAW9B-ZgtCt7wQxhK8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOYMvD1FdJsUM21hAp8_umo-+qzG9srWAW9B-ZgtCt7wQxhK8w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: libtool-cross_2.4.6.bb configure failure
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
X-List-Received-Date: Tue, 08 Dec 2015 20:02:21 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

What is your host machine and Linux distro?

Also, which version of Linaro toolchain do you use? (with Fido we've switched 
to Linaro 2015.05 release, but I think the Wiki hasn't been updated yet)

-- 
Denys


On Tue, Dec 08, 2015 at 02:10:55PM -0500, Joshua Vanderpool wrote:
> I have used the instructions found here
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> 
> To setup a arago build of the am57xx-evm as a starting point.  I then
> ./oe-layertool-setup.sh -f configs/arago-fido-config.txt
> 
> I assumed that this had support for the am57xx, however i have been
> unsuccessful to build the core-image-minimal.
> 
> I am using the compiler as stated in the wiki.
> 
> once i get a build working then i have to add in my custom layers for the
> board i designed.
> I would like to know the layers i should use to have the best video support
> at qt5 will be used and the video ports on the AM57xx.
> 
> Thanks for any support and your time.
> 
> Warning this is the output:
> 
> jvanderpool@jvanderpool-workstation:~/dev/tisdk/build$ MACHINE=am57xx-evm
> bitbake core-image-minimal
> NOTE: Started PRServer with DBfile:
> /home/jvanderpool/dev/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1,
> PORT: 45120, PID: 13826
> NOTE: Your conf/bblayers.conf has been automatically updated.
> NOTE: INCLUDING gnutls as buildable despite INCOMPATIBLE_LICENSE because it
> has been whitelisted###        | ETA:  00:00:06
> Parsing recipes: 100%
> |####################################################################################|
> Time: 00:01:15
> Parsing of 2084 .bb files complete (0 cached, 2084 parsed). 2613 targets,
> 376 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-14.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "am57xx-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2015.11"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard
> cortexa15"
> TARGET_FPU        = "vfp-neon"
> meta-arago-distro
> meta-arago-extras = "master:0b4f6cf573446ee854c1b128aac59210e45d708b"
> meta-qt5          = "jethro:0454fb083c38f2155a8be3b61930ad1ddf995695"
> meta-networking
> meta-ruby
> meta-python
> meta-oe           = "fido:df2f700d66bace65f5d802225232d01cf511fe81"
> meta-ti           = "fido:bc10ffc2e4637a3c0cc020b686c93e92c93ee756"
> meta-linaro-toolchain = "fido:08a46787862966f2236c5a9b3eb4d4ec68263593"
> meta              = "fido:f0873b83d693af4a103999160d67fcf25c7eedc1"
> 
> NOTE: Preparing RunQueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL
> http://www.openssl.org/source/openssl-1.0.2d.tar.gz, attempting MIRRORS if
> available
> ERROR: Function failed: do_configure (log file is located at
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265)
> ERROR: Logfile of failure stored in:
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265
> Log data follows:
> | DEBUG: Executing python function sysroot_cleansstate
> | DEBUG: Python function sysroot_cleansstate finished
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Executing shell function autotools_preconfigure
> | DEBUG: Shell function autotools_preconfigure finished
> | DEBUG: Executing python function autotools_copy_aclocals
> | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
> 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
> | DEBUG: Python function autotools_copy_aclocals finished
> | DEBUG: Executing shell function do_configure
> | automake (GNU automake) 1.15
> | Copyright (C) 2014 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later <
> http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> |        and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1
> | NOTE: Executing ACLOCAL="aclocal
> --system-acdir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/"
> autoreconf --verbose --install --force --exclude=libtoolize -I
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> -I
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> | autoreconf: Entering directory `.'
> | autoreconf: configure.ac: not using Gettext
> | autoreconf: running: aclocal
> --system-acdir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/
> -I
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> -I
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> -I
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> -I
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> --force -I m4
> | autoreconf: configure.ac: tracing
> | autoreconf: running:
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> --force
> | autoreconf: running:
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoheader
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> --force
> | autoreconf: running: automake --add-missing --copy --force-missing
> | autoreconf: running: gnu-configize
> | autoreconf: Leaving directory `.'
> | NOTE: Running
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/configure
>  --build=x86_64-linux  --host=arm-linux-gnueabi
> --target=arm-linux-gnueabi  --prefix=/usr
>  --exec_prefix=/usr  --bindir=/usr/bin  --sbindir=/usr/sbin
> --libexecdir=/usr/lib/libtool
>  --datadir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share
>  --sysconfdir=/etc  --sharedstatedir=/com  --localstatedir=/var
> --libdir=/usr/lib
>  --includedir=/usr/include  --oldincludedir=/usr/include
> --infodir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/info
>  --mandir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/man
>  --disable-silent-rules  --disable-dependency-tracking
>  --with-libtool-sysroot=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/meta-openembedded/meta-oe/site/endian-little
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/endian-little
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-common
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-32
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-linux
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-glibc
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-linux
> | configure: loading site script
> /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common
> | ## ------------------------- ##
> | ## Configuring libtool 2.4.6 ##
> | ## ------------------------- ##
> |
> | checking for GNU M4 that supports accurate traces...
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> | checking whether
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> accepts --gnu... yes
> | checking how m4 supports trace files... --debugfile
> | checking for a BSD-compatible install... /usr/bin/install -c
> | checking whether build environment is sane... yes
> | checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip
> | checking for a thread-safe mkdir -p... /bin/mkdir -p
> | checking for gawk... gawk
> | checking whether make sets $(MAKE)... yes
> | checking whether make supports nested variables... yes
> | checking whether make supports nested variables... (cached) yes
> | checking build system type... x86_64-pc-linux-gnu
> | checking host system type... arm-unknown-linux-gnueabi
> | configure: autobuild project... GNU Libtool
> | configure: autobuild revision... 2.4.6
> | configure: autobuild hostname... jvanderpool-workstation
> | configure: autobuild mode... default
> | configure: autobuild timestamp... 20151208T160947Z
> | checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc
>  -march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
> -mtune=cortex-a15
> --sysroot=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
> | checking whether the C compiler works... no
> | configure: error: in
> `/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build':
> | configure: error: C compiler cannot create executables
> | See `config.log' for more details
> | Configure failed. The contents of all config.log files follows to aid
> debugging
> | ERROR: oe_runconf failed
> | WARNING:
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.do_configure.32265:1
> exit 1 from
> |   exit 1
> | ERROR: Function failed: do_configure (log file is located at
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265)
> ERROR: Task 414
> (/home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
> libtool-cross_2.4.6.bb, do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 330 tasks of which 0 didn't need to be rerun
> and 1 failed.
> NOTE: Writing buildhistory
> Waiting for 0 running tasks to finish:
> 
> *** Please tell me who you are.
> 
> Run
> 
>   git config --global user.email "you@example.com"
>   git config --global user.name "Your Name"
> 
> to set your account's default identity.
> Omit --global to set the identity only in this repository.
> 
> fatal: unable to auto-detect email address (got
> 'jvanderpool@jvanderpool-workstation.(none)')
> 
> Summary: 1 task failed:
>   /home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
> libtool-cross_2.4.6.bb, do_configure

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


