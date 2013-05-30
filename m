Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39825E014E0
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 20:20:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4U3Kd9r010576
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 22:20:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4U3KdDj004873
	for <meta-ti@yoctoproject.org>; Wed, 29 May 2013 22:20:39 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 29 May 2013 22:20:38 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4U3Kdqc014669;
	Wed, 29 May 2013 22:20:39 -0500
Date: Wed, 29 May 2013 23:20:38 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
Message-ID: <20130530032038.GO4526@edge>
References: <prabu@ti.com> <1368809879-27201-7-git-send-email-prabu@ti.com>
	<20130529211706.GL4526@edge>
	<321768C95D21724485BCE784F1BE98473EB26C20@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB26C20@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 07/10] libgles-omap3: Remove unnecessary inclusion of folders into package
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
X-List-Received-Date: Thu, 30 May 2013 03:20:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 29, 2013 at 11:18:36PM -0400, Sundareson, Prabindh wrote:
> Denys,
> 
> Thanks for reviewing,
> 
> It is a simple correction. I had mistakenly removed it in the first one, and 
> reinstated in the next one after comparing with the original patch-set. Is 
> there anything missing you observe ?

You should probably squash those patches then. Otherwise look fine - I just 
need to diff the first patch in the series against the original. Have you 
tried passing -M to git-format-patch?

-- 
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Thursday, May 30, 2013 2:47 AM
> To: Sundareson, Prabindh
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 07/10] libgles-omap3: Remove unnecessary inclusion of folders into package
> 
> On Fri, May 17, 2013 at 10:27:56PM +0530, Prabindh Sundareson wrote:
> > Inclusion of all .so files is not necessary for the package build.
> > 
> > Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> > ---
> >  recipes-graphics/libgles/libgles-omap3-no-x.inc |    4 ----
> >  1 files changed, 0 insertions(+), 4 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgles/libgles-omap3-no-x.inc 
> > b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > index 8e5dad6..4521d59 100644
> > --- a/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3-no-x.inc
> > @@ -285,10 +285,6 @@ INSANE_SKIP_${PN}-linuxfbwsegl-es6 = "ldflags"
> >  INSANE_SKIP_${PN}-linuxfbwsegl-es8 = "ldflags"
> >  INSANE_SKIP_${PN}-tests = "ldflags"
> >  
> > -# Quality control is really poor on these SDKs, so hack around the latest madness:
> > -FILES_${PN} += "${libdir}/*.so "
> > -FILES_${PN}-dev = "${includedir}"
> 
> I'm confused - you are removing these 2 lines in 7/10 and then immediately re-add them back in 8/10. Why?
> 
> 
> >  inherit update-rc.d
> >  
> >  INITSCRIPT_NAME = "pvr-init"
> > -- 
> > 1.7.1
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

