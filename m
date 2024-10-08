Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73822CEFC54
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 19:59:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.5301.1728417589646086438
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 12:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 03A5E40C7B;
	Tue,  8 Oct 2024 19:59:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Pb8rIzbWT64; Tue,  8 Oct 2024 19:59:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF13440023;
	Tue,  8 Oct 2024 19:59:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9B2611640AC; Tue,  8 Oct 2024 15:59:45 -0400 (EDT)
Date: Tue, 8 Oct 2024 15:59:45 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master/scarthgap][PATCH 2/4] u-boot-ti-staging: Add
 v2024.10 recipe
Message-ID: <20241008195945.GL14676@denix.org>
References: <20241004151857.24578-1-reatmon@ti.com>
 <20241004151857.24578-2-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004151857.24578-2-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 19:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17991

Same comment with --find-copies-harder, although the recipe itself is quite 
smalle, so the diff could even be larger...


On Fri, Oct 04, 2024 at 10:18:55AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Adding needed recipe for initial testing and development of the 2024.10
> version of u-boot for the next LTS.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb   | 11 +++++++++++
>  meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          |  3 +++
>  2 files changed, 14 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
> 
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
> new file mode 100644
> index 00000000..1ab94fcc
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
> @@ -0,0 +1,11 @@
> +require u-boot-ti.inc
> +
> +DEFAULT_PREFERENCE = "-1"
> +
> +include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
> +
> +PR = "r0"
> +
> +BRANCH = "ti-u-boot-2024.10"
> +
> +SRCREV = "c97ada2dc66934ee00a7a03d9ed078bdfb7b4039"
> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> index e1f1972e..97237d66 100644
> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
> @@ -26,6 +26,9 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
>  
>  PV:append = "+git"
>  
> +# u-boot builds a tool mkeficapsule and it needs this
> +DEPENDS += "gnutls-native"

Is this specific to 2024.10? Should it be added in the recipe, not .inc?


> +
>  # u-boot needs devtree compiler to parse dts files
>  DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
>  
> -- 
> 2.17.1

