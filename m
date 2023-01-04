Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF4FBC3DA7D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 02:44:38 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2728.1672800272272090601
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 18:44:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 98CCD40AC9;
	Wed,  4 Jan 2023 02:44:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jk3G67g979bS; Wed,  4 Jan 2023 02:44:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6F0EA409B0;
	Wed,  4 Jan 2023 02:44:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id BCC9F1636B7; Tue,  3 Jan 2023 21:44:12 -0500 (EST)
Date: Tue, 3 Jan 2023 21:44:12 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: afd@ti.com
Cc: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/kirkstone][PATCH] meta-ti-bsp: Move legacy HS
 signing classes into this layer
Message-ID: <20230104024412.GG22689@denix.org>
References: <20230103175013.3937-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230103175013.3937-1-afd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Jan 2023 02:44:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15514

On Tue, Jan 03, 2023 at 11:50:13AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
> These were in the meta-arago layer, but any distro should be able
> to run on HS devices. So move the classes and setup to the BSP layer.

Well, the class itself hasn't been updated for long time, besides few fixes 
and the rename. I guess since it is used for legacy platforms, not much can be 
done...


> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../classes/kernel-fitimage-legacyhs.bbclass  | 758 ++++++++++++++++++
>  .../classes/uboot-sign-legacyhs.bbclass       | 131 +++
>  meta-ti-bsp/conf/machine/am335x-hs-evm.conf   |  10 +
>  meta-ti-bsp/conf/machine/am437x-hs-evm.conf   |  11 +
>  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf   |  11 +
>  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf   |  11 +
>  6 files changed, 932 insertions(+)
>  create mode 100644 meta-ti-bsp/classes/kernel-fitimage-legacyhs.bbclass
>  create mode 100644 meta-ti-bsp/classes/uboot-sign-legacyhs.bbclass

<snip>


> diff --git a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> index 7caa5bfd..aef0d3aa 100644
> --- a/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am335x-hs-evm.conf
> @@ -16,3 +16,13 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
>  UBOOT_RD_ENTRYPOINT = "0x84000000"
>  
>  TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am3x"
> +
> +# FIT image for legacy secure devices
> +KERNEL_CLASSES:append = " kernel-fitimage-legacyhs"
> +KERNEL_IMAGETYPES:append = " fitImage"

Better use += here. Originally these were machine-specific appends in the 
distro config, but can and should be simply += here in the machine configs. 
As append and remove overrides are very hard to undo downstream.

Same comment for all 4 platforms, of course.

-- 
Denys

