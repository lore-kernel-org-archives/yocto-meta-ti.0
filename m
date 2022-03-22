Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E17EC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 17:59:54 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.13460.1647971992838095137
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 10:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9615640C3E;
	Tue, 22 Mar 2022 17:59:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inucWDNM5OsN; Tue, 22 Mar 2022 17:59:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6A75540951;
	Tue, 22 Mar 2022 17:59:47 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F199174837; Tue, 22 Mar 2022 13:59:47 -0400 (EDT)
Date: Tue, 22 Mar 2022 13:59:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][dunfell][PATCH 06/11] recipes-bsp: lpm-demo:
 Introduce low power mode demo package
Message-ID: <20220322175947.GL23554@denix.org>
References: <20220322162528.15298-1-reatmon@ti.com>
 <20220322162528.15298-7-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220322162528.15298-7-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Mar 2022 17:59:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14526

On Tue, Mar 22, 2022 at 11:25:23AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> On am62xx-evm, for low power validation, the system boot using
> an initramfs.
> 
> Package the tisdk-tiny-image.cpio file in the /boot of the
> default filesystem to enable the demo.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  recipes-bsp/lpm-demo/files/GPL-2     | 340 +++++++++++++++++++++++++++
>  recipes-bsp/lpm-demo/lpm-demo_1.0.bb |  28 +++
>  2 files changed, 368 insertions(+)
>  create mode 100644 recipes-bsp/lpm-demo/files/GPL-2
>  create mode 100644 recipes-bsp/lpm-demo/lpm-demo_1.0.bb
> 
> diff --git a/recipes-bsp/lpm-demo/files/GPL-2 b/recipes-bsp/lpm-demo/files/GPL-2
> new file mode 100644
> index 00000000..d60c31a9
> --- /dev/null
> +++ b/recipes-bsp/lpm-demo/files/GPL-2

<snip>

> diff --git a/recipes-bsp/lpm-demo/lpm-demo_1.0.bb b/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
> new file mode 100644
> index 00000000..56b04d56
> --- /dev/null
> +++ b/recipes-bsp/lpm-demo/lpm-demo_1.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Low power mode demo"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://GPL-2;md5=94d55d512a9ba36caa9b7df079bae19f"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +COMPATIBLE_MACHINE = "am62xx-evm"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +S = "${WORKDIR}"
> +
> +# We need to have the license file from some source. In this case, there
> +# is no source. Hence pointing to the license file only
> +SRC_URI = "file://GPL-2"

That's an incorrect way of doing it.
https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/busybox/busybox-inittab_1.35.0.bb#n3

Also, default license for OpenEmbedded metadata is MIT, not GPLv2. Any 
specific reason for the change?
https://git.yoctoproject.org/meta-arago/tree/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb#n3


> +LPM_RAMFS_IMAGE ?= "tisdk-tiny-image"
> +
> +do_install() {
> +	install -d ${D}/boot
> +	if [ -f ${DEPLOY_DIR_IMAGE}/${LPM_RAMFS_IMAGE}-${MACHINE}.cpio ]; then
> +		install -m 0644 ${DEPLOY_DIR_IMAGE}/${LPM_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
> +	else
> +		bberror "Could not find LPM ramfs image (${LPM_RAMFS_IMAGE}-${MACHINE}.cpio) in deploy dir!"
> +	fi
> +}
> +
> +do_install[depends] = "${LPM_RAMFS_IMAGE}:do_image_complete"
> +
> +FILES_${PN} = "/boot"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

