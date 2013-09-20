Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24407E01602
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2013 14:23:44 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8KLNhuq003866;
	Fri, 20 Sep 2013 16:23:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KLNhXi016097;
	Fri, 20 Sep 2013 16:23:43 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 20 Sep 2013 16:23:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8KLNhBj013412;
	Fri, 20 Sep 2013 16:23:43 -0500
Date: Fri, 20 Sep 2013 17:23:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130920212342.GG30673@edge>
References: <1379710561-16000-1-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C5583FF@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C5583FF@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>, "Murphy,
	Dan" <dmurphy@ti.com>
Subject: Re: [PATCH] linux-ti-staging: bump to 3.12-rc1 with platform-base and PMIC merged
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
X-List-Received-Date: Fri, 20 Sep 2013 21:23:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 20, 2013 at 09:19:33PM +0000, Cooper Jr., Franklin wrote:
> 
> 
> > -----Original Message-----
> > From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
> > Sent: Friday, September 20, 2013 3:56 PM
> > To: meta-ti@yoctoproject.org
> > Cc: Murphy, Dan
> > Subject: [meta-ti] [PATCH] linux-ti-staging: bump to 3.12-rc1 with platform-base
> > and PMIC merged
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Cc: Dan Murphy <DMurphy@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_git.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> > kernel/linux/linux-ti-staging_git.bb
> > index 7d84cc4..694a164 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> > @@ -31,11 +31,11 @@ S = "${WORKDIR}/git"
> > 
> >  BRANCH = "ti-linux-3.12.y"
> > 
> > -SRCREV = "b36f4be3de1b123d8601de062e7dbfc904f305fb"
> > -PV = "3.10+3.11-rc6"
> > +SRCREV = "351da8b4c2ff277b2d816a2108ada357a63fadbe"
> > +PV = "3.11+3.12-rc1"
> [Franklin] What does the 3.11+ mean?

It means it's not 3.12 yet. When 3.12 gets released, the version ordering will 
be completely screwed, if you don't use this syntax, as 3.12-rc1 sorts higher 
than 3.12

-- 
Denys


> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a
> > rebuild -MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
> > +MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
> > 
> >  SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-
> > kernel.git;protocol=git;branch=${BRANCH} \
> >             file://defconfig \
> > --
> > 1.8.3.2
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

