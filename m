Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B92BAE01565
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 12:17:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RJHn8e008412
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 14:17:49 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RJHnY4012735
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 14:17:49 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 27 Jun 2013 14:17:49 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5RJHmNg014667;
	Thu, 27 Jun 2013 14:17:49 -0500
Date: Thu, 27 Jun 2013 15:17:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130627191748.GD30195@edge>
References: <20130627171636.GA7291@ti.com>
	<7D46E86EC0A8354091174257B2FED1015961D1CF@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015961D1CF@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] libdrm: Add GLSDK specific staging tree for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 19:17:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 27, 2013 at 05:46:43PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> >bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
> >Sent: Thursday, June 27, 2013 12:17 PM
> >To: meta-ti@yoctoproject.org
> >Subject: [meta-ti] [PATCH] libdrm: Add GLSDK specific staging tree
> >for omap-a15
> >
> >* Override SRC_URI to use TI's tree at
> >https://git.ti.com/glsdk/libdrm
> >  This tree includes patches on top of the upstream libdrm for
> >  omap5 and dra7xx class of devices.
> >
> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >---
> > recipes-graphics/drm/libdrm_2.4.41.bb |   15 +++++++++++++++
> > 1 files changed, 15 insertions(+), 0 deletions(-)
> > create mode 100644 recipes-graphics/drm/libdrm_2.4.41.bb
> >
> >diff --git a/recipes-graphics/drm/libdrm_2.4.41.bb b/recipes-
> >graphics/drm/libdrm_2.4.41.bb
> >new file mode 100644
> >index 0000000..31f7cee
> >--- /dev/null
> >+++ b/recipes-graphics/drm/libdrm_2.4.41.bb
> 
> I thought you were going to bbappend this instead of overlaying the whole 
> recipe.

I was confused at first as well, but I guess it should be fine, considering 
there's no 2.4.41 version to bbapend anyway.


> >@@ -0,0 +1,15 @@
> >+require recipes-graphics/drm/libdrm.inc
> >+
> >+COMPATIBLE_MACHINE = "omap-a15"
> >+
> >+DEFAULT_PREFERENCE = "-1"
> >+
> >+EXTRA_OECONF += "--enable-omap-experimental-api"
> >+
> >+SRC_URI = "git://git.ti.com/glsdk/libdrm.git;protocol=git"
> >+SRCREV = "3cb5405084111193cedb8796d259b56560b088f0"
> >+
> >+# Append to the PR so that a new SRCREV will cause a rebuild
> >+PR_append = "a+gitr${SRCPV}"
> 
> I always had issue with this.  I'm not sure that this statement holds true 
> because whether a new SRCREV will cause a rebuild would depend on whether 
> that SRCREV sorts higher than the old one.  Unless something else has 
> changed.  This is useful though if you want to know what SRCREV was used for 
> a build.

Well, if every time you update SRCREV you also increment the first letter, it 
will work as expected - so the comment is kind of correct... :)


> That being said if you were going to overlay this recipe the PR should be 
> something like
> 
> PR = "${INC_PR}.0"
> 
> Right now you are appending to the default since PR is not defined.  With a 
> bbappend you should append a -arago flag.
> 
> So this comes back to why no bbappend?  Is it because the base version in 
> oe-core is 2.4.39 and not 2.4.41?  Can you not append the _git version of 
> the recipe and update the PV appropriately?
> 
> >+
> >+S = "${WORKDIR}/git"
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-ti mailing list
> >meta-ti@yoctoproject.org
> >https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

