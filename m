Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35604C6FD20
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 00:18:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.31255.1679444288883953798
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Mar 2023 17:18:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DA05240C5D;
	Wed, 22 Mar 2023 00:18:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AKAH_nb0gd7; Wed, 22 Mar 2023 00:18:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B1F0840A0B;
	Wed, 22 Mar 2023 00:18:05 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 813521637D7; Tue, 21 Mar 2023 20:17:32 -0400 (EDT)
Date: Tue, 21 Mar 2023 20:17:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: meta-ti@lists.yoctoproject.org, linux@ew.tq-group.com
Subject: Re: [master/kirkstone][PATCH] ti-sgx-ddk-um: fix error in postinst
 with sysvinit+udev
Message-ID: <20230322001732.GL18050@denix.org>
References: <20230320142534.2542288-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230320142534.2542288-1-matthias.schiffer@ew.tq-group.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Mar 2023 00:18:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16227

On Mon, Mar 20, 2023 at 03:25:34PM +0100, Matthias Schiffer wrote:
> When sysvinit is in DISTRO_FEATURES, the update-rc.d class must only be
> inherited when the script referenced by INITSCRIPT_NAME actually exists,
> or the update-rc.d command in the generated postinst script will fail.
> 
> Reported-by: Denys Dmytriyenko <denis@denix.org>
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> I have omitted a Fixes tag, as this applies to both master and kirkstone.
> The tags would be:
> 
> # kirkstone
> Fixes: f50f55102f92 ("ti-sgx-ddk-um: use udev for userspace initialization")
> 
> # master
> Fixes: 0b3fa09a5f0b ("ti-sgx-ddk-um: use udev for userspace initialization")
> 
> Let me know if I should send separate patches with the tags included.

Thank you for taking care of this. And don't worry about Fixes: tag - meta-ti 
doesn't have a strict policy for it.

I haven't tested it yet, but so far looks good to me:

Acked-by: Denys Dmytriyenko <denys@konsulko.com>


>  .../libgles/ti-sgx-ddk-um_1.17.4948957.bb             | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> index f1fbed15..73d7acb9 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -24,11 +24,16 @@ TARGET_PRODUCT:am65xx = "ti654x"
>  INITSCRIPT_NAME = "rc.pvr"
>  INITSCRIPT_PARAMS = "defaults 8"
>  
> -inherit update-rc.d
> -
>  PACKAGECONFIG ??= "udev"
>  PACKAGECONFIG[udev] = ",,,udev"
>  
> +def use_initscript(d):
> +    sysvinit = bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d)
> +    udev = bb.utils.contains('PACKAGECONFIG', 'udev', True, False, d)
> +    return sysvinit and not udev
> +
> +inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
> +
>  RDEPENDS:${PN} += "libdrm libdrm-omap"
>  
>  RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
> @@ -42,7 +47,7 @@ do_install () {
>      with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
>  
>      # Delete initscript if it is not needed or would conflict with the udev rules
> -    if $without_sysvinit || $with_udev; then
> +    if ${@oe.utils.ifelse(use_initscript(d), 'false', 'true')}; then
>          rm -rf ${D}${sysconfdir}/init.d
>          rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
>      fi
> -- 
> 2.34.1

