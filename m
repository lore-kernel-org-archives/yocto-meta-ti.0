Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD69C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 21:39:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.7370.1742333937586410004
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 14:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AE98A40C37;
	Tue, 18 Mar 2025 21:38:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PhJOrWcEPQXT; Tue, 18 Mar 2025 21:38:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8823840A20;
	Tue, 18 Mar 2025 21:38:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E2197164391; Tue, 18 Mar 2025 17:38:53 -0400 (EDT)
Date: Tue, 18 Mar 2025 17:38:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: a-christidis@ti.com, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH v5 3/3] recipes-graphics:
 port gc320 libs to work on kernel 6.12
Message-ID: <20250318213853.GL23729@denix.org>
References: <20250318023836.3507801-1-a-christidis@ti.com>
 <20250318023836.3507801-4-a-christidis@ti.com>
 <9859996f-68b6-485c-86cb-9182c5a5e219@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9859996f-68b6-485c-86cb-9182c5a5e219@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Mar 2025 21:39:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18404

On Tue, Mar 18, 2025 at 04:01:37PM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> On 3/17/25 9:38 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> >From: Antonios Christidis <a-christidis@ti.com>
> >
> >The user mode libraries needed recompiling with the scarthgap revision of gcc to
> >remove all the warnings about 32bit API usage during the linking stage, new
> >SRCREV and branch includes this changes. Versions of the libraries remain the
> >same.
> >
> >Signed-off-by: Antonios Christidis <a-christidis@ti>
> >---
> >v5:
> >- Move the symb link of libGAL.so within the ${PN} package. While making
> >   sure the header files are part of the ${PN}-dev package.
> >
> >v3:
> >- Removed commented lines and extra lib directory that was being created
> >   in do_install()
> >
> >v2:
> >- No longer include withing the PN package /usr/include file and symb
> >   link to library file. This is done by not chaning the FILES/PACKAGES
> >   variables, thus creating a -dev package.
> >
> >  .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> >index 807f421c..6b7226ab 100644
> >--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> >+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> >@@ -11,10 +11,10 @@ COMPATIBLE_MACHINE = "omap-a15"
> >  CLEANBROKEN = "1"
> >-BRANCH = "ti-${PV}"
> >+BRANCH = "ti-${PV}-scarthgap"
> >  SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
> >-SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
> >+SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
> >  RRECOMMENDS:${PN} = "ti-gc320-driver"
> >@@ -43,4 +43,6 @@ do_install() {
> >      chown -R root:root ${D}
> >  }
> >-INSANE_SKIP:${PN} += "ldflags"
> >+FILES:${PN}:append = " ${libdir}"
> 
> FILES:${PN} += "${libdir}" ?

1. I agree it's best not to use blank :append overrides and instead use +=
2. ${libdir} is already a default and doesn't need to be added explicitly

-- 
Denys

