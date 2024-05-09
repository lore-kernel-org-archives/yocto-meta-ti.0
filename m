Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2765C25B74
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 17:12:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1293.1715274765393869164
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 May 2024 10:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6EB6340C8A;
	Thu,  9 May 2024 17:12:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ld-eAwgit0FE; Thu,  9 May 2024 17:12:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DABA840C7B;
	Thu,  9 May 2024 17:12:40 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 06995163F64; Thu,  9 May 2024 13:12:40 -0400 (EDT)
Date: Thu, 9 May 2024 13:12:39 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org,
	detheridge@ti.com
Subject: Re: [meta-ti][master/scarthgap][PATCHv2 1/3] ti-img-rogue-*: add
 ddk 24.1 recipes for ltsprep
Message-ID: <20240509171239.GE21287@denix.org>
References: <20240502191843.2380555-1-rs@ti.com>
 <20240502191843.2380555-2-rs@ti.com>
 <20240502194518.GW28791@denix.org>
 <D14K004H3SGW.3V2EISQLSIWJ1@ti.com>
 <8babdd70-5c2c-46ae-a5cc-0611b853992b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8babdd70-5c2c-46ae-a5cc-0611b853992b@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 May 2024 17:12:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17652

On Thu, May 09, 2024 at 08:51:21AM -0500, Ryan Eatmon wrote:
> 
> 
> On 5/8/2024 3:42 PM, Randolph Sapp wrote:
> >On Thu May 2, 2024 at 2:45 PM CDT, Denys Dmytriyenko wrote:
> >>Can you make it a diff please? As shown previously, that helps with review and
> >>allows spotting issues much easier.
> >>
> >[snip]
> >
> >Yeah, sorry about the delay on this. Just got back to Dallas. Appending the diff
> >here if people need it. I can submit a v3 for this if necessary. Just let me
> >know.
> 
> I already accepted the patch, just for the future add the needed
> flags to the git format-patch call to generate what Denys is asking
> for.

As a maintainer, you should be asking for this to ensure no issues pass 
unnoticed during the review.

Yes, v2 looks good and previously reported issues got resolved, thanks.


> >---
> >
> > From 9666459f524333440c61eeae7c0ad430c58d740e Mon Sep 17 00:00:00 2001
> >From: Randolph Sapp <rs@ti.com>
> >Date: Tue, 30 Apr 2024 14:56:57 -0500
> >Subject: [PATCH] ti-img-rogue-*: add ddk 24.1 recipes for ltsprep
> >
> >Recipes for DDK 24.1, but lock them behind ltsprep tags because they
> >require device tree changes that do not work on the current default
> >kernel for this layer.
> >
> >Signed-off-by: Randolph Sapp <rs@ti.com>
> >---
> >  ...6512818.bb => ti-img-rogue-driver_24.1.6554834.bb} |  4 +++-
> >  ...6512818.bb => ti-img-rogue-umlibs_24.1.6554834.bb} | 11 +++++++----
> >  2 files changed, 10 insertions(+), 5 deletions(-)
> >  copy meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_23.3.6512818.bb => ti-img-rogue-driver_24.1.6554834.bb} (94%)
> >  copy meta-ti-bsp/recipes-graphics/powervr-umlibs/{ti-img-rogue-umlibs_23.3.6512818.bb => ti-img-rogue-umlibs_24.1.6554834.bb} (94%)
> >
> >diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> >similarity index 94%
> >copy from meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> >copy to meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> >index 02ec9fe9..a1b76d27 100644
> >--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.3.6512818.bb
> >+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_24.1.6554834.bb
> >@@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-driver"
> >  LICENSE = "MIT | GPL-2.0-only"
> >  LIC_FILES_CHKSUM = "file://README;beginline=14;endline=19;md5=0403c7dea01a2b8232261e805325fac2"
> >+DEFAULT_PREFERENCE = "-1"
> >+
> >  inherit module
> >  PROVIDES = "virtual/gpudriver"
> >@@ -22,7 +24,7 @@ SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;
> >  S = "${WORKDIR}/git"
> >-SRCREV = "2f409b4dd2540e896b54bff02219d4fc51129b81"
> >+SRCREV = "e2dfdfee991dadc18175f27fe9e8676e910a2f8d"
> >  TARGET_PRODUCT:j721e = "j721e_linux"
> >  TARGET_PRODUCT:j721s2 = "j721s2_linux"
> >diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> >similarity index 94%
> >copy from meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> >copy to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> >index a0a9a295..d43d1635 100644
> >--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.3.6512818.bb
> >+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
> >@@ -3,6 +3,8 @@ HOMEPAGE = "http://git.ti.com/graphics/ti-img-rogue-umlibs"
> >  LICENSE = "TI-TFL"
> >  LIC_FILES_CHKSUM = "file://${WORKDIR}/git/LICENSE;md5=7232b98c1c58f99e3baa03de5207e76f"
> >+DEFAULT_PREFERENCE = "-1"
> >+
> >  inherit bin_package
> >  INHIBIT_DEFAULT_DEPS = ""
> >@@ -14,7 +16,7 @@ PR = "r3"
> >  BRANCH = "linuxws/scarthgap/k6.6/${PV}"
> >  SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
> >-SRCREV = "0b9e64254269be2fa95c4f3e1dd925d6e4d58199"
> >+SRCREV = "e473234158c736248cf71a60080b7faf76fca561"
> >  S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
> >  TARGET_PRODUCT:j721e = "j721e_linux"
> >@@ -109,7 +111,7 @@ python __anonymous() {
> >          mlprefix = d.getVar("MLPREFIX")
> >          pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
> >          d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
> >-        d.setVar("INSANE_SKIP:" + fullp, "dev-so")
> >+        d.setVar("INSANE_SKIP:" + fullp, "dev-so ldflags")
> >          d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}ti-img-rogue-umlibs" + suffix)
> >  }
> >@@ -132,7 +134,8 @@ DEBIAN_NOAUTONAME:libopencl-rogue-tools = "1"
> >  # optional tools and tests
> >  FILES:${PN}-tools = "${bindir}/"
> >-RDEPENDS:${PN}-tools = "python3-core ${PN}"
> >+RDEPENDS:${PN}-tools = "python3-core libdrm ${PN}"
> >+INSANE_SKIP:${PN}-tools = "ldflags"
> >  # required firmware
> >  FILES:${PN}-firmware = "${base_libdir}/firmware/*"
> >@@ -142,4 +145,4 @@ RRECOMMENDS:${PN} += " \
> >      ${PN}-tools \
> >  "
> >-INSANE_SKIP:${PN} += "already-stripped dev-so"
> >+INSANE_SKIP:${PN} += "already-stripped dev-so ldflags"

