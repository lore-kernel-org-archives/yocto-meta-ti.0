Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 97766E00994; Thu, 30 Aug 2018 12:54:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, LOTS_OF_MONEY,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 LOTS_OF_MONEY Huge... sums of money
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ABBFCE0079D
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2018 12:54:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7UJsZxB018839;
	Thu, 30 Aug 2018 14:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535658875;
	bh=BoERV+JKZhjC9IytArLZWFwZV4ugb0L/sfk17AcORPw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=onLlYiR+U3l7WT5ctVMmCGgMMYAwxIJFovTunS3c4ctevQktNPqjN3OKhHX96Wbcy
	16M1mhUsdBH9egjutN10To4AS6KQEMLlV1J0QvFTzl79j8MbSNK1Cgw3O2S7J8Vf9k
	F38xyAKxk3EHmt5LX5CBV7EcYZgjjCLnl1UA/2uk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJsZcW021399;
	Thu, 30 Aug 2018 14:54:35 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 30 Aug 2018 14:54:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 30 Aug 2018 14:54:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7UJsZal020649;
	Thu, 30 Aug 2018 14:54:35 -0500
Date: Thu, 30 Aug 2018 15:53:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Joe Keene <mooneske@gmail.com>
Message-ID: <20180830195348.GL11110@beryl>
References: <CAO0MQwztTk33ueF+OCo7bGFK6LPKu+=YPHabyHET4oeh8TBmAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAO0MQwztTk33ueF+OCo7bGFK6LPKu+=YPHabyHET4oeh8TBmAg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: omap3evm: bitbake x-load fails
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
X-List-Received-Date: Thu, 30 Aug 2018 19:54:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

X-load has been deprecated for over 7 years. Are you trying to build it with 
the latest toolchain with GGC 8 and glibc 2.28? Why?

U-boot provides SPL and should support OMAP3 w/o problems.

-- 
Denys


On Wed, Aug 29, 2018 at 03:12:01PM -0600, Joe Keene wrote:
> When I try the command: "bitbake x-load", it will almost finish executing
> the RunQueue tasks when it fails around 97% progress. I believe these are
> the trouble lines:
> 
> From what I understand, it means that the cross-compiler fails to find the
> gcc library. How can I help it find the gcc library? Is the sysroot
> variable hard-coded? The Log is pretty big, so I'm just going to post the
> part that I think is relevant. If you want the full log let me know!
> 
> -VirtualBox:/poky/build$ bitbake x-load
> Loading cache: 100%
> |###############################################################################|
> Time: 0:00:01
> Loaded 2738 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
> 
> Build Configuration:
> BB_VERSION           = "1.39.1"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "arm-poky-linux-gnueabi"
> MACHINE              = "omap3evm"
> DISTRO               = "poky"
> DISTRO_VERSION       = "2.5+snapshot-20180829"
> TUNE_FEATURES        = "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           = "hard"
> meta
> meta-poky
> meta-yocto-bsp       = "master:87d3a9685dd9613e4f6718031d4ebd9344b01c47"
> meta-ti              = "master:b987670824163d9aaf45af5661dc916515ec5fea"
> meta                 = "master:853e0499be449c71378c087e08b1926be8e2ac87"
> 
> Initialising tasks: 100%
> |##########################################################################|
> Time: 0:00:00
> Sstate summary: Wanted 60 Found 0 Missed 60 Current 15 (0% match, 20%
> complete)
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: glibc-2.28-r0 do_package: glibc-extra-nss-2.26 was registered as
> shlib provider for libnss_db.so.2, changing it to libnss-db-2.28 because it
> was built later
> ERROR: x-load-1_1.5.1-r3 do_compile: oe_runmake failed
> ERROR: x-load-1_1.5.1-r3 do_compile: Function failed: do_compile (log file
> is located at
> /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161)
> ERROR: Logfile of failure stored in:
> /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make CROSS_COMPILE=arm-poky-linux-gnueabi- CONFIG_HEADER= distclean
> | find
> /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git
> -type f \
> |     \( -name 'core' -o -name '*.bak' -o -name '*~' \
> |     -o -name '*.o'  -o -name '*.a'  \) -print \
> |     | xargs rm -f
> ...
> (removed a bunch of lines)
> ...
> | make[1]: Leaving directory
> '/poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git/lib'
> | UNDEF_SYM=`arm-poky-linux-gnueabi-objdump -x board/omap3evm/libomap3evm.a
> common/libcommon.a cpu/omap3/libomap3.a disk/libdisk.a drivers/libdrivers.a
> fs/fat/libfat.a lib/libarm.a |sed  -n -e
> 's/.*\(__u_boot_cmd_.*\)/-u\1/p'|sort|uniq`;\
> |     cd
> /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git &&
> arm-poky-linux-gnueabi-ld -Bstatic -T
> /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/git/board/omap3evm/x-load.lds
> -Ttext 0x40200800  $UNDEF_SYM cpu/omap3/start.o \
> |         --start-group board/omap3evm/libomap3evm.a common/libcommon.a
> cpu/omap3/libomap3.a disk/libdisk.a drivers/libdrivers.a fs/fat/libfat.a
> lib/libarm.a --end-group -L . -lgcc \
> |         -Map x-load.map -o x-load
> | arm-poky-linux-gnueabi-ld: cannot find -lgcc
> | ERROR: oe_runmake failed
> | Makefile:163: recipe for target 'x-load' failed
> | make: *** [x-load] Error 1
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /poky/build/tmp/work/omap3evm-poky-linux-gnueabi/x-load/1_1.5.1-r3/temp/log.do_compile.25161)
> ERROR: Task (/poky/meta-ti/recipes-bsp/x-load/x-load_git.bb:do_compile)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 431 tasks of which 125 didn't need to be
> rerun and 1 failed.
> 
> Summary: 1 task failed:
>   /poky/meta-ti/recipes-bsp/x-load/x-load_git.bb:do_compile
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> 
> I'm fairly new to Embedded Linux and the Yocto Project, so I fear I might
> be missing something very basic. I'd be happy to provide any additional
> information.

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


