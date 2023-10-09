Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59BACD6136
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 20:20:42 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.73984.1696882834800674963
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Oct 2023 13:20:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0E7FB40031;
	Mon,  9 Oct 2023 20:20:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70T3E_0-NIIp; Mon,  9 Oct 2023 20:20:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5086B40023;
	Mon,  9 Oct 2023 20:20:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 64445163CD8; Mon,  9 Oct 2023 16:20:27 -0400 (EDT)
Date: Mon, 9 Oct 2023 16:20:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: r-gunasekaran@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, praneeth@ti.com,
	srk@ti.com, afd@ti.com
Subject: Re: [meta-ti] [kirkstone][PATCH v3 1/2] preuth-fw: Remove
 packaging of PRU-ICSSM firmwares
Message-ID: <20231009202027.GD2408@denix.org>
References: <20231009070926.21629-1-r-gunasekaran@ti.com>
 <20231009070926.21629-2-r-gunasekaran@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009070926.21629-2-r-gunasekaran@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Oct 2023 20:20:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17084

On Mon, Oct 09, 2023 at 12:39:25PM +0530, Ravi Gunasekaran via lists.yoctoproject.org wrote:
> PRU-ICSS on AM33x, AM43x, supports different ethernet modes such
> as Ethernet, HSR and PRP by means of different firmwares and the
> driver loads one of the these firmware. The PRU-ICSS linux driver
> may not be available for all kernel versions.
> 
> So add an .inc file that avoids the packaging of such firmwares
> in the SDK, so that it can be referenced by kernel recipes that
> don't support PRU-ICSS.
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>  meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
> 
> diff --git a/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
> new file mode 100644
> index 00000000..6698c9ed
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/linux/prueth-fw.inc
> @@ -0,0 +1,3 @@
> +# Do not package firmwares for kernels that don't support PRUETH
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti43x = " prueth-fw pruhsr-fw pruprp-fw"
> +RDEPENDS:${KERNEL_PACKAGE_NAME}-base:remove:ti33x = " prueth-fw pruhsr-fw pruprp-fw"

This is asking for trouble - there's no way to un-do :remove downstream (e.g. 
any of the Distro, SDK, Product Line or Customer layers)

It is not recommended to use :remove (and :append to a lesser degree) on a 
regular basis when it can be done differently.

Moreover, what is a difference from v2? It is a more convoluted way to drop 
those FW images from getting installed, but it is still done unconditionally 
here in meta-ti - are there any benefits of doing it this way?

-- 
Denys

