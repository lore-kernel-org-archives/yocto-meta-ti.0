Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D93AC61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 17:45:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.839.1787939098604429860
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 10:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B36E140C56;
	Fri, 28 Aug 2026 17:44:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhT8Y4DRfyO4; Fri, 28 Aug 2026 17:44:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 283A140BA8;
	Fri, 28 Aug 2026 17:44:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C364817C887; Fri, 28 Aug 2026 13:44:48 -0400 (EDT)
Date: Fri, 28 Aug 2026 13:44:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: gehariprasath@ti.com
Cc: reatmon@ti.com, afd@ti.com, praneeth@ti.com, denys@konsulko.com,
	meta-ti@lists.yoctoproject.org, s-kapoor@ti.com, p-gupta5@ti.com,
	u-kumar1@ti.com
Subject: Re: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add
 recipe for TI-only dma-heap.h ioctl
Message-ID: <20260828174448.GK19759@denix.org>
References: <20260828145834.1304057-1-gehariprasath@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828145834.1304057-1-gehariprasath@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 17:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20307

On Fri, Aug 28, 2026 at 08:28:34PM +0530, Hari Prasath via lists.yoctoproject.org wrote:
> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
> downstream. The standard header provided by linux-libc-headers' wouldn't
> have the custom changes.Copy it straight from the kernel's staged
> source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
> path instead, for userspace code that needs it.
> 
> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
> ---
> 	v1->v2: Address review comments in commit message and recipe description
> 	v2->v3: Fix the patch subject prefix
> 
>  .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> 
> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> new file mode 100644
> index 000000000..5d570689a
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
> @@ -0,0 +1,17 @@
> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
> +DESCRIPTION = "Copies select UAPI headers straight from the TI vendor kernel source \
> +tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
> +that needs them but can't rely on linux-libc-headers carrying TI-only additions."
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +do_configure[depends] += "virtual/kernel:do_shared_workdir"

Why do you need this dependency for do_configure? Moreover, since you don't 
have do_configure nor do_compile, you might want to mark them as "noexec"


> +do_install[depends] += "virtual/kernel:do_shared_workdir"

How do you ensure that virtual/kernel is the TI vendor kernel? If it's not, 
you'll be copying the original unmodified header into the ti/linux location.


> +
> +do_install() {
> +    install -d ${D}${includedir}/ti/linux
> +    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
> +}
> +
> -- 
> 2.34.1

