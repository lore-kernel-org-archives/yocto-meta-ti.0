Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.53.1646155976277606135
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 09:32:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 16C9940C81;
	Tue,  1 Mar 2022 17:32:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uYgwYWwhrRj0; Tue,  1 Mar 2022 17:32:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F388740301;
	Tue,  1 Mar 2022 17:32:53 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7FC4A1747BB; Tue,  1 Mar 2022 12:32:52 -0500 (EST)
Date: Tue, 1 Mar 2022 12:32:52 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti] [master][PATCH] meta-ti: correct and do not skip "installed-vs-shipped" QA check
Message-ID: <20220301173252.GG1766@denix.org>
References: <16D7256159B60D66.7393@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <16D7256159B60D66.7393@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

On Fri, Feb 25, 2022 at 09:41:25PM +0000, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Skipping "installed-vs-shipped" QA check is now considered bad practice
> due to possible SDK issues and is being flagged by yocto-check-layer [1]
> script and could affect "Yocto Project Compatible" status for the layer.
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=e8baa75535fc888f1d768b23a0140475e832c910
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
>  meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb  | 5 ++++-
>  meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc           | 2 +-
>  meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb | 2 --
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
> index 1cda366d..8b16830f 100644
> --- a/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
> +++ b/meta-ti-extras/recipes-devtools/cuia/cuia_1.0.0.13.bb
> @@ -22,9 +22,12 @@ do_compile () {
>  do_install() {
>  	cd ${S}
>  	oe_runmake DESTDIR=${D} libdir=${libdir} includedir=${includedir} install
> +	rm -rf ${D}${libdir}/boot.*
> +	rm -rf ${D}${libdir}/gnu.targets.*
> +	rm -rf ${D}${libdir}/syscalls.*
>  }
>  
>  COMPATIBLE_HOST ?= "null"
>  COMPATIBLE_HOST:ti-soc = "(.*)"
>  
> -INSANE_SKIP:${PN} += "textrel installed-vs-shipped"
> +INSANE_SKIP:${PN} += "textrel"
> diff --git a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> index 460964b3..6b5e186c 100644
> --- a/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> +++ b/meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc
> @@ -29,4 +29,4 @@ FILES:${PN}-dev += "${VLIB_C66_INSTALL_DIR_RECIPE}"
>  INHIBIT_PACKAGE_STRIP = "1"
>  INHIBIT_SYSROOT_STRIP = "1"
>  INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> -INSANE_SKIP:${PN}-dev = "installed-vs-shipped arch"
> +INSANE_SKIP:${PN}-dev = "arch"
> diff --git a/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
> index 9fc4cee1..ee9826e6 100644
> --- a/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
> +++ b/meta-ti-extras/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
> @@ -7,5 +7,3 @@ LIC_FILES_CHKSUM = "file://xdais_6_26_01_03_manifest.html;md5=a5a675d49db2f658bb
>  
>  SRC_URI[xdaistarball.md5sum] = "9b2bea3408254e737ec0d819a031adf6"
>  SRC_URI[xdaistarball.sha256sum] = "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc30bc5296e98d5d43b0b5a237a0d"
> -
> -INSANE_SKIP:${PN} = "installed-vs-shipped"
> -- 
> 2.25.1
> 
