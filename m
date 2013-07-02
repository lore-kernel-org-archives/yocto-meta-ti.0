Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8620CE013B0
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 08:42:05 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62Fg5qf023497
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 10:42:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62Fg5H2014138
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2013 10:42:05 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 2 Jul 2013 10:42:05 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r62Fg5ap008292;
	Tue, 2 Jul 2013 10:42:05 -0500
Date: Tue, 2 Jul 2013 11:42:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Siddharth Heroor <heroor@ti.com>
Message-ID: <20130702154204.GF4941@edge>
References: <20130701082139.GA3378@ti.com>
 <20130702153552.GE4941@edge>
MIME-Version: 1.0
In-Reply-To: <20130702153552.GE4941@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] recipes-kernel: Update to latest fixes on the glsdk staging tree
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
X-List-Received-Date: Tue, 02 Jul 2013 15:42:08 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 02, 2013 at 11:35:52AM -0400, Denys Dmytriyenko wrote:
> On Mon, Jul 01, 2013 at 01:51:39PM +0530, Siddharth Heroor wrote:
> > * Fixes for USB, SATA and enables GPU (omapdrm).
> > * Fix OMAP5 LDO1 value.
> > 
> > Signed-off-by: Siddharth Heroor <heroor@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > index 2746188..bfcaf3a 100644
> > --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> > @@ -20,7 +20,7 @@ S = "${WORKDIR}/git"
> >  
> >  BRANCH = "master"
> >  
> > -SRCREV = "4e8193eb3b7465d7f67cd8c7e6c2ed99dad1a483"
> > +SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
> 
> You forgot to bump the MACHINE_KERNEL_PR...

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3075e004978b981bf6cfa6c66f84115659644395


> >  PV = "3.8.13"
> >  
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> > -- 
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

