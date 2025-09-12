Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D5ECA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 18:24:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23879.1757701472474422086
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 11:24:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5386640CB4;
	Fri, 12 Sep 2025 18:24:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCI-8dbQLnYN; Fri, 12 Sep 2025 18:24:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0EC9140A46;
	Fri, 12 Sep 2025 18:24:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0B289174C68; Fri, 12 Sep 2025 14:24:26 -0400 (EDT)
Date: Fri, 12 Sep 2025 14:24:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Andrew Davis <afd@ti.com>
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	Randolph Sapp <rs@ti.com>, meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap][RFC 2/6] ti-bsp: Do not remove gpu
 MACHINE_FEATURE conditionally on BSP version
Message-ID: <20250912182425.GJ3125@denix.org>
References: <20250909151028.272925-1-afd@ti.com>
 <20250909151028.272925-2-afd@ti.com>
 <20250909204425.GE3125@denix.org>
 <843d1ceb-0d14-4b23-96dd-8bc0e8508a8b@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <843d1ceb-0d14-4b23-96dd-8bc0e8508a8b@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 12 Sep 2025 18:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19009

On Fri, Sep 12, 2025 at 11:31:19AM -0500, Andrew Davis wrote:
> On 9/9/25 3:44 PM, Denys Dmytriyenko wrote:
> >On Tue, Sep 09, 2025 at 10:10:24AM -0500, Andrew Davis via lists.yoctoproject.org wrote:
> >>Setting or removing the gpu MACHINE_FEATURE does not actually change
> >>if the GPU driver is built or not. That is done based on the setting
> >>of the BSP_{SGX,ROGUE}_{DRIVER,UMLIBS}_{PROVIDER,VERSION} vars. These
> >>are default empty for BSP versions without supported GPU drivers, which
> >>will correctly cause a fallback to SW rendering when the GPU driver is
> >>not available.
> >
> >While cleaning the remaining uses of "gpu" MACHINE_FEATURE, why not remove it
> >completely from all the machine configs?
> >
> 
> I thought about that, but it could still be useful to key off of that for
> other reasons, or even maybe turn the "gpu" MACHINE_FEATURE into "rgx" and
> "sgx" so we can later switch on that in the mesa-pvr driver.

Heh, this MACHINE_FEATURE used to be called "sgx" back in the day. When Rogue 
was being added, I briefly had a separate "rgx" flag, but eventually combined 
both into "gpu" one...


> >>Signed-off-by: Andrew Davis <afd@ti.com>
> >>---
> >>  meta-ti-bsp/conf/machine/include/ti-bsp.inc | 8 --------
> >>  1 file changed, 8 deletions(-)
> >>
> >>diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>index 262aa884..a5d9a51f 100644
> >>--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> >>@@ -18,10 +18,6 @@ BSP_KERNEL_VERSION:bsp-mainline = "%"
> >>  BSP_BOOTLOADER_PROVIDER:bsp-mainline = "u-boot-ti-mainline"
> >>  BSP_BOOTLOADER_VERSION:bsp-mainline = "%"
> >>-# GPU support requires out-of-tree SGX and Rogue drivers not available
> >>-# in mainline, usually present in TI staging or derivative like BB.org
> >>-MACHINE_FEATURES:remove:bsp-mainline = "gpu"
> >>-
> >>  # GC320 support requires out-of-tree drivers not available in mainline
> >>  MACHINE_FEATURES:remove:bsp-mainline = "gc320"
> >>@@ -34,10 +30,6 @@ BSP_KERNEL_VERSION:bsp-next = "%"
> >>  BSP_BOOTLOADER_PROVIDER:bsp-next = "u-boot-ti-next"
> >>  BSP_BOOTLOADER_VERSION:bsp-next = "%"
> >>-# GPU support requires out-of-tree SGX and Rogue drivers not available
> >>-# in next, usually present in TI staging or derivative like BB.org
> >>-MACHINE_FEATURES:remove:bsp-next = "gpu"
> >>-
> >>  # GC320 support requires out-of-tree drivers not available in next
> >>  MACHINE_FEATURES:remove:bsp-next = "gc320"
> >>-- 
> >>2.39.2

