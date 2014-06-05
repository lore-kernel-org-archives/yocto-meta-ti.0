Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DA8CE00B88; Thu,  5 Jun 2014 08:39:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF963E00A44
	for <meta-ti@yoctoproject.org>; Thu,  5 Jun 2014 08:39:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s55FdjNh003611
	for <meta-ti@yoctoproject.org>; Thu, 5 Jun 2014 10:39:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55FdiYX018914
	for <meta-ti@yoctoproject.org>; Thu, 5 Jun 2014 10:39:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Jun 2014 10:39:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55FdiLl008871;
	Thu, 5 Jun 2014 10:39:44 -0500
Date: Thu, 5 Jun 2014 11:39:44 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20140605153943.GV21819@edge>
References: <1400264234-24709-1-git-send-email-sam.nelson@ti.com>
	<20140516185046.GD18053@edge>
MIME-Version: 1.0
In-Reply-To: <20140516185046.GD18053@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] cmem: Update to new version of cmem 4.0.2.11
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
X-List-Received-Date: Thu, 05 Jun 2014 15:39:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 16, 2014 at 02:50:46PM -0400, Denys Dmytriyenko wrote:
> On Fri, May 16, 2014 at 02:17:14PM -0400, Sam Nelson wrote:
> > - updated PR prefix to be common
> 
> That's not how you do it.

Sam,

Just to remind you that this is still an issue and it will block accepting it 
to meta-ti.


> The -mod part will work, although the PR would need to be bumped in the .inc 
> file, not the mod.
> 
> But the main cmem recipe will change from -r0+gitr... to -b+gitr...

Specifically, the above would make the versioning go backwards, if PV is not 
updated.


> Historically, we used PRINC or INC_PR mechanisms. Either of those, as well as 
> PR on its own, are no going away. Unfortunately, you are still staying with 
> Dylan, so it may be still possible to use one of the PRINC or INC_PR...

Just as an example, please look at the discussion we had about one of recent 
Franklin's patches that uses INC_PR and PR updates:

http://thread.gmane.org/gmane.linux.embedded.yocto.meta-arago/2365/focus=2412

Also, once you migrate off of Dylan, we should stop bothering with PR bumps 
and use PR service...

-- 
Denys


> > - Updated license file checksum
> > - Updated SRCREV commit Id
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-bsp/cmem/cmem-mod_git.bb |    2 +-
> >  recipes-bsp/cmem/cmem.inc        |    8 +++++---
> >  recipes-bsp/cmem/cmem_git.bb     |    2 +-
> >  3 files changed, 7 insertions(+), 5 deletions(-)
> > 
> > diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
> > index 2bdf9c0..f926fef 100644
> > --- a/recipes-bsp/cmem/cmem-mod_git.bb
> > +++ b/recipes-bsp/cmem/cmem-mod_git.bb
> > @@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
> >  include cmem.inc
> >  
> >  # This package builds a kernel module, use kernel PR as base and append a local
> > -MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "${CMEM_PR_PREFIX}+gitr${SRCPV}"
> >  PR = "${MACHINE_KERNEL_PR}"
> >  
> >  inherit module
> > diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
> > index 7927839..ef57bb5 100644
> > --- a/recipes-bsp/cmem/cmem.inc
> > +++ b/recipes-bsp/cmem/cmem.inc
> > @@ -1,11 +1,13 @@
> >  HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
> >  
> >  LICENSE = "GPLv2"
> > -LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=b86138d4028fb8310b3b983024edc620"
> > +LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
> >  
> >  BRANCH ?= "master"
> > -# This corresponds to version 4.00.01.08
> > -SRCREV = "0b68dfe9f155a1978cdb2178e052dc0d6f1e705b"
> > +# This corresponds to version 4.00.02.11
> > +SRCREV = "317792d2c18c1144401e2aee689aadebbd3a9b12"
> > +CMEM_PR_PREFIX = "b"
> > +PV="4.0.2.11"
> >  
> >  SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
> >  
> > diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
> > index b633d74..2382451 100644
> > --- a/recipes-bsp/cmem/cmem_git.bb
> > +++ b/recipes-bsp/cmem/cmem_git.bb
> > @@ -4,7 +4,7 @@ include cmem.inc
> >  
> >  RDEPENDS_${PN} = "cmem-mod"
> >  
> > -PR = "r0+gitr${SRCPV}"
> > +PR = "${CMEM_PR_PREFIX}+gitr${SRCPV}"
> >  
> >  PACKAGES =+ "${PN}-test"
> >  
> > -- 
> > 1.7.9.5
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

