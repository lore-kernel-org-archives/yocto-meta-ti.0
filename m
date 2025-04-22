Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9412AC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 21:05:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1852.1745355913897754412
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Apr 2025 14:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CAE5240C2C;
	Tue, 22 Apr 2025 21:05:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNZYELsIwn5Q; Tue, 22 Apr 2025 21:05:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A6DFD40A30;
	Tue, 22 Apr 2025 21:05:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 100CA1668C8; Tue, 22 Apr 2025 17:05:10 -0400 (EDT)
Date: Tue, 22 Apr 2025 17:05:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chirag Shilwant <c-shilwant@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/scarthgap][PATCH] conf: machine: am62axx:
 Exclude tiboot3.bin for GP
Message-ID: <20250422210510.GB13634@denix.org>
References: <20250417033514.3429633-1-c-shilwant@ti.com>
 <20250417182828.GX13634@denix.org>
 <0feaf15d-e3ec-4f10-b651-db4225a40437@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0feaf15d-e3ec-4f10-b651-db4225a40437@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Apr 2025 21:05:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18492

On Mon, Apr 21, 2025 at 12:07:28PM +0530, Chirag Shilwant wrote:
> 
> On 17/04/25 23:58, Denys Dmytriyenko wrote:
> >On Thu, Apr 17, 2025 at 09:05:14AM +0530, Chirag Shilwant wrote:
> >>* The GP variant of SK-AM62A-LP is no longer tested.
> >* Is it still being built?
> >
> >* Also, what about other BSPs, e.g. 6.1?
> 
> 
> The GP part was built during the device bring-up (~ 2years back)
> Apparently GP samples are limited to TI internal. Hence, the logic to
> deploy tiboot3 for it was added in meta-ti-bsp at that time to support
> internal development.
> 
> Post device APL, all TI internal development is moved to HS-FS part.
> (Ideally, this logic of deploying tiboot3 for GP should have been
> removed at that time)
> 
> From customer / 3rd party SOM pov, all receive HS-FS part by default
> from TI.
> So, they shouldn't be affected if meta-ti-bsp no longer deploys
> |tiboot3-am62ax-gp-evm.bin|

Chirag,

Thanks for clarifying.

Probably should rephrase the commit message with a brief explanation.

Instead of:

The GP variant of SK-AM62A-LP is no longer tested.

Something like:

The GP variant of AM62A SoC was only used internally for initial device 
bring-up and is not publicly available.


> >* What about derivative or customer platforms, besides SK-AM62A-LP? I.e. you
> >are modifying the entire am62axx SoC family, which is supposed to be shared
> >by multiple platforms in the AM62A SoC family.
> 
> 
> 
> In meta-ti-bsp, am62axx-evm (which represents SK-AM62A-LP) is the only
> machine which utilizes AM62A SoC.
> 
> & for customer platforms...as mentioned above, ideally they
> shouldn't be affected
> as GP parts weren't shipped to them
> 
> For reference, we can checkout prebuilt-images folder of phyCORE-AM62A [0]
> 
> [0] : https://download.phytec.de/Software/Linux/BSP-Yocto-AM62Ax/BSP-Yocto-Ampliphy-AM62Ax-PD24.1.2/images/ampliphy/phyboard-lyra-am62axx-2/
> 
> 
> --
> Chirag
> 
> 
> 
> >
> >
> >>Hence, don't include it under IMAGE_BOOT_FILES to ensure
> >>tiboot3-am62ax-gp-evm.bin is not packaged inside /boot
> >>partition of wic image
> >>
> >>Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >>---
> >>  meta-ti-bsp/conf/machine/include/am62axx.inc | 3 ---
> >>  1 file changed, 3 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/include/am62axx.inc b/meta-ti-bsp/conf/machine/include/am62axx.inc
> >>index 98cea203..e5f827a9 100644
> >>--- a/meta-ti-bsp/conf/machine/include/am62axx.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/am62axx.inc
> >>@@ -10,9 +10,6 @@ TFA_K3_SYSTEM_SUSPEND = "1"
> >>  # Default tiboot3.bin on AM62A is for HS-FS
> >>  IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-fs-evm.bin"
> >>-# Since default tiboot3.bin on AM62A is for HS-FS, add a version for GP
> >>-IMAGE_BOOT_FILES += "tiboot3-am62ax-gp-evm.bin"
> >>-
> >>  # Since default tiboot3.bin on AM62A is for HS-FS, add a version for HS-SE
> >>  IMAGE_BOOT_FILES += "tiboot3-am62ax-hs-evm.bin"
> >>-- 
> >>2.34.1
> 

