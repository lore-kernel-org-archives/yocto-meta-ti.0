Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 356E6EB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 18:05:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1254.1687284342625820942
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jun 2023 11:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8F07440C88;
	Tue, 20 Jun 2023 18:05:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LPPKRvm7aYlc; Tue, 20 Jun 2023 18:05:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5EC9440C16;
	Tue, 20 Jun 2023 18:05:38 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7A6C4163B09; Tue, 20 Jun 2023 14:05:37 -0400 (EDT)
Date: Tue, 20 Jun 2023 14:05:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] kernel-rdepends: Add
 ti-eth-fw as an RDEPENDS
Message-ID: <20230620180537.GJ1518@denix.org>
References: <20230620170925.19023-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620170925.19023-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jun 2023 18:05:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16745

On Tue, Jun 20, 2023 at 12:09:25PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> When the ti-eth-fw recipe was split out from the ti-rtos-firmware recipe
> we forgot to add it as a dependency.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> index 18984e80..1f0c1ee8 100644
> --- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
> @@ -31,3 +31,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e = " vxd-dec-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 = " cnm-wave-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j784s4 = " cnm-wave-fw"
>  RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62axx = " cnm-wave-fw"
> +
> +# Add run-time dependency for TI ETH firmware to the rootfs
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:k3 = " ti-eth-fw"

Though, ETH FW is only enabled on j721e, j7200 and j784s4:

https://git.yoctoproject.org/meta-ti/commit/?id=91e5a1ca6541012e3d4285479ecf5a9f353307f9

ETH_FW_LIST = ""
ETH_FW_LIST:j721e =   "${ETH_FW}"
ETH_FW_LIST:j7200 =   "${ETH_FW}"
ETH_FW_LIST:j721s2 =  ""
ETH_FW_LIST:j784s4 =  "${ETH_FW}"
ETH_FW_LIST:am65xx =  ""
ETH_FW_LIST:am64xx =  ""
ETH_FW_LIST:am62xx =  ""
ETH_FW_LIST:am62axx = ""

Other platforms generate an empty package w/o the binary in it. So I guess for 
simpler dependency pulling it for all K3 platforms is an option? On one hand 
it makes kernel dependencies simpler, but executes build/packaging process for 
the firmware that ends up being no-op and produce an empty output...

Similar question for DM FW? E.g.:

https://git.yoctoproject.org/meta-ti/commit/?id=b21d29d94694ac49b97a1f4ba428c7d8cd6fb64a

DM_FW_LIST = ""
DM_FW_LIST:j721e =   "${DM_FIRMWARE}"
DM_FW_LIST:j7200 =   "${DM_FIRMWARE}"
DM_FW_LIST:j721s2 =  "${DM_FIRMWARE}"
DM_FW_LIST:j784s4 =  "${DM_FIRMWARE}"
DM_FW_LIST:am65xx =  ""
DM_FW_LIST:am64xx =  ""
DM_FW_LIST:am62xx =  "${DM_FIRMWARE}"
DM_FW_LIST:am62axx = "${DM_FIRMWARE}"

-- 
Denys

