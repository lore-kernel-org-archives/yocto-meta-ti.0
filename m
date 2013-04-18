Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EE90E0140A
	for <meta-ti@yoctoproject.org>; Thu, 18 Apr 2013 13:11:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3IKBRCI009368;
	Thu, 18 Apr 2013 15:11:27 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3IKBRPc019743;
	Thu, 18 Apr 2013 15:11:27 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 18 Apr 2013 15:11:26 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3IKBQ1e015038;
	Thu, 18 Apr 2013 15:11:26 -0500
Date: Thu, 18 Apr 2013 16:11:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ilya Dmitrichenko <errordeveloper@gmail.com>
Message-ID: <20130418201125.GT1518@edge>
References: <CAPhDKbH84Nhitv+DW6Vcaza0VCjx=T_nw+KUcreico0vBsLAwA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPhDKbH84Nhitv+DW6Vcaza0VCjx=T_nw+KUcreico0vBsLAwA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Connection refused to git.ti.com
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
X-List-Received-Date: Thu, 18 Apr 2013 20:11:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 18, 2013 at 09:22:58AM +0100, Ilya Dmitrichenko wrote:
> Hi,
> 
> I am getting this message:
> 
> Build Configuration:
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "beaglebone"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3.1"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto
> meta-yocto-bsp    = "danny:e2ef3200e61af33ec71e34fb7a67cbcdd68dc981"
> meta-ti           = "danny:8f7d03e4a1e87c5b32c413f50e362280d8e6928a"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL
> git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-linux-3.8.y,
> attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> Cloning into bare repository
> '/home/ilya/beaglebone-dany/build/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
> 
> fatal: unable to connect to git.ti.com:
> git.ti.com[0: 198.47.29.193]: errno=Connection refused
> 
> 
> ERROR: Function failed: Fetcher failure for URL:
> 'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-linux-3.8.y'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/ilya/beaglebone-dany/build/tmp/work/beaglebone-poky-linux-gnueabi/linux-ti-staging-3.8.5-r0/temp/log.do_fetch.2909
> ERROR: Task 669
> (/home/ilya/beaglebone-dany/meta-ti/recipes-kernel/linux/linux-ti-staging_3.8.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 584 tasks of which 556 didn't need to
> be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /home/ilya/beaglebone-dany/meta-ti/recipes-kernel/linux/linux-ti-staging_3.8.bb,
> do_fetch
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> In the meantime I manage to clone this repo on another machine.
> Seems like a firewall issue, can anyone check?
> 
> I have retried to bitbake this multiple times over the last 12 hours
> and did try to run git clone manually from the same machine:
> git clone git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
> Cloning into 'ti-linux-kernel'...
> fatal: unable to connect to git.ti.com:
> git.ti.com[0: 198.47.29.193]: errno=Connection refused
> 
> It worked from another machine however.
> 
> Another thing I have tried is cloning a repo from elsewhere using
> git:// protocol and it worked. This protocol uses port 9418, so I
> checked connectivity using telnet. It failed to open connection for
> git.ti.com and worked fine for github.com. So port 9418 is not
> firewalled on our end.
> 
> Let me whatever else you want me to test.

That's quite strange that you can clone from one machine and always get 
connection refused from another.

You can share the cloned repositories betweenn machines by copying 
$DL_DIR/git2/git.ti.com.*

-- 
Denys

