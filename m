Return-Path: <jdvdt2@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5EBDEE00BEA; Wed,  9 Dec 2015 03:23:31 -0800 (PST)
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
	*      [209.85.213.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f53.google.com (mail-vk0-f53.google.com
	[209.85.213.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB44E00AB9
	for <meta-ti@yoctoproject.org>; Wed,  9 Dec 2015 03:23:26 -0800 (PST)
Received: by vkha189 with SMTP id a189so41762971vkh.2
	for <meta-ti@yoctoproject.org>; Wed, 09 Dec 2015 03:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yXw4iGDRFyze0vEVJ3cH6Fh4jgRLGVCyxOzEkQOjI48=;
	b=FaG81PfgUp9lWNKxKMb08R/0DF5PqrzCz0IuOsDbLqZt7rab9CKhfAP+z23Y7cMrw/
	Wm8HbCthfrdQH3HHl+5+J5/MI/ajd3GOfEp1PSlE9mRmA3SEDtq9vc3l6OIXp/k4Wfvj
	O1NkT/oY6FVdChSy72/HhmMzSQbkuq4Gd5ZKEQR2FBRhNwW1urOrd1iau2JyoL1MaPbl
	WEPSy9TWShocjBDQXv+N2lX6cGA6wpXysdzfnFPBjj9i2hf9VvCr/9sbz8HHFYx4VuQS
	IVXtFJxjHjp+nFObvMXUfi3XJqGORSq89b1ZeUQcsasya/8g+Ujd3bL/TcabT6M1bK+6
	QZXQ==
MIME-Version: 1.0
X-Received: by 10.31.153.11 with SMTP id b11mr4100001vke.127.1449660205873;
	Wed, 09 Dec 2015 03:23:25 -0800 (PST)
Received: by 10.31.93.69 with HTTP; Wed, 9 Dec 2015 03:23:25 -0800 (PST)
In-Reply-To: <20151208200147.GA15136@edge>
References: <CAOYMvD1FdJsUM21hAp8_umo-+qzG9srWAW9B-ZgtCt7wQxhK8w@mail.gmail.com>
	<20151208200147.GA15136@edge>
Date: Wed, 9 Dec 2015 06:23:25 -0500
Message-ID: <CAAjA2MLo2=j_+mT1v5te8CwPks234xBOC6UG4v=+jTNZgDt2KQ@mail.gmail.com>
From: Joshua Vanderpool <jdvdt2@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Wed, 09 Dec 2015 11:23:31 -0000
Content-Type: multipart/alternative; boundary=001a1140fe589dbed0052675513e

--001a1140fe589dbed0052675513e
Content-Type: text/plain; charset=UTF-8

The host is a 64 bit Ubuntu 14.04LTS machine.

I am using the 2013 version of the toolchain as found on the wiki.
Could the toolchain be built by the meta-linaro layer, removing the need
for the external toolchain?

Josh

On Tue, Dec 8, 2015 at 3:01 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> What is your host machine and Linux distro?
>
> Also, which version of Linaro toolchain do you use? (with Fido we've
> switched
> to Linaro 2015.05 release, but I think the Wiki hasn't been updated yet)
>
> --
> Denys
>
>
> On Tue, Dec 08, 2015 at 02:10:55PM -0500, Joshua Vanderpool wrote:
> > I have used the instructions found here
> > http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment
> >
> > To setup a arago build of the am57xx-evm as a starting point.  I then
> > ./oe-layertool-setup.sh -f configs/arago-fido-config.txt
> >
> > I assumed that this had support for the am57xx, however i have been
> > unsuccessful to build the core-image-minimal.
> >
> > I am using the compiler as stated in the wiki.
> >
> > once i get a build working then i have to add in my custom layers for the
> > board i designed.
> > I would like to know the layers i should use to have the best video
> support
> > at qt5 will be used and the video ports on the AM57xx.
> >
> > Thanks for any support and your time.
> >
> > Warning this is the output:
> >
> > jvanderpool@jvanderpool-workstation:~/dev/tisdk/build$
> MACHINE=am57xx-evm
> > bitbake core-image-minimal
> > NOTE: Started PRServer with DBfile:
> > /home/jvanderpool/dev/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1,
> > PORT: 45120, PID: 13826
> > NOTE: Your conf/bblayers.conf has been automatically updated.
> > NOTE: INCLUDING gnutls as buildable despite INCOMPATIBLE_LICENSE because
> it
> > has been whitelisted###        | ETA:  00:00:06
> > Parsing recipes: 100%
> >
> |####################################################################################|
> > Time: 00:01:15
> > Parsing of 2084 .bb files complete (0 cached, 2084 parsed). 2613 targets,
> > 376 skipped, 0 masked, 0 errors.
> > NOTE: Resolving any missing task queue dependencies
> >
> > Build Configuration:
> > BB_VERSION        = "1.26.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-14.04"
> > TARGET_SYS        = "arm-linux-gnueabi"
> > MACHINE           = "am57xx-evm"
> > DISTRO            = "arago"
> > DISTRO_VERSION    = "2015.11"
> > TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard
> > cortexa15"
> > TARGET_FPU        = "vfp-neon"
> > meta-arago-distro
> > meta-arago-extras = "master:0b4f6cf573446ee854c1b128aac59210e45d708b"
> > meta-qt5          = "jethro:0454fb083c38f2155a8be3b61930ad1ddf995695"
> > meta-networking
> > meta-ruby
> > meta-python
> > meta-oe           = "fido:df2f700d66bace65f5d802225232d01cf511fe81"
> > meta-ti           = "fido:bc10ffc2e4637a3c0cc020b686c93e92c93ee756"
> > meta-linaro-toolchain = "fido:08a46787862966f2236c5a9b3eb4d4ec68263593"
> > meta              = "fido:f0873b83d693af4a103999160d67fcf25c7eedc1"
> >
> > NOTE: Preparing RunQueue
> > NOTE: Executing SetScene Tasks
> > NOTE: Executing RunQueue Tasks
> > WARNING: Failed to fetch URL
> > http://www.openssl.org/source/openssl-1.0.2d.tar.gz, attempting MIRRORS
> if
> > available
> > ERROR: Function failed: do_configure (log file is located at
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265)
> > ERROR: Logfile of failure stored in:
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265
> > Log data follows:
> > | DEBUG: Executing python function sysroot_cleansstate
> > | DEBUG: Python function sysroot_cleansstate finished
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
> > 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> > | DEBUG: Executing shell function autotools_preconfigure
> > | DEBUG: Shell function autotools_preconfigure finished
> > | DEBUG: Executing python function autotools_copy_aclocals
> > | DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'arm-32',
> > 'common-linux', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi',
> 'common']
> > | DEBUG: Python function autotools_copy_aclocals finished
> > | DEBUG: Executing shell function do_configure
> > | automake (GNU automake) 1.15
> > | Copyright (C) 2014 Free Software Foundation, Inc.
> > | License GPLv2+: GNU GPL version 2 or later <
> > http://gnu.org/licenses/gpl-2.0.html>
> > | This is free software: you are free to change and redistribute it.
> > | There is NO WARRANTY, to the extent permitted by law.
> > |
> > | Written by Tom Tromey <tromey@redhat.com>
> > |        and Alexandre Duret-Lutz <adl@gnu.org>.
> > | AUTOV is 1
> > | NOTE: Executing ACLOCAL="aclocal
> >
> --system-acdir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/"
> > autoreconf --verbose --install --force --exclude=libtoolize -I
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> > -I
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> > | autoreconf: Entering directory `.'
> > | autoreconf: configure.ac: not using Gettext
> > | autoreconf: running: aclocal
> >
> --system-acdir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build/aclocal-copy/
> > -I
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> > -I
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> > -I
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> > -I
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> > --force -I m4
> > | autoreconf: configure.ac: tracing
> > | autoreconf: running:
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoconf
> >
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> >
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> > --force
> > | autoreconf: running:
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/autoheader
> >
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/m4/
> >
> --include=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/tests/
> > --force
> > | autoreconf: running: automake --add-missing --copy --force-missing
> > | autoreconf: running: gnu-configize
> > | autoreconf: Leaving directory `.'
> > | NOTE: Running
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.6/configure
> >  --build=x86_64-linux  --host=arm-linux-gnueabi
> > --target=arm-linux-gnueabi  --prefix=/usr
> >  --exec_prefix=/usr  --bindir=/usr/bin  --sbindir=/usr/sbin
> > --libexecdir=/usr/lib/libtool
> >
> --datadir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share
> >  --sysconfdir=/etc  --sharedstatedir=/com  --localstatedir=/var
> > --libdir=/usr/lib
> >  --includedir=/usr/include  --oldincludedir=/usr/include
> >
> --infodir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/info
> >
> --mandir=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm/usr/share/man
> >  --disable-silent-rules  --disable-dependency-tracking
> >
> --with-libtool-sysroot=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
> > | configure: loading site script
> >
> /home/jvanderpool/dev/tisdk/sources/meta-openembedded/meta-oe/site/endian-little
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/endian-little
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-common
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-32
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-linux
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-glibc
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-linux
> > | configure: loading site script
> > /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common
> > | ## ------------------------- ##
> > | ## Configuring libtool 2.4.6 ##
> > | ## ------------------------- ##
> > |
> > | checking for GNU M4 that supports accurate traces...
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> > | checking whether
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/x86_64-linux/usr/bin/m4
> > accepts --gnu... yes
> > | checking how m4 supports trace files... --debugfile
> > | checking for a BSD-compatible install... /usr/bin/install -c
> > | checking whether build environment is sane... yes
> > | checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip
> > | checking for a thread-safe mkdir -p... /bin/mkdir -p
> > | checking for gawk... gawk
> > | checking whether make sets $(MAKE)... yes
> > | checking whether make supports nested variables... yes
> > | checking whether make supports nested variables... (cached) yes
> > | checking build system type... x86_64-pc-linux-gnu
> > | checking host system type... arm-unknown-linux-gnueabi
> > | configure: autobuild project... GNU Libtool
> > | configure: autobuild revision... 2.4.6
> > | configure: autobuild hostname... jvanderpool-workstation
> > | configure: autobuild mode... default
> > | configure: autobuild timestamp... 20151208T160947Z
> > | checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc
> >  -march=armv7-a -marm  -mthumb-interwork -mfloat-abi=hard -mfpu=neon
> > -mtune=cortex-a15
> >
> --sysroot=/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/sysroots/am57xx-evm
> > | checking whether the C compiler works... no
> > | configure: error: in
> >
> `/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build':
> > | configure: error: C compiler cannot create executables
> > | See `config.log' for more details
> > | Configure failed. The contents of all config.log files follows to aid
> > debugging
> > | ERROR: oe_runconf failed
> > | WARNING:
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.do_configure.32265:1
> > exit 1 from
> > |   exit 1
> > | ERROR: Function failed: do_configure (log file is located at
> >
> /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_configure.32265)
> > ERROR: Task 414
> >
> (/home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
> > libtool-cross_2.4.6.bb, do_configure) failed with exit code '1'
> > NOTE: Tasks Summary: Attempted 330 tasks of which 0 didn't need to be
> rerun
> > and 1 failed.
> > NOTE: Writing buildhistory
> > Waiting for 0 running tasks to finish:
> >
> > *** Please tell me who you are.
> >
> > Run
> >
> >   git config --global user.email "you@example.com"
> >   git config --global user.name "Your Name"
> >
> > to set your account's default identity.
> > Omit --global to set the identity only in this repository.
> >
> > fatal: unable to auto-detect email address (got
> > 'jvanderpool@jvanderpool-workstation.(none)')
> >
> > Summary: 1 task failed:
> >
>  /home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/libtool/
> > libtool-cross_2.4.6.bb, do_configure
>
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>
>

--001a1140fe589dbed0052675513e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The host is a 64 bit Ubuntu 14.04LTS machine.<div><br></di=
v><div>I am using the 2013 version of the toolchain as found on the wiki.</=
div><div>Could the toolchain be built by the meta-linaro layer, removing th=
e need for the external toolchain?</div><div><br></div><div>Josh</div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Dec 8, 2=
015 at 3:01 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:d=
enys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">What is your host machine and Linux distro?<br>
<br>
Also, which version of Linaro toolchain do you use? (with Fido we&#39;ve sw=
itched<br>
to Linaro 2015.05 release, but I think the Wiki hasn&#39;t been updated yet=
)<br>
<br>
--<br>
Denys<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
On Tue, Dec 08, 2015 at 02:10:55PM -0500, Joshua Vanderpool wrote:<br>
&gt; I have used the instructions found here<br>
&gt; <a href=3D"http://arago-project.org/wiki/index.php/Setting_Up_Build_En=
vironment" rel=3D"noreferrer" target=3D"_blank">http://arago-project.org/wi=
ki/index.php/Setting_Up_Build_Environment</a><br>
&gt;<br>
&gt; To setup a arago build of the am57xx-evm as a starting point.=C2=A0 I =
then<br>
&gt; ./oe-layertool-setup.sh -f configs/arago-fido-config.txt<br>
&gt;<br>
&gt; I assumed that this had support for the am57xx, however i have been<br=
>
&gt; unsuccessful to build the core-image-minimal.<br>
&gt;<br>
&gt; I am using the compiler as stated in the wiki.<br>
&gt;<br>
&gt; once i get a build working then i have to add in my custom layers for =
the<br>
&gt; board i designed.<br>
&gt; I would like to know the layers i should use to have the best video su=
pport<br>
&gt; at qt5 will be used and the video ports on the AM57xx.<br>
&gt;<br>
&gt; Thanks for any support and your time.<br>
&gt;<br>
&gt; Warning this is the output:<br>
&gt;<br>
&gt; jvanderpool@jvanderpool-workstation:~/dev/tisdk/build$ MACHINE=3Dam57x=
x-evm<br>
&gt; bitbake core-image-minimal<br>
&gt; NOTE: Started PRServer with DBfile:<br>
&gt; /home/jvanderpool/dev/tisdk/build/cache/prserv.sqlite3, IP: 127.0.0.1,=
<br>
&gt; PORT: 45120, PID: 13826<br>
&gt; NOTE: Your conf/bblayers.conf has been automatically updated.<br>
&gt; NOTE: INCLUDING gnutls as buildable despite INCOMPATIBLE_LICENSE becau=
se it<br>
&gt; has been whitelisted###=C2=A0 =C2=A0 =C2=A0 =C2=A0 | ETA:=C2=A0 00:00:=
06<br>
&gt; Parsing recipes: 100%<br>
&gt; |#####################################################################=
###############|<br>
&gt; Time: 00:01:15<br>
&gt; Parsing of 2084 .bb files complete (0 cached, 2084 parsed). 2613 targe=
ts,<br>
&gt; 376 skipped, 0 masked, 0 errors.<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.26.0&quot;<br>
&gt; BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot=
;<br>
&gt; NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Ubuntu-14.04&quot;<br>
&gt; TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-linux-gnueabi&quot=
;<br>
&gt; MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;am57xx-evm&q=
uot;<br>
&gt; DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arago&quot;<=
br>
&gt; DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2015.11&quot;<br>
&gt; TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp thumb neon c=
allconvention-hard<br>
&gt; cortexa15&quot;<br>
&gt; TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;vfp-neon&quot;<br>
&gt; meta-arago-distro<br>
&gt; meta-arago-extras =3D &quot;master:0b4f6cf573446ee854c1b128aac59210e45=
d708b&quot;<br>
&gt; meta-qt5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;jethro:0454fb083c=
38f2155a8be3b61930ad1ddf995695&quot;<br>
&gt; meta-networking<br>
&gt; meta-ruby<br>
&gt; meta-python<br>
&gt; meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;fido:df2f700=
d66bace65f5d802225232d01cf511fe81&quot;<br>
&gt; meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;fido:bc10ffc=
2e4637a3c0cc020b686c93e92c93ee756&quot;<br>
&gt; meta-linaro-toolchain =3D &quot;fido:08a46787862966f2236c5a9b3eb4d4ec6=
8263593&quot;<br>
&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;fido:f0=
873b83d693af4a103999160d67fcf25c7eedc1&quot;<br>
&gt;<br>
&gt; NOTE: Preparing RunQueue<br>
&gt; NOTE: Executing SetScene Tasks<br>
&gt; NOTE: Executing RunQueue Tasks<br>
&gt; WARNING: Failed to fetch URL<br>
&gt; <a href=3D"http://www.openssl.org/source/openssl-1.0.2d.tar.gz" rel=3D=
"noreferrer" target=3D"_blank">http://www.openssl.org/source/openssl-1.0.2d=
.tar.gz</a>, attempting MIRRORS if<br>
&gt; available<br>
&gt; ERROR: Function failed: do_configure (log file is located at<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_=
configure.32265)<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_=
configure.32265<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing python function sysroot_cleansstate<br>
&gt; | DEBUG: Python function sysroot_cleansstate finished<br>
&gt; | DEBUG: SITE files [&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;a=
rm-common&#39;, &#39;arm-32&#39;,<br>
&gt; &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &=
#39;arm-linux-gnueabi&#39;, &#39;common&#39;]<br>
&gt; | DEBUG: Executing shell function autotools_preconfigure<br>
&gt; | DEBUG: Shell function autotools_preconfigure finished<br>
&gt; | DEBUG: Executing python function autotools_copy_aclocals<br>
&gt; | DEBUG: SITE files [&#39;endian-little&#39;, &#39;bit-32&#39;, &#39;a=
rm-common&#39;, &#39;arm-32&#39;,<br>
&gt; &#39;common-linux&#39;, &#39;common-glibc&#39;, &#39;arm-linux&#39;, &=
#39;arm-linux-gnueabi&#39;, &#39;common&#39;]<br>
&gt; | DEBUG: Python function autotools_copy_aclocals finished<br>
&gt; | DEBUG: Executing shell function do_configure<br>
&gt; | automake (GNU automake) 1.15<br>
&gt; | Copyright (C) 2014 Free Software Foundation, Inc.<br>
&gt; | License GPLv2+: GNU GPL version 2 or later &lt;<br>
&gt; <a href=3D"http://gnu.org/licenses/gpl-2.0.html" rel=3D"noreferrer" ta=
rget=3D"_blank">http://gnu.org/licenses/gpl-2.0.html</a>&gt;<br>
&gt; | This is free software: you are free to change and redistribute it.<b=
r>
&gt; | There is NO WARRANTY, to the extent permitted by law.<br>
&gt; |<br>
&gt; | Written by Tom Tromey &lt;<a href=3D"mailto:tromey@redhat.com">trome=
y@redhat.com</a>&gt;<br>
&gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 and Alexandre Duret-Lutz &lt;<a href=3D"m=
ailto:adl@gnu.org">adl@gnu.org</a>&gt;.<br>
&gt; | AUTOV is 1<br>
&gt; | NOTE: Executing ACLOCAL=3D&quot;aclocal<br>
&gt; --system-acdir=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-=
linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.=
6-r0/build/aclocal-copy/&quot;<br>
&gt; autoreconf --verbose --install --force --exclude=3Dlibtoolize -I<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/m4/<br>
&gt; -I<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/tests/<br>
&gt; | autoreconf: Entering directory `.&#39;<br>
&gt; | autoreconf: <a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a>: not using Gettext<br>
&gt; | autoreconf: running: aclocal<br>
&gt; --system-acdir=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-=
linaro-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.=
6-r0/build/aclocal-copy/<br>
&gt; -I<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/m4/<br>
&gt; -I<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/tests/<br>
&gt; -I<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/m4/<br>
&gt; -I<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/tests/<br>
&gt; --force -I m4<br>
&gt; | autoreconf: <a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a>: tracing<br>
&gt; | autoreconf: running:<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
sysroots/x86_64-linux/usr/bin/autoconf<br>
&gt; --include=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linar=
o-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/=
libtool-2.4.6/m4/<br>
&gt; --include=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linar=
o-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/=
libtool-2.4.6/tests/<br>
&gt; --force<br>
&gt; | autoreconf: running:<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
sysroots/x86_64-linux/usr/bin/autoheader<br>
&gt; --include=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linar=
o-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/=
libtool-2.4.6/m4/<br>
&gt; --include=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linar=
o-toolchain/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/=
libtool-2.4.6/tests/<br>
&gt; --force<br>
&gt; | autoreconf: running: automake --add-missing --copy --force-missing<b=
r>
&gt; | autoreconf: running: gnu-configize<br>
&gt; | autoreconf: Leaving directory `.&#39;<br>
&gt; | NOTE: Running<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/libtool-2.4.=
6/configure<br>
&gt;=C2=A0 --build=3Dx86_64-linux=C2=A0 --host=3Darm-linux-gnueabi<br>
&gt; --target=3Darm-linux-gnueabi=C2=A0 --prefix=3D/usr<br>
&gt;=C2=A0 --exec_prefix=3D/usr=C2=A0 --bindir=3D/usr/bin=C2=A0 --sbindir=
=3D/usr/sbin<br>
&gt; --libexecdir=3D/usr/lib/libtool<br>
&gt;=C2=A0 --datadir=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external=
-linaro-toolchain/sysroots/am57xx-evm/usr/share<br>
&gt;=C2=A0 --sysconfdir=3D/etc=C2=A0 --sharedstatedir=3D/com=C2=A0 --locals=
tatedir=3D/var<br>
&gt; --libdir=3D/usr/lib<br>
&gt;=C2=A0 --includedir=3D/usr/include=C2=A0 --oldincludedir=3D/usr/include=
<br>
&gt; --infodir=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linar=
o-toolchain/sysroots/am57xx-evm/usr/share/info<br>
&gt;=C2=A0 --mandir=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-=
linaro-toolchain/sysroots/am57xx-evm/usr/share/man<br>
&gt;=C2=A0 --disable-silent-rules=C2=A0 --disable-dependency-tracking<br>
&gt;=C2=A0 --with-libtool-sysroot=3D/home/jvanderpool/dev/tisdk/build/arago=
-tmp-external-linaro-toolchain/sysroots/am57xx-evm<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/meta-openembedded/meta-oe/site/end=
ian-little<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/endian-little<br=
>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-common<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-32<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-linux<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common-glibc<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/arm-linux<br>
&gt; | configure: loading site script<br>
&gt; /home/jvanderpool/dev/tisdk/sources/oe-core/meta/site/common<br>
&gt; | ## ------------------------- ##<br>
&gt; | ## Configuring libtool 2.4.6 ##<br>
&gt; | ## ------------------------- ##<br>
&gt; |<br>
&gt; | checking for GNU M4 that supports accurate traces...<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
sysroots/x86_64-linux/usr/bin/m4<br>
&gt; | checking whether<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
sysroots/x86_64-linux/usr/bin/m4<br>
&gt; accepts --gnu... yes<br>
&gt; | checking how m4 supports trace files... --debugfile<br>
&gt; | checking for a BSD-compatible install... /usr/bin/install -c<br>
&gt; | checking whether build environment is sane... yes<br>
&gt; | checking for arm-linux-gnueabi-strip... arm-linux-gnueabihf-strip<br=
>
&gt; | checking for a thread-safe mkdir -p... /bin/mkdir -p<br>
&gt; | checking for gawk... gawk<br>
&gt; | checking whether make sets $(MAKE)... yes<br>
&gt; | checking whether make supports nested variables... yes<br>
&gt; | checking whether make supports nested variables... (cached) yes<br>
&gt; | checking build system type... x86_64-pc-linux-gnu<br>
&gt; | checking host system type... arm-unknown-linux-gnueabi<br>
&gt; | configure: autobuild project... GNU Libtool<br>
&gt; | configure: autobuild revision... 2.4.6<br>
&gt; | configure: autobuild hostname... jvanderpool-workstation<br>
&gt; | configure: autobuild mode... default<br>
&gt; | configure: autobuild timestamp... 20151208T160947Z<br>
&gt; | checking for arm-linux-gnueabi-gcc... arm-linux-gnueabihf-gcc<br>
&gt;=C2=A0 -march=3Darmv7-a -marm=C2=A0 -mthumb-interwork -mfloat-abi=3Dhar=
d -mfpu=3Dneon<br>
&gt; -mtune=3Dcortex-a15<br>
&gt; --sysroot=3D/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linar=
o-toolchain/sysroots/am57xx-evm<br>
&gt; | checking whether the C compiler works... no<br>
&gt; | configure: error: in<br>
&gt; `/home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain=
/work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/build&#39;:=
<br>
&gt; | configure: error: C compiler cannot create executables<br>
&gt; | See `config.log&#39; for more details<br>
&gt; | Configure failed. The contents of all config.log files follows to ai=
d<br>
&gt; debugging<br>
&gt; | ERROR: oe_runconf failed<br>
&gt; | WARNING:<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/run.do_=
configure.32265:1<br>
&gt; exit 1 from<br>
&gt; |=C2=A0 =C2=A0exit 1<br>
&gt; | ERROR: Function failed: do_configure (log file is located at<br>
&gt; /home/jvanderpool/dev/tisdk/build/arago-tmp-external-linaro-toolchain/=
work/cortexa15hf-vfp-neon-linux-gnueabi/libtool-cross/2.4.6-r0/temp/log.do_=
configure.32265)<br>
&gt; ERROR: Task 414<br>
&gt; (/home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-devtools/lib=
tool/<br>
&gt; <a href=3D"http://libtool-cross_2.4.6.bb" rel=3D"noreferrer" target=3D=
"_blank">libtool-cross_2.4.6.bb</a>, do_configure) failed with exit code &#=
39;1&#39;<br>
&gt; NOTE: Tasks Summary: Attempted 330 tasks of which 0 didn&#39;t need to=
 be rerun<br>
&gt; and 1 failed.<br>
&gt; NOTE: Writing buildhistory<br>
&gt; Waiting for 0 running tasks to finish:<br>
&gt;<br>
&gt; *** Please tell me who you are.<br>
&gt;<br>
&gt; Run<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git config --global user.email &quot;<a href=3D"mailto:you=
@example.com">you@example.com</a>&quot;<br>
&gt;=C2=A0 =C2=A0git config --global <a href=3D"http://user.name" rel=3D"no=
referrer" target=3D"_blank">user.name</a> &quot;Your Name&quot;<br>
&gt;<br>
&gt; to set your account&#39;s default identity.<br>
&gt; Omit --global to set the identity only in this repository.<br>
&gt;<br>
&gt; fatal: unable to auto-detect email address (got<br>
&gt; &#39;jvanderpool@jvanderpool-workstation.(none)&#39;)<br>
&gt;<br>
&gt; Summary: 1 task failed:<br>
&gt;=C2=A0 =C2=A0/home/jvanderpool/dev/tisdk/sources/oe-core/meta/recipes-d=
evtools/libtool/<br>
&gt; <a href=3D"http://libtool-cross_2.4.6.bb" rel=3D"noreferrer" target=3D=
"_blank">libtool-cross_2.4.6.bb</a>, do_configure<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
<br>
</font></span></blockquote></div><br></div>

--001a1140fe589dbed0052675513e--
