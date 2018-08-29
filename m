Return-Path: <mooneske@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93FC2E006C7; Wed, 29 Aug 2018 14:12:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,LOTS_OF_MONEY,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (mooneske[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.221.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 LOTS_OF_MONEY Huge... sums of money
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1BEA4E00529
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2018 14:12:13 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id a108-v6so6067580wrc.13
	for <meta-ti@yoctoproject.org>; Wed, 29 Aug 2018 14:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=PDvGsy6XIepFHiknRh/XwzgRFb96sqLS5L2xfLGcQ90=;
	b=bLZkeu7FKGMm675qAWCKVrefS0KyMu+Nywr1uM+Xjv78GDQ/2pJus4bsv+3FlFVgcn
	1KdPpAqLUr4Yw1U0XoaN1Sza19x8nQHaJFPHtyKS83nLClc6UAmUwP8KT/tEWiHTA8KL
	8tZD5jwt7U+lvuEdf0p1W8Yt0wuN11q7VsEw8GHW8E1S0GHNDsZOh+Mf4DX9J6uWkr80
	xQq1umL1jXBtD/rNFX2rAaq7cHMAgtnC3l3v2k7JKkwJy+EqYBz7KRKJWd0RICR5ni6C
	/duz+ASSgep2IuFql9B8zG4VDrEaY3whEv4mRVy10lfsvOr0EcnuC99xkmTI/J0qpNKw
	B1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=PDvGsy6XIepFHiknRh/XwzgRFb96sqLS5L2xfLGcQ90=;
	b=qR9zFYePLeiSv+Vs9Sul0GBEBQXPfg9zdl7ZhLhGQyHXB95LN+vNC9HwK7TNaJC/k3
	c5/UwexKf9Bms5SVbqcOazAxk3hqkc+CSRjpaLLb0vCHU5N1XsjE8XPPkl280nGEVJyI
	G233eKsV4eOM0Z0F0YPLUM82lWw+0kpG1Yu658QOg/gTk3YUE+rvwIdFEr9ol3I0wE2C
	MLxOxblpBVFaRHNKsPvIKId+bz5w3Sw/2y4uTz84Zgf3quiMPdGivD1dFqdsqnTOrcT+
	U9YuLr3zBZICWhAvL+kcHjMf1nqpoeg42hkZyQ6cgTeEbALxaUq2dFfwu+W8Rd9IiCF7
	6FWw==
X-Gm-Message-State: APzg51A1EB1nZ2O5hrwfMNyiceOAX+bM52wwEvrCNX5ig9XrizWImyQs
	j2mZnVwOjOi6+0NA/xdKKBqliPiOCSigRc3u5DvmLN5l
X-Google-Smtp-Source: ANB0Vda72RX5uIuPr2TmO91sZGvYL7k0UoOEcBR/iwLz7G4O21qvAvQQ2KXuzutFKerg3LlI/AGLxxX7ilGVx4P82C4=
X-Received: by 2002:adf:dd0e:: with SMTP id a14-v6mr5185650wrm.2.1535577132736;
	Wed, 29 Aug 2018 14:12:12 -0700 (PDT)
MIME-Version: 1.0
From: Joe Keene <mooneske@gmail.com>
Date: Wed, 29 Aug 2018 15:12:01 -0600
Message-ID: <CAO0MQwztTk33ueF+OCo7bGFK6LPKu+=YPHabyHET4oeh8TBmAg@mail.gmail.com>
To: meta-ti@yoctoproject.org
Subject: omap3evm: bitbake x-load fails
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
X-List-Received-Date: Wed, 29 Aug 2018 21:12:15 -0000
Content-Type: multipart/alternative; boundary="00000000000085a66b057499694a"

--00000000000085a66b057499694a
Content-Type: text/plain; charset="UTF-8"

When I try the command: "bitbake x-load", it will almost finish executing
the RunQueue tasks when it fails around 97% progress. I believe these are
the trouble lines:

From what I understand, it means that the cross-compiler fails to find the
gcc library. How can I help it find the gcc library? Is the sysroot
variable hard-coded? The Log is pretty big, so I'm just going to post the
part that I think is relevant. If you want the full log let me know!

-VirtualBox:/poky/build$ bitbake x-load
Loading cache: 100%
|###############################################################################|
Time: 0:00:01
Loaded 2738 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.39.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "omap3evm"
DISTRO               = "poky"
DISTRO_VERSION       = "2.5+snapshot-20180829"
TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta
meta-poky
meta-yocto-bsp       = "master:87d3a9685dd9613e4f6718031d4ebd9344b01c47"
meta-ti              = "master:b987670824163d9aaf45af5661dc916515ec5fea"
meta                 = "master:853e0499be449c71378c087e08b1926be8e2ac87"

Initialising tasks: 100%
|##########################################################################|
Time: 0:00:00
Sstate summary: Wanted 60 Found 0 Missed 60 Current 15 (0% match, 20%
complete)
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: glibc-2.28-r0 do_package: glibc-extra-nss-2.26 was registered as
shlib provider for libnss_db.so.2, changing it to libnss-db-2.28 because it
was built later
ERROR: x-load-1_1.5.1-r3 do_compile: oe_runmake failed
ERROR: x-load-1_1.5.1-r3 do_compile: Function failed: do_compile (log file
is located at
/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161)
ERROR: Logfile of failure stored in:
/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make CROSS_COMPILE=arm-poky-linux-gnueabi- CONFIG_HEADER= distclean
| find
/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git
-type f \
|     \( -name 'core' -o -name '*.bak' -o -name '*~' \
|     -o -name '*.o'  -o -name '*.a'  \) -print \
|     | xargs rm -f
...
(removed a bunch of lines)
...
| make[1]: Leaving directory
'/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git/lib'
| UNDEF_SYM=`arm-poky-linux-gnueabi-objdump -x board/omap3evm/libomap3evm.a
common/libcommon.a cpu/omap3/libomap3.a disk/libdisk.a drivers/libdrivers.a
fs/fat/libfat.a lib/libarm.a |sed  -n -e
's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`;\
|     cd
/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git &&
arm-poky-linux-gnueabi-ld -Bstatic -T
/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git/board/omap3evm/x-load.lds
-Ttext 0x40200800  $UNDEF_SYM cpu/omap3/start.o \
|         --start-group board/omap3evm/libomap3evm.a common/libcommon.a
cpu/omap3/libomap3.a disk/libdisk.a drivers/libdrivers.a fs/fat/libfat.a
lib/libarm.a --end-group -L . -lgcc \
|         -Map x-load.map -o x-load
| arm-poky-linux-gnueabi-ld: cannot find -lgcc
| ERROR: oe_runmake failed
| Makefile:163: recipe for target 'x-load' failed
| make: *** [x-load] Error 1
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161)
ERROR: Task (/poky/meta-ti/recipes-bsp/x-load/x-load_git.bb:do_compile)
failed with exit code '1'
NOTE: Tasks Summary: Attempted 431 tasks of which 125 didn't need to be
rerun and 1 failed.

Summary: 1 task failed:
  /poky/meta-ti/recipes-bsp/x-load/x-load_git.bb:do_compile
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.


I'm fairly new to Embedded Linux and the Yocto Project, so I fear I might
be missing something very basic. I'd be happy to provide any additional
information.

--00000000000085a66b057499694a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>When I try the comm=
and: &quot;bitbake x-load&quot;, it will almost finish executing the RunQue=
ue tasks when it fails around 97% progress. I believe these are the trouble=
 lines: <br></div><div><br></div><div>From what I understand, it means that=
 the cross-compiler fails to find the gcc library. How can I help it find t=
he gcc library? Is the sysroot variable hard-coded? The Log is pretty big, =
so I&#39;m just going to post the part that I think is relevant. If you wan=
t the full log let me know!<br></div><div><br></div><div>-VirtualBox:/poky/=
build$ bitbake x-load<br>Loading cache: 100% |#############################=
##################################################| Time: 0:00:01<br>Loaded=
 2738 entries from dependency cache.<br>NOTE: Resolving any missing task qu=
eue dependencies<br><br>Build Configuration:<br>BB_VERSION=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;1.39.1&quot;<br>BUI=
LD_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D &quot;x86_64-linux&quot;<br>NATIVELSBSTRING=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;universal&quot;<br>TARGET_SYS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;arm-poky-linux-gnueabi&quot;<br>MA=
CHINE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D &quot;omap3evm&quot;<br>DISTRO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;poky&quot;=
<br>DISTRO_VERSION=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;2.5+snapsh=
ot-20180829&quot;<br>TUNE_FEATURES=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D &quot;arm armv7a vfp thumb neon callconvention-hard&quot;<br>TARGET=
_FPU=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;=
hard&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-poky=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <br>meta-yocto-bsp=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:87d3a9685dd9613e4f6718031d4ebd=
9344b01c47&quot;<br>meta-ti=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:b987670824163d9aaf45af5661d=
c916515ec5fea&quot;<br>meta=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &quot;master:853e0499b=
e449c71378c087e08b1926be8e2ac87&quot;<br><br>Initialising tasks: 100% |####=
######################################################################| Tim=
e: 0:00:00<br>Sstate summary: Wanted 60 Found 0 Missed 60 Current 15 (0% ma=
tch, 20% complete)<br>NOTE: Executing SetScene Tasks<br>NOTE: Executing Run=
Queue Tasks<br></div><div>WARNING: glibc-2.28-r0 do_package: glibc-extra-ns=
s-2.26 was registered as shlib provider for libnss_db.so.2, changing it to =
libnss-db-2.28 because it was built later<br>ERROR: x-load-1_1.5.1-r3 do_co=
mpile: oe_runmake failed<br>ERROR: x-load-1_1.5.1-r3 do_compile: Function f=
ailed: do_compile (log file is located at /poky/build/tmp/work/omap3evm-pok=
y-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161)<br>ERROR: Logf=
ile of failure stored in: /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/=
x-load/1_1.5.1-r3/temp/log.do_compile.25161<br>Log data follows:</div><div>=
| DEBUG: Executing shell function do_compile<br>| NOTE: make CROSS_COMPILE=
=3Darm-poky-linux-gnueabi- CONFIG_HEADER=3D distclean<br>| find /poky/build=
/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git -type f \<br>| =
=C2=A0=C2=A0=C2=A0 \( -name &#39;core&#39; -o -name &#39;*.bak&#39; -o -nam=
e &#39;*~&#39; \<br>| =C2=A0=C2=A0=C2=A0 -o -name &#39;*.o&#39;=C2=A0 -o -n=
ame &#39;*.a&#39;=C2=A0 \) -print \<br>| =C2=A0=C2=A0=C2=A0 | xargs rm -f</=
div><div>...</div><div>(removed a bunch of lines)</div><div>...<br>| make[1=
]: Leaving directory &#39;/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/=
x-load/1_1.5.1-r3/git/lib&#39;<br>| UNDEF_SYM=3D`arm-poky-linux-gnueabi-obj=
dump -x board/omap3evm/libomap3evm.a common/libcommon.a cpu/omap3/libomap3.=
a disk/libdisk.a drivers/libdrivers.a fs/fat/libfat.a lib/libarm.a |sed=C2=
=A0 -n -e &#39;s/.*\(__u_boot_cmd_.*\)/-u\1/p&#39;|sort|uniq`;\<br>| =C2=A0=
=C2=A0=C2=A0 cd /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1=
.5.1-r3/git &amp;&amp; arm-poky-linux-gnueabi-ld -Bstatic -T /poky/build/tm=
p/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git/board/omap3evm/x-l=
oad.lds -Ttext 0x40200800=C2=A0 $UNDEF_SYM cpu/omap3/start.o \<br>| =C2=A0=
=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 --start-group board/omap3evm/libomap3evm.a =
common/libcommon.a cpu/omap3/libomap3.a disk/libdisk.a drivers/libdrivers.a=
 fs/fat/libfat.a lib/libarm.a --end-group -L . -lgcc \<br>| =C2=A0=C2=A0=C2=
=A0 =C2=A0=C2=A0=C2=A0 -Map x-load.map -o x-load<br>| arm-poky-linux-gnueab=
i-ld: cannot find -lgcc<br>| ERROR: oe_runmake failed<br>| Makefile:163: re=
cipe for target &#39;x-load&#39; failed<br>| make: *** [x-load] Error 1<br>=
| WARNING: exit code 1 from a shell command.<br>| ERROR: Function failed: d=
o_compile (log file is located at /poky/build/tmp/work/omap3evm-poky-linux-=
gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161)<br>ERROR: Task (/poky/=
meta-ti/recipes-bsp/x-load/x-load_git.bb:do_compile) failed with exit code =
&#39;1&#39;<br>NOTE: Tasks Summary: Attempted 431 tasks of which 125 didn&#=
39;t need to be rerun and 1 failed.<br><br>Summary: 1 task failed:<br>=C2=
=A0 /poky/meta-ti/recipes-bsp/x-load/x-load_git.bb:do_compile<br>Summary: T=
here was 1 WARNING message shown.<br>Summary: There were 2 ERROR messages s=
hown, returning a non-zero exit code.<br><br></div><div><br></div><div>I&#3=
9;m fairly new to Embedded Linux and the Yocto Project, so I fear I might b=
e missing something very basic. I&#39;d be happy to provide any additional =
information. <br></div></div></div></div>

--00000000000085a66b057499694a--
