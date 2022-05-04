Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B17AC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 21:43:40 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3497.1651700618294506414
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 14:43:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 609F740C24;
	Wed,  4 May 2022 21:43:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAj5Skl6QEvc; Wed,  4 May 2022 21:43:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F23D40B13;
	Wed,  4 May 2022 21:43:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 01E4317491E; Wed,  4 May 2022 17:43:33 -0400 (EDT)
Date: Wed, 4 May 2022 17:43:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH] recipes-bsp: tifs-lpm-stub:
 Introduce new recipe
Message-ID: <20220504214333.GG9834@denix.org>
References: <20220504213844.20764-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504213844.20764-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 21:43:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14693

On Wed, May 04, 2022 at 04:38:44PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> This firmware stub is required by the TI foundational security
> software while transitioning to low power mode.
> 
> Add a recipe for this compatible with am62xx-evm

Is it GP only FW?


> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
>  .../tifs-lpm-stub/tifs-lpm-stub_git.bb        | 24 +++++++++++++++++++
>  recipes-kernel/linux/kernel-rdepends.inc      |  4 ++++
>  3 files changed, 29 insertions(+)
>  create mode 100644 recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> 
> diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> index 3ebdae30..47e76347 100644
> --- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> @@ -18,6 +18,7 @@ GOODIX_FW_VERSION = "1.0.0.0"
>  CADENCE_MHDP_FW_VERSION = "1.2.17"
>  IMG_DEC_FW_VERSION = "1.0"
>  CNM_WAVE521_FW_VERSION = "1.0.00"
> +TIFS_LPM_STUB_FW_VERSION = "08.03.02"
>  
>  TI_LINUX_FW_SRCREV ?= "917625c2721eef8677df9e47d919005b0d4f93aa"
>  SRCREV = "${TI_LINUX_FW_SRCREV}"
> diff --git a/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> new file mode 100644
> index 00000000..642a8d3a
> --- /dev/null
> +++ b/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "TI Foundational security Low Power Management Stub"
> +
> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
> +
> +PV = "${TIFS_LPM_STUB_FW_VERSION}"
> +PR = "${INC_PR}.0"
> +
> +CLEANBROKEN = "1"
> +
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +TARGET = "ti-fs-stub-firmware-am62x-gp-signed.bin"
> +
> +do_install() {
> +	install -d ${D}${base_libdir}/firmware/ti-sysfw/
> +	install -m 0644 ${S}/ti-sysfw/${TARGET} ${D}${base_libdir}/firmware/ti-sysfw/${TARGET}
> +}
> +
> +FILES_${PN} = "${base_libdir}/firmware"
> +
> diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
> index 522d9674..17aee4c2 100644
> --- a/recipes-kernel/linux/kernel-rdepends.inc
> +++ b/recipes-kernel/linux/kernel-rdepends.inc
> @@ -45,3 +45,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " vxd-dec-fw"
>  
>  # Add run-time dependency for Chips&Media Wave521 firmware to the rootfs
>  RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j721s2-evm = " cnm-wave-fw"
> +
> +# Add run-time dependency for TIFS Low Power Module stub
> +RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am62xx-evm = " tifs-lpm-stub"
> +
> -- 
> 2.17.1

