Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D1EC4743E
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.2060.1649130897524087872
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 20:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 968B840C2E;
	Tue,  5 Apr 2022 03:54:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7xhkocYY0etK; Tue,  5 Apr 2022 03:54:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7E43040429;
	Tue,  5 Apr 2022 03:54:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4EF971748C9; Mon,  4 Apr 2022 23:54:55 -0400 (EDT)
Date: Mon, 4 Apr 2022 23:54:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [master][PATCH] wl18xx-fw: Make it support usrmerge
Message-ID: <20220405035455.GH23554@denix.org>
References: <20220330104511.19292-1-alessio.bogani@elettra.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330104511.19292-1-alessio.bogani@elettra.eu>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Apr 2022 17:24:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14590

On Wed, Mar 30, 2022 at 12:45:11PM +0200, Alessio Igor Bogani wrote:
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>

Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> index 48b500a8..09968993 100644
> --- a/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> +++ b/meta-ti-extras/recipes-bsp/wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb
> @@ -19,7 +19,11 @@ do_compile() {
>  }
>  
>  do_install() {
> -    oe_runmake 'DEST_DIR=${D}' install
> +    if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
> +        oe_runmake 'DEST_DIR=${D}/usr' install
> +    else
> +        oe_runmake 'DEST_DIR=${D}' install
> +    fi
>  }
>  
> -FILES:${PN} = "/lib/firmware/ti-connectivity/*"
> +FILES:${PN} = "${nonarch_base_libdir}/firmware/ti-connectivity/*"
> -- 
> 2.17.1

