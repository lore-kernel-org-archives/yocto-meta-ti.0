Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16521C3DA49
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 18:25:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.11245.1721499953194215996
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 20 Jul 2024 11:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7641740C16;
	Sat, 20 Jul 2024 18:25:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0joLTb3v-xO8; Sat, 20 Jul 2024 18:25:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 94A3740B66;
	Sat, 20 Jul 2024 18:25:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 882FC164001; Sat, 20 Jul 2024 14:25:47 -0400 (EDT)
Date: Sat, 20 Jul 2024 14:25:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH] libulm: Fix "buildpaths" QA error
Message-ID: <20240720182547.GR17572@denix.org>
References: <20240719203603.21930-1-reatmon@ti.com>
 <17E3FDCA0923C85A.21127@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17E3FDCA0923C85A.21127@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 20 Jul 2024 18:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17901

On Sat, Jul 20, 2024 at 02:02:01PM -0400, Denys Dmytriyenko wrote:
> On Fri, Jul 19, 2024 at 03:36:03PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> > The TI cl6x compiler does not have a mechanism for replacing paths in
> > the obj files it creates.  So replace the string we want to remove with
> > an equally sized replacement string that does not contain the path.
> > 
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> >  ...m-makefile-Fix-reproducibility-error.patch | 31 +++++++++++++++++++
> >  .../recipes-bsp/dsptop/libulm_git.bb          | 12 +++++--
> >  2 files changed, 41 insertions(+), 2 deletions(-)
> >  create mode 100644 meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch
> > 
> > diff --git a/meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch b/meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch
> > new file mode 100644
> > index 00000000..6ea59517
> > --- /dev/null
> > +++ b/meta-ti-extras/recipes-bsp/dsptop/files/0001-dstop-ulm-makefile-Fix-reproducibility-error.patch
> > @@ -0,0 +1,31 @@
> > +From 8619e4b2f983130bf1909cc9c9bc238cd43ded41 Mon Sep 17 00:00:00 2001
> > +From: Ryan Eatmon <reatmon@ti.com>
> > +Date: Fri, 19 Jul 2024 14:37:55 -0500
> > +Subject: [master][PATCH] dstop/ulm/makefile: Fix reproducibility error
> > +
> > +The TI cl6x compiler does not have a mechanism for replacing paths in
> > +the obj files it creates.  So replace the string we want to remove with
> > +an equally sized replacement string that does not contain the path.
> > +
> > +Upstream-Status: Inappropriate [OE-specific]
> > +
> > +Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > +---
> > + makefile | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/makefile b/makefile
> > +index dffb211..586dcc2 100644
> > +--- a/makefile
> > ++++ b/makefile
> > +@@ -82,6 +82,7 @@ $(OBJDIR)/%.obj: %.c $(INCLUDE_FILES)
> > + 	@echo "Compiling" $<
> > + 	@mkdir -p $(OBJDIR)
> > + 	$(CC) $(CFLAGS) $(INCLUDE_PATH) -fe $@ $<
> > ++	perl -pi -e 's#${SEARCH}#${REPLACE}#g' $@
> 
> That assumes perl host tool dependency - is it safe? Can this be done with 
> sed instead?

Never mind - I see you have perl-native in DEPENDS.

And for patching binary files perl is definitely better than sed.


> > + libtiulm.a libtiulm.ae66: $(OBJECTS)
> > + 	@echo "Building target" $@
> > +-- 
> > +2.17.1
> > +
> > diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
> > index 6a2cde30..aafae21f 100644
> > --- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
> > +++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
> > @@ -6,7 +6,7 @@ inherit features_check
> >  
> >  REQUIRED_MACHINE_FEATURES = "dsp"
> >  
> > -DEPENDS = "ti-cgt6x-native"
> > +DEPENDS = "ti-cgt6x-native perl-native"
> >  PR = "${INC_PR}.0"
> >  
> >  S = "${WORKDIR}/git/dsptop/ulm"
> > @@ -14,7 +14,13 @@ S = "${WORKDIR}/git/dsptop/ulm"
> >  DEVICE=""
> >  DEVICE:dra7xx = "DRA7xx"
> >  
> > -EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
> > +EXTRA_OEMAKE = " \
> > +    release \
> > +    DEVICE=${DEVICE} \
> > +    CROSS_COMPILE=${TARGET_PREFIX} \
> > +    SEARCH=${WORKDIR} \
> > +    REPLACE=${@'_'*(len(d.getVar('WORKDIR'))-7)+"workdir"} \
> > +"
> >  
> >  do_compile() {
> >      oe_runmake arm XPORT_ONLY CC="${CC}"
> > @@ -40,6 +46,8 @@ FILES:${PN}-dev += "\
> >  
> >  include dsptop.inc
> >  
> > +SRC_URI += "file://0001-dstop-ulm-makefile-Fix-reproducibility-error.patch"
> > +
> >  ALLOW_EMPTY:${PN} = "1"
> >  
> >  PARALLEL_MAKE= ""
> > -- 
> > 2.17.1

