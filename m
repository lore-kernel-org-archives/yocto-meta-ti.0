Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C69A5C48BE6
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.7025.1650457623194606516
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Apr 2022 05:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D143B40C52;
	Wed, 20 Apr 2022 12:27:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GbCNX01Ap4cP; Wed, 20 Apr 2022 12:27:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B3D7840301;
	Wed, 20 Apr 2022 12:26:58 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E86E51748D4; Wed, 20 Apr 2022 08:26:57 -0400 (EDT)
Date: Wed, 20 Apr 2022 08:26:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: reatmon@ti.com, Praneeth Bajjuri <praneeth@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/dunfell][PATCH] ti-graphics: Add j7-hs-evm as
 a compatible machine.
Message-ID: <20220420122657.GA12993@denix.org>
References: <20220418222026.3201-1-reatmon@ti.com>
 <e2fea769-44c1-98f2-e7c9-d34a93f59818@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2fea769-44c1-98f2-e7c9-d34a93f59818@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14609

On Tue, Apr 19, 2022 at 10:14:16PM -0500, Andrew F. Davis via lists.yoctoproject.org wrote:
> On 4/18/22 5:20 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >The recent change to explicitly list the compatible machines is missing the j7-hs-evm.
> >
> >Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >---
> >  .../powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb       | 4 +++-
> >  recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb  | 3 ++-
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> >diff --git a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >index fbff6c51..6d2d68cd 100644
> >--- a/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >+++ b/recipes-bsp/powervr-drivers/ti-img-rogue-driver_1.15.6133109.bb
> >@@ -11,7 +11,7 @@ MACHINE_KERNEL_PR_append = "a"
> >  PR = "${MACHINE_KERNEL_PR}"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> >+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
> 
> 
> Doesn't seem right, we haven't needed to specify the HS version before..

https://git.yoctoproject.org/meta-ti/commit/?h=dunfell&id=ed94c75b436f2f8c5c3a8a6ebed45d7276cc35e4


> Seems we are mixing SoC and board, the GPU driver depends on the SoC
> not the board, we match correctly for am62xx on SoC, but J7 on
> specific board name. Suggest
> 
> +COMPATIBLE_MACHINE = "j7|j721s2|am62xx"

There's no j721s2 SoC family in Dunfell.

I'm guessing "j7-evm|j7-hs-evm|j721s2-evm" was done because j7 SoC family in 
Dunfell is too broad and also covers headless j7200, which lacks "gpu" machine 
feature... Could be just "j7|am62xx" in Dunfell and more specific SoC families 
in master/kirkstone.

-- 
Denys

> >  DEPENDS = "virtual/kernel"
> >@@ -29,9 +29,11 @@ S = "${WORKDIR}/git"
> >  SRCREV = "ee0674adccac16f5b2f7cb8d5d05948706080cb5"
> >  TARGET_PRODUCT_j7-evm = "j721e_linux"
> >+TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> >  TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> >  TARGET_PRODUCT_am62xx = "am62_linux"
> >  TARGET_BVNC_j7-evm = "22.104.208.318"
> >+TARGET_BVNC_j7-hs-evm = "22.104.208.318"
> >  TARGET_BVNC_j721s2-evm = "36.53.104.796"
> >  TARGET_BVNC_am62xx = "33.15.11.3"
> >  PVR_BUILD = "release"
> >diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >index e00dce99..0f3f9192 100644
> >--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.15.6133109.bb
> >@@ -8,7 +8,7 @@ inherit features_check
> >  REQUIRED_MACHINE_FEATURES = "gpu"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >-COMPATIBLE_MACHINE = "j7-evm|j721s2-evm|am62xx"
> >+COMPATIBLE_MACHINE = "j7-evm|j7-hs-evm|j721s2-evm|am62xx"
> >  PR = "r1"
> >@@ -18,6 +18,7 @@ SRC_URI = "git://git.ti.com/graphics/ti-img-rogue-umlibs.git;branch=${BRANCH}"
> >  SRCREV = "47c3ffc44f2881397d45c8a2b5dfa7d6c58b79fb"
> >  TARGET_PRODUCT_j7-evm = "j721e_linux"
> >+TARGET_PRODUCT_j7-hs-evm = "j721e_linux"
> >  TARGET_PRODUCT_j721s2-evm = "j721s2_linux"
> >  TARGET_PRODUCT_am62xx = "am62_linux"
> >  PVR_BUILD ?= "release"

