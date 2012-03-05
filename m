Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBE5AE0074A
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 07:16:59 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S4Zef-00040Z-7J; Mon, 05 Mar 2012 10:16:53 -0500
Date: Mon, 5 Mar 2012 10:16:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Christian.Schulenberg@bmw.de
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
Message-ID: <alpine.DEB.2.02.1203051014001.6054@oneiric>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti@yoctoproject.org
Subject: Re: Building Yocto for Pandaboard
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2012 15:17:00 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:

> Hi,
>
> I'm using a Pandaboard Rev A4, so it is in fact an OMAP4430 board.
>
> You can change to u-boot bootloader in /meta-ti/conf/machine/omap4430-panda.conf:
>
> #EXTRA_IMAGEDEPENDS = "x-load u-boot-sakoman " -> remove or comment this line out
> EXTRA_IMAGEDEPENDS += "u-boot" -> I used this line, but because omap4430-panda.conf includes omap3.inc, it should be obsolete. Same definition is in there. X-Load can be removed from omap3.inc from my point of view, because it's not necessary.
>
> #PREFERRED_PROVIDER_virtual/bootloader = "u-boot-sakoman"  -> remove or comment this line out
> PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
>
> Your question about gcc4.7: I haven't used this version yet.
>
> I have build core-image-base as well as core-image-basic successfully for Pandaboard. I connect to the board via the serial interface, so I don't need a configured eth0 yet.
>
> Thanks for your suggestion about systemd. I will try to pull in system in the next days.

  without making any of the above changes (since it doesn't appear it
would affect what i'm doing), i'm getting a build error that goes back
many months:

ERROR: Function failed: do_compile_perf (see /home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/temp/log.do_compile_perf.29777 for further information)
NOTE: make -j 8 -C /home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf CC=arm-poky-linux-gnueabi-gcc  -march=armv7-a -fno-tree-vectorize      -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8 --sysroot=/home/rpjday/yocto/builds/omap4430_panda/tmp/sysroots/omap4430-panda LD=arm-poky-linux-gnueabi-ld --sysroot=/home/rpjday/yocto/builds/omap4430_panda/tmp/sysroots/omap4430-panda  prefix=/usr NO_NEWT=1 NO_DWARF=1
make: Entering directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
PERF_VERSION = ti.ubuntu.2.6.35.993.3
make: Leaving directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
make: Entering directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
    GEN common-cmds.h
    * new build flags or prefix
touch .perf.dev.null
    GEN perf-archive
    CC builtin-annotate.o
    CC builtin-bench.o
    CC bench/sched-messaging.o
    CC bench/sched-pipe.o
    CC bench/mem-memcpy.o
    CC builtin-diff.o
    CC builtin-sched.o
bench/sched-pipe.c: In function 'bench_sched_pipe':
bench/sched-pipe.c:58:6: error: variable 'ret' set but not used [-Werror=unused-but-set-variable]
cc1: all warnings being treated as errors

make: *** [bench/sched-pipe.o] Error 1
make: *** Waiting for unfinished jobs....
    CC builtin-buildid-list.o
builtin-sched.c: In function 'process_sched_event':
builtin-sched.c:373:12: error: variable 'delta' set but not used [-Werror=unused-but-set-variable]
builtin-sched.c: In function 'run_one_test':
builtin-sched.c:564:39: error: variable 'std_dev' set but not used [-Werror=unused-but-set-variable]
builtin-sched.c: In function 'replay_switch_event':
builtin-sched.c:801:27: error: variable 'next' set but not used [-Werror=unused-but-set-variable]
builtin-sched.c: In function 'map_switch_event':
builtin-sched.c:1406:17: error: variable 'sched_out' set but not used [-Werror=unused-but-set-variable]
cc1: all warnings being treated as errors

make: *** [builtin-sched.o] Error 1
rm .perf.dev.null
make: Leaving directory `/home/rpjday/yocto/builds/omap4430_panda/tmp/work/omap4430_panda-poky-linux-gnueabi/linux-omap4-2.6.35.7-r0/git/tools/perf'
ERROR: oe_runmake failed


  i'd thought that had been addressed some time back.  did you not see
that build error?  does that mean using a different version of gcc
would resolve it?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

