Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96632E003E2
	for <meta-ti@yoctoproject.org>; Sat, 17 Aug 2013 08:02:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7HF2r5r006988;
	Sat, 17 Aug 2013 10:02:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7HF2rfu006512;
	Sat, 17 Aug 2013 10:02:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 17 Aug 2013 10:02:53 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7HF2qe6026273;
	Sat, 17 Aug 2013 10:02:53 -0500
Date: Sat, 17 Aug 2013 11:02:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Christian Gagneraud <chgans@gna.org>
Message-ID: <20130817150252.GE4931@edge>
References: <2BC3ECFBDE78594E858F96993713F3F9011FA5E2@IGTEMUMMB11.igatecorp.com>
	<20130811182754.GA28453@edge> <520BE875.8030005@gna.org>
	<20130814192941.GB1027@edge>
	<321768C95D21724485BCE784F1BE98473EB97023@DBDE04.ent.ti.com>
	<520DA703.3030000@gna.org>
MIME-Version: 1.0
In-Reply-To: <520DA703.3030000@gna.org>
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
X-List-Received-Date: Sat, 17 Aug 2013 15:02:59 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Aug 16, 2013 at 04:13:55PM +1200, Christian Gagneraud wrote:
> On 16/08/13 15:09, Sundareson, Prabindh wrote:
> >Is this resolved - were you able to generate the image ? I seem to be having a similar issue,
> 
> Sorry to hijack the thread, but on top of GIT problems last time, I
> had another similar issue this morning with SVN (svn://gcc.gnu.org/svn/gcc/branches;module=gcc-4_5-branch;protocol=http),
> not sure if it is related, but it definitely used to work!
> I can checkout this branch manually, but inside bitbake it fails,
> the checkout is really done, but subversion returns with an error
> code, I suspect that this error code should be considered a warning
> (since the code has been checked out!).
> It could potentially be a problem with gnome-keyring and pkcs#11
> stuff as well (Ubuntu 13.04 "upgraded" to KUbuntu 13.04). I tried
> the "password-stores=" option in the [auth] section of
> ~/.subversion/config, but it didn't do the trick.

Do you know the type of proxy you are using? Did you make changes to the 
~/.subversion/servers file to specify the proxy setup?

-- 
Denys


> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> >Sent: Thursday, August 15, 2013 1:00 AM
> >To: Christian Gagneraud
> >Cc: meta-ti@yoctoproject.org
> >Subject: Re: [meta-ti] unable to fetch a repository mentioned in SRC_URI
> >
> >On Thu, Aug 15, 2013 at 08:28:37AM +1200, Christian Gagneraud wrote:
> >>On 08/12/2013 06:27 AM, Denys Dmytriyenko wrote:
> >>>On Tue, Aug 06, 2013 at 11:43:08AM +0000, Prathamesh P Ghanekar wrote:
> >>>>Hello,
> >>>>
> >>>>I am trying to integrate meta-ti layer into the current yocto
> >>>>project. I wish to build the image for pandaboard.
> >>>>
> >>>>I am adding another layer called meta-ivi in the yocto kernel which
> >>>>provided functionality for in-vehicle infotainment systems. In the
> >>>>meta-ivi layer, there is a recipe "foton-image", which builds GENIVI
> >>>>compliant baseline image. Also, few recipes were masked to resolve the license issue.
> >>>>
> >>>>So, setting all the variables in the conf/local.conf and
> >>>>conf/bblayers.conf file, I build the image as follows.
> >>>>
> >>>>
> >>>>è bitbake foton-image
> >>>>
> >>>>
> >>>>I ended up with following error, which indicates that there's a failure in fetching the repository.
> >>>>
> >>>>Here is the output log for your reference:
> >>>>
> >>>>prathamesh@mintos ~/workdir/poky-dylan-9.0.1/build $ bitbake
> >>>>foton-image Loading cache: 100%
> >>>>|###################################################################################################################################| ETA:  00:00:00 Loaded 1220 entries from dependency cache.
> >>>>
> >>>>Build Configuration:
> >>>>BB_VERSION        = "1.18.0"
> >>>>BUILD_SYS         = "i686-linux"
> >>>>NATIVELSBSTRING   = "LinuxMint-14"
> >>>>TARGET_SYS        = "arm-oe-linux-gnueabi"
> >>>>MACHINE           = "pandaboard"
> >>>>DISTRO            = "poky-ivi-systemd"
> >>>>DISTRO_VERSION    = "4.0.2"
> >>>>TUNE_FEATURES     = "armv7a vfp neon"
> >>>>TARGET_FPU        = "vfp-neon"
> >>>>meta
> >>>>meta-yocto
> >>>>meta-yocto-bsp
> >>>>meta-ivi-4.0.2    = "<unknown>:<unknown>"
> >>>>meta-ti           = "master:c14c386946e1ea341faeea292580e37d538d645d"
> >>>>
> >>>>NOTE: Resolving any missing task queue dependencies
> >>>>NOTE: multiple providers are available for u-boot (u-boot,
> >>>>u-boot-ti-staging)
> >>>>NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
> >>>>NOTE: Preparing runqueue
> >>>>NOTE: Executing SetScene Tasks
> >>>>NOTE: Executing RunQueue Tasks
> >>>>WARNING: Failed to fetch URL
> >>>>git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protoco
> >>>>l=git;branch=ti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/inte
> >>>>gration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487>,
> >>>>attempting MIRRORS if available
> >>>>ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
> >>>>Cloning into bare repository '/home/prathamesh/workdir/poky-dylan-9.0.1/build/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git'...
> >>>>
> >>>>fatal: The remote end hung up unexpectedly
> >>>>fatal: early EOF
> >>>>fatal: index-pack failed
> >>>It seems you had your connection terminated unexpectedly... Have you
> >>>tried it again? Does it happen every time?
> >>>BTW, seems to work fine here...
> >>
> >>I ran into similar problems recently (strange git failure), but as I
> >>didn't have strong need to build new stuff, I simply gave up straight
> >>away and switched to another task.
> >>The only "odd" thing I have here, is a *@#$! proxy. I am located in
> >>New Zealand.
> >
> >And some of our engineers are having weird issues with the proxy as well.
> >Probably a moon phase... :)
> >
> >--
> >Denys
> >
> >
> >>>>ERROR: Function failed: Fetcher failure for URL: 'git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=git;branch=ti-ubuntu-3.4-1487>'. Unable to fetch URL from any source.
> >>>>ERROR: Logfile of failure stored in: /home/prathamesh/workdir/poky-dylan-9.0.1/build/tmp-eglibc-eglibc/work/pandaboard-oe-linux-gnueabi/linux-omap4/3.4-r0/temp/log.do_fetch.4257
> >>>>ERROR: Task 910 (/home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch) failed with exit code '1'
> >>>>NOTE: Tasks Summary: Attempted 2323 tasks of which 2231 didn't need to be rerun and 1 failed.
> >>>>Waiting for 0 running tasks to finish:
> >>>>
> >>>>Summary: 1 task failed:
> >>>>   /home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch
> >>>>Summary: There was 1 WARNING message shown.
> >>>>Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> >>>>
> >>>>Note:
> >>>>1. I have successfully built the foton-image for target vexpressa9, and it
> >>>>boots without any errors in the qemu emulator.
> >>>>2. I am able to 'git clone' the above mentioned repository. If you could let
> >>>>me know how can I use the local repository for build process. I tried
> >>>>copying the repository in downloads folder, but it did not work somehow.
> >>>You need to get a bare repository and place it into:
> >>>downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git
> >>>
> >>
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> >
> 

