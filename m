Return-Path: <ml@communistcode.co.uk>
Received: from eumx.net (eumx.net [91.82.101.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E32E9E00292
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2012 01:21:09 -0700 (PDT)
Received: from localhost ([127.0.0.1]:53874 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TO2Of-00040s-DP; Tue, 16 Oct 2012 08:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:cc:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=default;
	bh=zQK6mLNNWhyEAay+hUwd5UJqvB4=; b=hZfz4y+EmO9HocYmtB+Iio2u06HN
	xTQaji35IxGajbFrTK02q9by+Imwwb7LyllsCaUcR7h6GK6WqB5eDI+Ur5vCe6AX
	aaTnJsaIaxnZvLZjNOZy41CG4zbYtOeuCwvubHw6uttz/MNPLBDqD/e/FIndnqz6
	/H+E/FEKpWrHJ04=
Received: from [195.171.99.130] (port=15172 helo=[192.168.0.75])
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TO2Of-00040p-9j; Tue, 16 Oct 2012 08:21:05 +0000
Message-ID: <507D1961.7080907@communistcode.co.uk>
Date: Tue, 16 Oct 2012 09:22:57 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121012 Thunderbird/16.0.1
MIME-Version: 1.0
To: Tom Rini <tom.rini@gmail.com>
References: <507C1073.3060703@communistcode.co.uk>
	<CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
In-Reply-To: <CA+M6bXmNfA8D0tpXb25C5jOKDgs6LsTeph=cdhNBo215S0xVsQ@mail.gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: u-boot compile failure
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Oct 2012 08:21:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 16/10/12 02:20, Tom Rini wrote:
> On Mon, Oct 15, 2012 at 6:32 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> It seems that u-boot is attempting to use GCC includes from my host system
>> here. This surely isn't right is it?
> There are host tools to build.  That said, from the log it looks like
> you have been trying to build this a few times.  If you bitbake -c
> clean u-boot do you still see the problem?
>
I get the error[1] after the -c clean.

I think I know what it is, that I upgraded my host distro yesterday 
which pulled in a new GCC and the old GCC libraries are still in the 
path. However, bitbake shouldn't be going into the host system for 
includes should it? Shouldn't it use it's own compiled GCC and 
associated libraries to generate the u-boot tools rather than rely on 
whatever is present on my host system, or am I missing something? I'm 
pretty sure a reboot would sort it out but I didn't want to kill a 
failure case.

Regards,

[1]

[jack@archHP R0005]$ bitbake -c clean u-boot
WARNING: Host distribution could not be determined; you may possibly 
experience unexpected failures. It is recommended that you use a tested 
distribution.
Parsing recipes: 100% |#########################################| Time: 
00:00:17
Parsing of 897 .bb files complete (0 cached, 897 parsed). 1206 targets, 
60 skipped, 8 masked, 0 errors.

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20121016"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:83448c4b318ce60a54aae24a9a247456fa94caaf"
meta-ti           = "master:2a3c7305fb81967d1358e731fb564182480b0338"
meta-db           = "master:4dbfea5ae4acf397d4e28a3b164860f4c8064801"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing RunQueue Tasks
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be 
rerun and all succeeded.

Summary: There was 1 WARNING message shown.
[jack@archHP R0005]$ bitbake core-image-db
WARNING: Host distribution could not be determined; you may possibly 
experience unexpected failures. It is recommended that you use a tested 
distribution.
Loading cache: 100% |###########################################| ETA:  
00:00:00
Loaded 1207 entries from dependency cache.

Build Configuration:
BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20121016"
TUNE_FEATURES     = "armv7a vfp neon cortexa8"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:83448c4b318ce60a54aae24a9a247456fa94caaf"
meta-ti           = "master:2a3c7305fb81967d1358e731fb564182480b0338"
meta-db           = "master:4dbfea5ae4acf397d4e28a3b164860f4c8064801"

NOTE: Resolving any missing task queue dependencies
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: Function failed: do_compile (see 
/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.8359 
for further information)
ERROR: Logfile of failure stored in: 
/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.8359
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 9 HOSTCC=gcc  HOSTLD=ld 
HOSTLDFLAGS=-L/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib 
-L/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib 
-Wl,-rpath-link,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib 
-Wl,-rpath-link,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib 
-Wl,-rpath,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/usr/lib 
-Wl,-rpath,/home/jack/Projects/poky-r0005/R0005/tmp/sysroots/x86_64-linux/lib 
-Wl,-O1 HOSTSTRIP=true tools
| make -C tools all
| make[1]: Entering directory 
`/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/u-boot-2011.06/tools'
| make[1]: *** No rule to make target 
`/usr/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/include/stddef.h', needed 
by `crc32.o'.  Stop.
| make[1]: Leaving directory 
`/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/u-boot-2011.06/tools'
| make: *** [tools] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (see 
/home/jack/Projects/poky-r0005/R0005/tmp/work/x86_64-linux/u-boot-mkimage-native-2011.06-r0/temp/log.do_compile.8359 
for further information)
ERROR: Task 1688 
(virtual:native:/home/jack/Projects/poky-r0005/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb, 
do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 757 tasks of which 742 didn't need to be 
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
virtual:native:/home/jack/Projects/poky-r0005/meta/recipes-bsp/u-boot/u-boot-mkimage_2011.06.bb, 
do_compile
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.
[jack@archHP R0005]$


-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


