Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA702C54E76
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 20:25:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.208420.1673987102494975753
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Jan 2023 12:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D243240C87;
	Tue, 17 Jan 2023 20:25:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4o_BThyiGO0B; Tue, 17 Jan 2023 20:25:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BBB9040C1C;
	Tue, 17 Jan 2023 20:25:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6F0AB1636FA; Tue, 17 Jan 2023 15:24:42 -0500 (EST)
Date: Tue, 17 Jan 2023 15:24:42 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti] [master][PATCH] optee-os: sync up with upstream
 meta-arm update
Message-ID: <20230117202442.GD22689@denix.org>
References: <1739A240EA9239F6.25137@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1739A240EA9239F6.25137@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Jan 2023 20:25:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15579

Ping. As master is now broken!


On Thu, Jan 12, 2023 at 06:12:12PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Upstream meta-arm has updated optee-os to 3.19 and our local changes
> conflict with that. Update bbappend to match upstream.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 9 ---------
>  1 file changed, 9 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> index 8640d7b0..6f711101 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
> @@ -1,12 +1,3 @@
> -PV:ti-soc = "3.19.0+git${SRCPV}"
> -SRCREV:ti-soc = "afacf356f9593a7f83cae9f96026824ec242ff52"
> -
> -# These patches are from upstream against v3.18, but we moved to v3.19 and the
> -# patches are now invalid.  These can be removed once upstream moves up to or
> -# beyond v3.19.
> -SRC_URI:remove:ti-soc = "file://0008-no-warn-rwx-segments.patch"
> -SRC_URI:remove:ti-soc = "file://0009-add-z-execstack.patch"
> -
>  EXTRA_OEMAKE:append:k3 = "${@ ' CFG_CONSOLE_UART='+ d.getVar('OPTEE_K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
>  
>  EXTRA_OEMAKE:append:am62xx = " CFG_WITH_SOFTWARE_PRNG=y CFG_TEE_CORE_LOG_LEVEL=1"
> -- 
> 2.25.1

