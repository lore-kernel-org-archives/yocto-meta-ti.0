Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA8D8E013A7
	for <meta-ti@yoctoproject.org>; Sun, 11 Aug 2013 11:28:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7BIRtXi032145;
	Sun, 11 Aug 2013 13:27:55 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7BIRtnW013362;
	Sun, 11 Aug 2013 13:27:55 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 11 Aug 2013 13:27:55 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7BIRtf4030459;
	Sun, 11 Aug 2013 13:27:55 -0500
Date: Sun, 11 Aug 2013 14:27:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Prathamesh P Ghanekar <prathamesh.ghanekar@igate.com>
Message-ID: <20130811182754.GA28453@edge>
References: <2BC3ECFBDE78594E858F96993713F3F9011FA5E2@IGTEMUMMB11.igatecorp.com>
MIME-Version: 1.0
In-Reply-To: <2BC3ECFBDE78594E858F96993713F3F9011FA5E2@IGTEMUMMB11.igatecorp.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: unable to fetch a repository mentioned in SRC_URI
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
X-List-Received-Date: Sun, 11 Aug 2013 18:28:03 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 06, 2013 at 11:43:08AM +0000, Prathamesh P Ghanekar wrote:
> Hello,
> 
> I am trying to integrate meta-ti layer into the current yocto project. I 
> wish to build the image for pandaboard.
> 
> I am adding another layer called meta-ivi in the yocto kernel which provided 
> functionality for in-vehicle infotainment systems. In the meta-ivi layer, 
> there is a recipe "foton-image", which builds GENIVI compliant baseline 
> image. Also, few recipes were masked to resolve the license issue.
> 
> So, setting all the variables in the conf/local.conf and conf/bblayers.conf 
> file, I build the image as follows.
> 
> 
> è bitbake foton-image
> 
> 
> I ended up with following error, which indicates that there's a failure in fetching the repository.
> 
> Here is the output log for your reference:
> 
> prathamesh@mintos ~/workdir/poky-dylan-9.0.1/build $ bitbake foton-image
> Loading cache: 100% |###################################################################################################################################| ETA:  00:00:00
> Loaded 1220 entries from dependency cache.
> 
> Build Configuration:
> BB_VERSION        = "1.18.0"
> BUILD_SYS         = "i686-linux"
> NATIVELSBSTRING   = "LinuxMint-14"
> TARGET_SYS        = "arm-oe-linux-gnueabi"
> MACHINE           = "pandaboard"
> DISTRO            = "poky-ivi-systemd"
> DISTRO_VERSION    = "4.0.2"
> TUNE_FEATURES     = "armv7a vfp neon"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto
> meta-yocto-bsp
> meta-ivi-4.0.2    = "<unknown>:<unknown>"
> meta-ti           = "master:c14c386946e1ea341faeea292580e37d538d645d"
> 
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for u-boot (u-boot, u-boot-ti-staging)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
> NOTE: Preparing runqueue
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487>, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> Cloning into bare repository '/home/prathamesh/workdir/poky-dylan-9.0.1/build/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git'...
> 
> fatal: The remote end hung up unexpectedly
> fatal: early EOF
> fatal: index-pack failed

It seems you had your connection terminated unexpectedly... Have you tried it 
again? Does it happen every time?
BTW, seems to work fine here...


> ERROR: Function failed: Fetcher failure for URL: 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487>'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/prathamesh/workdir/poky-dylan-9.0.1/build/tmp-eglibc-eglibc/work/pandaboard-oe-linux-gnueabi/linux-omap4/3.4-r0/temp/log.do_fetch.4257
> ERROR: Task 910 (/home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 2323 tasks of which 2231 didn't need to be rerun and 1 failed.
> Waiting for 0 running tasks to finish:
> 
> Summary: 1 task failed:
>   /home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> Note:
> 1. I have successfully built the foton-image for target vexpressa9, and it 
> boots without any errors in the qemu emulator.
> 2. I am able to 'git clone' the above mentioned repository. If you could let 
> me know how can I use the local repository for build process. I tried 
> copying the repository in downloads folder, but it did not work somehow.

You need to get a bare repository and place it into:
downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git

-- 
Denys

