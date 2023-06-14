Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628A4EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 14:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14435.1686754540544573777
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 07:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 68F6240BD4;
	Wed, 14 Jun 2023 14:55:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqGX2Dk2kotK; Wed, 14 Jun 2023 14:55:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C9BD540A46;
	Wed, 14 Jun 2023 14:55:25 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 72F7E163A60; Wed, 14 Jun 2023 10:54:36 -0400 (EDT)
Date: Wed, 14 Jun 2023 10:54:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: devarsht@ti.com
Cc: reatmon@ti.com, meta-ti@lists.yoctoproject.org, praneeth@ti.com,
	denys@konsulko.com, nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com,
	j-luthra@ti.com, khasim@ti.com, nsekhar@ti.com, afd@ti.com,
	rs@ti.com, n-jain1@ti.com
Subject: Re: [meta-ti] [kirkstone] [PATCH v2 1/2]
 u-boot-ti-staging_2023.04: Copy bitmap file to boot partition for AM62x
Message-ID: <20230614145436.GW9226@denix.org>
References: <20230614143306.1502763-1-devarsht@ti.com>
 <20230614143306.1502763-2-devarsht@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230614143306.1502763-2-devarsht@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 14:55:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16721

On Wed, Jun 14, 2023 at 08:03:05PM +0530, Devarsh Thakkar via lists.yoctoproject.org wrote:
> Early splash screen support for AM62x has been enabled in u-boot
> and it requires bitmap tarball to be present in boot partition
> as per the default environment settings done in u-boot [1].
> 
> Copy the ti logo bitmap tarball to boot partition of wic image in order
> to enable out of box early display on AM62x.
> 
> [1] https://git.ti.com/cgit/ti-u-boot/ti-u-boot/tree/board/ti/am62x/am62x.env
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
> V2: Rename ti logo tarball as per suggested changes (same is being
>     done in ti-u-boot too)
> ---
>  .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb      | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> index e6da84cb..c948e1ed 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
> @@ -8,3 +8,12 @@ BRANCH = "ti-u-boot-2023.04"
>  
>  SRCREV = "1f510931dcc90e6f28f7fed757ad5000d4382e22"
>  
> +do_install:append:am62xx() {
> +	install -d ${D}/boot
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${D}/boot
> +}
> +
> +do_deploy:append:am62xx() {
> +	install -d ${DEPLOYDIR}
> +	install -m 0644 ${S}/tools/logos/ti_logo_414x97_32bpp.bmp.gz ${DEPLOYDIR}

Any specific reason you also need to deploy this loose file?

-- 
Denys

