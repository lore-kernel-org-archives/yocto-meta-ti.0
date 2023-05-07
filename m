Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20D40C77B75
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 16:09:53 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.68509.1683475784391419149
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 07 May 2023 09:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9C83B40C56;
	Sun,  7 May 2023 16:09:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFgra1e5OJdY; Sun,  7 May 2023 16:09:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8133240ACD;
	Sun,  7 May 2023 16:09:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D4B2E1638C9; Sun,  7 May 2023 12:08:59 -0400 (EDT)
Date: Sun, 7 May 2023 12:08:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Daniel Schultz <d.schultz@phytec.de>
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] [PATCH kirkstone+ 2/2] recipes-graphics:
 ti-img-rogue-umlibs: Make -vulkan optional
Message-ID: <20230507160859.GM9226@denix.org>
References: <20230504123736.1475746-1-d.schultz@phytec.de>
 <20230504123736.1475746-2-d.schultz@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504123736.1475746-2-d.schultz@phytec.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 07 May 2023 16:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16498

On Thu, May 04, 2023 at 05:37:36AM -0700, Daniel Schultz wrote:
> Only include the ti-img-rogue-umlibs-vulkan package if the
> DISTRO_FEATURES x11 is enabled. Right now, this recipe has a failed
> build dependency on images without x11.

Just to clarify - this recipe has run-time dependency from vulkan package 
to libx11-xcb, which itself won't build w/o "x11" distro feature.


> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>

Tested-by: Denys Dmytriyenko <denys@konsulko.com>


> ---
>  .../libgles/ti-img-rogue-umlibs_23.1.6404501.bb   | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> index c33f8ae0..a6ed57f4 100644
> --- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> +++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
> @@ -29,10 +29,18 @@ do_install:append() {
>          mv ${D}/lib/firmware ${D}${nonarch_base_libdir}
>          rmdir ${D}/lib
>      fi
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'false', 'true', d)}; then
> +        rm -rf ${D}${libdir}/libVK_IMG.so*
> +    fi 
>      rm -rf "${D}/etc/init.d"
>  }
>  
> -PACKAGES = "${PN}-vulkan ${PN}-tools ${PN}-firmware ${PN}"
> +PACKAGES = " \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
> +    ${PN}-tools \
> +    ${PN}-firmware \
> +    ${PN} \
> +"
>  
>  FILES:${PN}-vulkan = " \
>      ${datadir}/vulkan \
> @@ -56,7 +64,10 @@ RDEPENDS:${PN}-tools = "python3-core"
>  FILES:${PN}-firmware = "${base_libdir}/firmware/*"
>  INSANE_SKIP:${PN}-firmware += "arch"
>  
> -RRECOMMENDS:${PN} += "${PN}-vulkan ${PN}-tools"
> +RRECOMMENDS:${PN} += " \
> +    ${@bb.utils.contains("DISTRO_FEATURES", "x11", "${PN}-vulkan", "", d)} \
> +    ${PN}-tools \
> +"
>  RDEPENDS:${PN} += " ${PN}-firmware"
>  
>  INSANE_SKIP:${PN} += "already-stripped dev-so"
> -- 
> 2.25.1

