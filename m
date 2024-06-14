Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0331C27C6E
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 17:20:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.153.1718385625012358599
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Jun 2024 10:20:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3481940CC7;
	Fri, 14 Jun 2024 17:20:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9b9gKgl7zZGi; Fri, 14 Jun 2024 17:20:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1194C40C8C;
	Fri, 14 Jun 2024 17:20:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 37781163FA6; Fri, 14 Jun 2024 13:20:21 -0400 (EDT)
Date: Fri, 14 Jun 2024 13:20:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH 1/4] conf/machine, ti-bsp:
 add support for multiple BSP providers
Message-ID: <20240614172021.GA21287@denix.org>
References: <20240613172254.770920-1-denis@denix.org>
 <28a0c396-3450-45b7-b411-fba68f06f129@ti.com>
 <20240613194731.GV21287@denix.org>
 <4c6fbb27-1a10-4eeb-90f0-3b11b18639e4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c6fbb27-1a10-4eeb-90f0-3b11b18639e4@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 14 Jun 2024 17:20:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17740

On Thu, Jun 13, 2024 at 04:09:46PM -0500, Ryan Eatmon wrote:
> 
> 
> On 6/13/2024 2:47 PM, Denys Dmytriyenko wrote:
> >On Thu, Jun 13, 2024 at 02:29:34PM -0500, Ryan Eatmon wrote:
> >>
> >>
> >>On 6/13/2024 12:22 PM, Denys Dmytriyenko wrote:
> >>>From: Denys Dmytriyenko <denys@konsulko.com>
> >>>
> >>>This adds a facility to define multiple supported BSPs with their own
> >>>preferences for individual components, as well as lets machine configs
> >>>specify conditional configurations for different BSPs.
> >>>
> >>>Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >>>---
> >>
> >><snip>
> >>
> >>>+
> >>>+# ==========
> >>>+# ti-6_6
> >>>+# TI staging kernel 6.6, u-boot 2024.04
> >>>+# ==========
> >>>+BSP_KERNEL_PROVIDER:bsp-ti-6_6 = "linux-ti-staging"
> >>>+BSP_KERNEL_VERSION:bsp-ti-6_6 = "6.6%"
> >>>+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_6 = "u-boot-ti-staging"
> >>>+BSP_BOOTLOADER_VERSION:bsp-ti-6_6 = "2024%"
> >>>+
> >>>+# Only Rogue is enabled so far, SGX falls back to SW rendering
> >>>+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_6 = "ti-img-rogue-driver"
> >>>+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_6 = "24%"
> >>>+BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_6 = "24%"
> >>>+BSP_MESA_PVR_VERSION:bsp-ti-6_6 = "23%"
> >>>+
> >>>+# ==========
> >>>+# ti-6_1
> >>>+# TI staging kernel 6.1, u-boot 2023.04
> >>>+# ==========
> >>>+BSP_KERNEL_PROVIDER:bsp-ti-6_1 = "linux-ti-staging"
> >>>+BSP_KERNEL_VERSION:bsp-ti-6_1 = "6.1%"
> >>>+BSP_BOOTLOADER_PROVIDER:bsp-ti-6_1 = "u-boot-ti-staging"
> >>>+BSP_BOOTLOADER_VERSION:bsp-ti-6_1 = "2023%"
> >>>+
> >>>+BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-sgx-ddk-km"
> >>>+BSP_SGX_DRIVER_VERSION:bsp-ti-6_1 = "1.17%"
> >>>+BSP_SGX_UMLIBS_VERSION:bsp-ti-6_1 = "1.17%"
> >>>+BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_1 = "ti-img-rogue-driver"
> >>>+BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
> >>>+BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
> >>>+BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
> >>
> >>I wonder if I can use this same system to support the upstream
> >>testing...  After we accept this series I need to look at how the
> >>upstream testing flow can leverage this concept.
> >
> >That's the mainline setup...
> 
> For the kernel we use linux-ti-next not mainline.

Right, linux-next tree vs. torvalds one. I considered supporting both in 
ti-bsp.inc, but thought that mainline pulling torvalds tree would be more 
useful for 99% of meta-ti users, than pulling ever-changing linux-next.

Other than the kernel tree, the rest is exactly the same as bsp-mainline, 
and it is still possible to overwrite PREFERRED_PROVIDER on top:
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/conf/distro/include/branding-next.inc?h=scarthgap-wip

Even w/o meta-arago, all it takes is 2 lines:
TI_DEFAULT_BSP = "mainline"
PREFERRED_PROVIDER_virtual/kernel = "linux-ti-next"

BTW, linux-ti-next and linux-ti-mainline recipes originally were quite 
different, but over time became very similar. I'm thinking these can be 
cleaned up and unified - either one includes another and adjusts SRC_URI, 
or potentially even a single recipe with a switch...

-- 
Denys

