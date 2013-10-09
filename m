Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68EBEE011C5
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 11:09:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r99I93KQ011907;
	Wed, 9 Oct 2013 13:09:03 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99I930S031360;
	Wed, 9 Oct 2013 13:09:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 9 Oct 2013 13:09:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r99I935g013868;
	Wed, 9 Oct 2013 13:09:03 -0500
Date: Wed, 9 Oct 2013 14:09:02 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20131009180902.GB15357@edge>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
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
X-List-Received-Date: Wed, 09 Oct 2013 18:09:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 09, 2013 at 09:10:49AM -0400, Brian Hutchinson wrote:
> Hi,
> 
> I recently was able to get a master checkout of OECore + meta-ti to build
> my custom board kernel using linux-ti81xx-psp_2.6.37.bb.  I tried to make
> the same modifications to a master yocto + meta-ti checkout and when I try
> to build, bitbake absolutely takes forever to build

I have 2 questions:

1. Which bitbake you use when building oe-core+meta-ti? Since Poky comes with 
own copy of bitbake, you may want to compare them.

2. Not that it would affect packaging, but where in bblayer.conf did you add 
meta-ti?

And one more suggestion - you may want to compare classes between oe-core and 
poky/meta to see if there are any big differences, especially in the packaging 
area...

-- 
Denys


> linux-ti81xx-psp_2.6.37.bb and it gets stuck on the do_package.  I finally
> just let it go (hours and hours on a very fast modern machine) and it looks
> like it finally just gave up the ghost and ran out of memory or something.
> I've never seen anything like it.  Anyone seen anything like this before:
> 
> Build Configuration:
> BB_VERSION        = "1.20.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Debian-7.1"
> TARGET_SYS        = "arm-poky-linux-gnueabi"
> MACHINE           = "c6a816x-evm"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.5"
> TUNE_FEATURES     = "armv7a vfp neon"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto
> meta-yocto-bsp    = "master:104166c804e9068d85ccdaa887a33df72c8aeb85"
> meta-ti           = "master:9c36e6c7573c3e68c5816dd04f3dd43f485b0550"
> meta-oe
> meta-networking
> meta-webserver    = "master:8aafddccb03f54923927e9d1c8c80223baf581de"
> 
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: Error executing a python function in
> /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux/
> linux-ti81xx-psp_2.6.37.bb:
> 
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'package_do_filedeps', lineno: 56, function:
> <module>
> 
>      0052:    for pkg in provides_files:
>      0053:        d.setVar("FILERPROVIDESFLIST_" + pkg, "
> ".join(provides_files[pkg]))
>      0054:
>      0055:
>  *** 0056:package_do_filedeps(d)
>      0057:
> File: 'package_do_filedeps', lineno: 25, function: package_do_filedeps
>      0021:
>      0022:    import multiprocessing
>      0023:    nproc = multiprocessing.cpu_count()
>      0024:    pool =  bb.utils.multiprocessingpool(nproc)
>  *** 0025:    processed = list(pool.imap(oe.package.filedeprunner, pkglist))
>      0026:    pool.close()
>      0027:    pool.join()
>      0028:
>      0029:    provides_files = {}
> File: '/usr/lib/python2.7/multiprocessing/pool.py', lineno: 653, function:
> next
>      0649:
>      0650:        success, value = item
>      0651:        if success:
>      0652:            return value
>  *** 0653:        raise value
>      0654:
>      0655:    __next__ = next                    # XXX
>      0656:
>      0657:    def _set(self, i, obj):
> Exception: OSError: [Errno 12] Cannot allocate memory
> 
> ERROR: Function failed: package_do_filedeps
> ERROR: Logfile of failure stored in:
> /home/hutch/yocto_master_wcs_10_4_2013/poky/build/tmp/work/c6a816x_evm-poky-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/temp/log.do_package.12766
> ERROR: Task 200
> (/home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux/
> linux-ti81xx-psp_2.6.37.bb, do_package) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2756 tasks of which 2752 didn't need to be
> rerun and 1 failed.
> No currently running tasks (2023 of 2770)
> 
> Summary: 1 task failed:
>   /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti/recipes-kernel/linux/
> linux-ti81xx-psp_2.6.37.bb, do_package
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


