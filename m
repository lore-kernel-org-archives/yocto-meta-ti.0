Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E07A7C02198
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 00:15:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.690.1739578498500813179
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 14 Feb 2025 16:14:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB2CD40DD5;
	Sat, 15 Feb 2025 00:14:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id awZ8UffUYJOV; Sat, 15 Feb 2025 00:14:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 99F1C40DCE;
	Sat, 15 Feb 2025 00:14:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 02C0F164247; Fri, 14 Feb 2025 19:14:55 -0500 (EST)
Date: Fri, 14 Feb 2025 19:14:55 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: a-christidis@ti.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][scarthgap/master][PATCH 2/3] recipes-graphics : port
 gc320 libs to work on kernel 6.12
Message-ID: <20250215001455.GX21608@denix.org>
References: <20250212201830.2090247-1-a-christidis@ti.com>
 <20250212201830.2090247-3-a-christidis@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212201830.2090247-3-a-christidis@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 15 Feb 2025 00:15:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18321

On Wed, Feb 12, 2025 at 02:18:29PM -0600, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a0507488@uda0867391-2.dhcp.ti.com>

You might want to check your configuration to fix the email address.


> The user mode libraries needed recompiling with the scarthgap revision of gcc to
> remove all the warning about 32bit API usage during the linking stage, New SRCREV
> and branch includes this changes. Versions of the libraries remain the same.
> 
> Also, create custom package split logic. Old logic would place the symbolic link
> to the new recompiled packages, in a package that would not be included in the
> SDK. So, new logic makes sure the symbolic link is included in a package that
> get included in the rootfs.
> 
> Signed-Off-By: Antonios Christidis <a-christidis@ti.com>
> ---
>  .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> index 807f421c..02b44355 100644
> --- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> @@ -11,10 +11,10 @@ COMPATIBLE_MACHINE = "omap-a15"
>  
>  CLEANBROKEN = "1"
>  
> -BRANCH = "ti-${PV}"
> +BRANCH = "ti-${PV}-scarthgap"
>  
>  SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
> -SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
> +SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
>  
>  RRECOMMENDS:${PN} = "ti-gc320-driver"
>  
> @@ -41,6 +41,10 @@ EXTRA_OEMAKE += "DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT} LIBDIR=${libdir}"
>  do_install() {
>      oe_runmake install
>      chown -R root:root ${D}
> +    mkdir lib
>  }
>  
> -INSANE_SKIP:${PN} += "ldflags"
> +PACKAGES = "${PN}"
> +FILES:${PN} = "${libdir} /usr/include"

This is incorrect, please don't do that. Header files and .so symlinks that 
you mentioned in the commit message should go into the -dev package.


> +INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
> -- 
> 2.34.1

