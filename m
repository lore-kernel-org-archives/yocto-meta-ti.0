Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94151E00292
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2012 06:00:40 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBZ00AWSLGA5K80@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 16 Oct 2012 08:00:11 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C4311201C0; Tue,
	16 Oct 2012 09:00:10 -0400 (EDT)
Date: Tue, 16 Oct 2012 09:00:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-id: <20121016130010.GA5662@denix.org>
References: <507C1073.3060703@communistcode.co.uk>
	<CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
	<507D1961.7080907@communistcode.co.uk>
MIME-version: 1.0
In-reply-to: <507D1961.7080907@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: u-boot compile failure
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
X-List-Received-Date: Tue, 16 Oct 2012 13:00:40 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Oct 16, 2012 at 09:22:57AM +0100, Jack Mitchell wrote:
> On 16/10/12 02:20, Tom Rini wrote:
> >On Mon, Oct 15, 2012 at 6:32 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> >>It seems that u-boot is attempting to use GCC includes from my host system
> >>here. This surely isn't right is it?
> >There are host tools to build.  That said, from the log it looks like
> >you have been trying to build this a few times.  If you bitbake -c
> >clean u-boot do you still see the problem?
> >
> I get the error[1] after the -c clean.
> 
> I think I know what it is, that I upgraded my host distro yesterday
> which pulled in a new GCC and the old GCC libraries are still in the
> path. However, bitbake shouldn't be going into the host system for
> includes should it? Shouldn't it use it's own compiled GCC and
> associated libraries to generate the u-boot tools rather than rely
> on whatever is present on my host system, or am I missing something?
> I'm pretty sure a reboot would sort it out but I didn't want to kill
> a failure case.

Jack,

It's not u-boot that fails for you, it's u-boot-mkimage-native - it's a host 
tool to generate u-boot images, so it runs on your host and hence is built 
with your host compiler. OE/Yocto usually builds bunch of host tools and they 
have the "-native" suffix in their names. Upgradig your host system w/o 
switching profiles or changing paths is a common issue in such cases.

-- 
Denys


> Regards,
> 
> [1]
> 
> [jack@archHP R0005]$ bitbake -c clean u-boot
> WARNING: Host distribution could not be determined; you may possibly
> experience unexpected failures. It is recommended that you use a
> tested distribution.
> Parsing recipes: 100% |#########################################|
> Time: 00:00:17
> Parsing of 897 .bb files complete (0 cached, 897 parsed). 1206
> targets, 60 skipped, 8 masked, 0 errors.
> 
> Build Configuration:
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beaglebone"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3+snapshot-20121016"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "master:83448c4b318ce60a54aae24a9a247456fa94caaf"
> meta-ti           = "master:2a3c7305fb81967d1358e731fb564182480b0338"
> meta-db           = "master:4dbfea5ae4acf397d4e28a3b164860f4c8064801"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing RunQueue Tasks
> NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be
> rerun and all succeeded.
> 
> Summary: There was 1 WARNING message shown.
> [jack@archHP R0005]$ bitbake core-image-db
> WARNING: Host distribution could not be determined; you may possibly
> experience unexpected failures. It is recommended that you use a
> tested distribution.
> Loading cache: 100% |###########################################|
> ETA:  00:00:00
> Loaded 1207 entries from dependency cache.
> 
> Build Configuration:
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beaglebone"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3+snapshot-20121016"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "master:83448c4b318ce60a54aae24a9a247456fa94caaf"
> meta-ti           = "master:2a3c7305fb81967d1358e731fb564182480b0338"
> meta-db           = "master:4dbfea5ae4acf397d4e28a3b164860f4c8064801"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Function failed: do_compile (see /home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.8359
> for further information)
> ERROR: Logfile of failure stored in: /home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.8359
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 9 HOSTCC=gcc  HOSTLD=ld HOSTLDFLAGS=-L/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib
> -L/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath-link,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath-link,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib -Wl,-rpath,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib -Wl,-rpath,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib
> -Wl,-O1 HOSTSTRIP=true tools
> | make -C tools all
> | make[1]: Entering directory `/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/u-boot-2011.06/tools'
> | make[1]: *** No rule to make target
> `/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include/stddef.h',
> needed by `crc32.o'.  Stop.
> | make[1]: Leaving directory `/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/u-boot-2011.06/tools'
> | make: *** [tools] Error 2
> | ERROR: oe_runmake failed
> | ERROR: Function failed: do_compile (see /home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.8359
> for further information)
> ERROR: Task 1688 (virtual:native:/home/jack/Projects/poky-r0005/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb,
> do_compile) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 757 tasks of which 742 didn't need to
> be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
> virtual:native:/home/jack/Projects/poky-r0005/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb,
> do_compile
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> [jack@archHP R0005]$
> 
> 
> -- 
> 
>   Jack Mitchell (jack@embed.me.uk)
>   Embedded Systems Engineer
>   http://www.embed.me.uk
> 
> --
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

