Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88DEEE013CC
	for <meta-ti@yoctoproject.org>; Thu, 22 Mar 2012 13:26:12 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1A00MD9ZEXC8V0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 22 Mar 2012 15:25:51 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C2440201C8; Thu,
	22 Mar 2012 16:25:45 -0400 (EDT)
Date: Thu, 22 Mar 2012 16:25:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-id: <20120322202545.GB13495@denix.org>
References: <ECCB2891-32C1-451D-B469-7B0B632D8641@dominion.thruhere.net>
	<1332365246.9740.195.camel@ted> <20120321214515.GD6857@denix.org>
	<1332367838.9740.208.camel@ted>
	<F83C8961-F16F-4D3F-AF57-8FF4414022F6@dominion.thruhere.net>
	<20120322150716.GA13495@denix.org> <4F6B57CB.5080000@ti.com>
	<1332437646.9740.276.camel@ted> <4F6B6F3F.3080204@ti.com>
	<1332443641.9740.313.camel@ted>
MIME-version: 1.0
In-reply-to: <1332443641.9740.313.camel@ted>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Thu, 22 Mar 2012 20:26:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 22, 2012 at 07:14:01PM +0000, Richard Purdie wrote:
> On Thu, 2012-03-22 at 14:28 -0400, William Mills wrote:
> > On 03/22/2012 01:34 PM, Richard Purdie wrote:
> > > I know Bill understands this but just to be clear for the record, the
> > > only scalable way OE-Core can work is to embrace upstream latest
> > > releases as much as is practicable which is why 4.6 is currently used.
> > > If people need something different *and* step up with resources to
> > > maintain/test it, we can talk about other versions but for anything like
> > > an extra toolchain, we need people to help support it.
> 
> > >> TI will continue to test with and recommend a toolchain that is closely
> > >> aligned with Linaro.  We see no reason customers should have to misalign
> > >> themselves with the ARM ecosystem just to align with poky.
> > 
> > The point is to align with the most number of test hours and test cases 
> > run.  I still maintain that on ARM hardware the Linaro toolchain has 
> > more test hours than a plain vanilla upstream toolchain.
> 
> > > and with 4.7 (out today), we should have a lot of the Linaro fixes,
> > > right so this problem should start solving itself when we update to
> > > 4.7? :)
> > 
> > Yes at this instant in time and the divergence also starts today 
> > (actually a while back due to code freeze etc.)  That is why poky and 
> > any plain upstream toolchain will be an average of 6 to 12 months behind 
> > the current Linaro "best".
> 
> I'd hope that over time, ARM can get its support for new features into
> gcc in a sensible time frame so that the current gcc works well with
> production silicon and isn't 6-12 months behind. I'd like to think the
> current situation will therefore correct itself and not be a permanent
> state.
> 
> In those cases I'd be happy to see gcc patches applied to the OE-Core
> toolchain to address the issues. We already have a pretty good track
> record of dealing with this as far as I know.

Well, in this discussion we keep forgetting that a toolchain is not just gcc, 
it also contains binutils (for things like linker and assembler) as well as 
libc (but this one tends to give some other non-technical issues... :) and I 
know - I spent last 9 months rebuilding, repackaging and otherwise supporting 
our internal build of gcc+linaro based toolchain)

For example, here's what happens when one of our 3.2-based kernels is being 
built with the latest binutils-2.22 from OE-Core:

==================================================
ERROR: Function failed: do_compile (see /OE/yocto/build/arago-tmp-eglibc/work/beaglebone-oe-linux-gnueabi/linux-ti33x-psp-3.2-r0/temp/log.do_compile.430 for further information)
ERROR: Logfile of failure stored in: /OE/yocto/build/arago-tmp-eglibc/work/beaglebone-oe-linux-gnueabi/linux-ti33x-psp-3.2-r0/temp/log.do_compile.430
Log data follows:
| ERROR: Function failed: do_compile (see /OE/yocto/build/arago-tmp-eglibc/work/beaglebone-oe-linux-gnueabi/linux-ti33x-psp-3.2-r0/temp/log.do_compile.430 for further information)
| NOTE: make -j 16 -j 16 include/linux/version.h CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/OE/yocto/build/arago-tmp-eglibc/sysroots/beaglebone LD=arm-oe-linux-gnueabi-ld  --sysroot=/OE/yocto/build/arago-tmp-eglibc/sysroots/beaglebone
|   CHK     include/linux/version.h
| NOTE: make -j 16 -j 16 uImage CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -marm --sysroot=/OE/yocto/build/arago-tmp-eglibc/sysroots/beaglebone LD=arm-oe-linux-gnueabi-ld  --sysroot=/OE/yocto/build/arago-tmp-eglibc/sysroots/beaglebone
|   CHK     include/linux/version.h
|   CHK     include/generated/utsrelease.h
| make[1]: `include/generated/mach-types.h' is up to date.
|   CALL    scripts/checksyscalls.sh
|   CHK     include/generated/compile.h
|   CHK     kernel/config_data.h
|   Kernel: arch/arm/boot/Image is ready
|   AS      arch/arm/boot/compressed/head.o
|   AS      arch/arm/boot/compressed/piggy.lzo.o
|   AS      arch/arm/boot/compressed/lib1funcs.o
| arch/arm/boot/compressed/head.S: Assembler messages:
| arch/arm/boot/compressed/head.S:127: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
| arch/arm/boot/compressed/head.S:134: Error: selected processor does not support requested special purpose register -- `mrs r2,cpsr'
| arch/arm/boot/compressed/head.S:136: Error: selected processor does not support requested special purpose register -- `msr cpsr_c,r2'
| make[2]: *** [arch/arm/boot/compressed/head.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[1]: *** [arch/arm/boot/compressed/vmlinux] Error 2
| make: *** [uImage] Error 2
| ERROR: oe_runmake failed
NOTE: package linux-ti33x-psp-3.2-r0: task do_compile: Failed
ERROR: Task 407 (/OE/yocto/sources/meta-ti/recipes-kernel/linux/linux-ti33x-psp_3.2.bb, do_compile) failed with exit code '1'
==================================================

Works fine when rolled back to binutils-2.20.1 from meta-oe. Something else in 
our components is picky about the version of binutils...


As Bill mentioned earlier, we closely watch Linaro's progress on creating the 
official meta-linaro layer with their latest toolchain for ARM architecture, 
which can be used with OE-Core/Yocto setups.

But they only started this work last month, they only seem to test against 
qemuarm targets, while at the same time being very "aggressive" - i.e. they 
only support ARMv7+ architecture (Cortex-A8/A9/A15), plus with the release of 
gcc-4.7 they plan to switch to that right away, moving 4.6 into maintenance 
mode and dropping support for 4.5...

So, all in all, all current work will end up being supported upstream, as 
that's everyone's goal, but when it gets there, there will always be the next 
big thing that everyone's working on, but it's not yet available upstream...

-- 
Denys

