Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F45CA5FC7
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 16:24:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17676.1790785447982843060
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Sep 2026 09:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2425B40CD1;
	Wed, 30 Sep 2026 16:24:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UtKydY-nUFAP; Wed, 30 Sep 2026 16:24:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9FA2C40C2C;
	Wed, 30 Sep 2026 16:24:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 4823D17EEDD; Wed, 30 Sep 2026 12:24:00 -0400 (EDT)
Date: Wed, 30 Sep 2026 12:24:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-dubey@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com,
	a-limaye@ti.com, u-kumar1@ti.com, m-chawdhry@ti.com
Subject: Re: [meta-ti][master][PATCH v4 3/3] ti-core-initramfs: Extend with
 dm-verity support
Message-ID: <20260930162400.GJ4190@denix.org>
References: <20260930125938.95629-1-a-dubey@ti.com>
 <20260930125938.95629-3-a-dubey@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930125938.95629-3-a-dubey@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Sep 2026 16:24:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20427

On Wed, Sep 30, 2026 at 06:29:38PM +0530, Atharv Dubey via lists.yoctoproject.org wrote:
> Add dm-verity support to ti-core-initramfs by:
> - Enabling dm-verity modules and tools (cryptsetup, util-linux-mount) when DM_VERITY_IMAGE is set
> - Adding do_rootfs[nostamp] and do_image[nostamp] to rebuild initramfs after rootfs verity task completes
> - Making deploy_verity_hash gracefully handle missing .verity.env file on first pass with bbwarn
> 
> Signed-off-by: Atharv Dubey <a-dubey@ti.com>
> ---
>  .../machine/include/ti-core-initramfs.inc     |  4 +--
>  .../initramfs/ti-core-initramfs.bbappend      | 25 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 2 deletions(-)
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> index c816f1dc..08da8e80 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
> @@ -5,7 +5,7 @@
>  #   TI_CORE_INITRAMFS_ENABLED = "0"
>  #
>  #------------------------------------------------------------------------------
> -TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) else '0'}"
> +TI_CORE_INITRAMFS_ENABLED ?= "${@ '1' if d.getVar('TI_CORE_INITRAMFS_KERNEL_MODULES') or d.getVar('TI_CORE_INITRAMFS_EXTRA_INSTALL') or bb.utils.contains('DISTRO_FEATURES', 'luks', True, False, d) or d.getVar('DM_VERITY_IMAGE') else '0'}"
>  
>  TI_CORE_INITRAMFS_KERNEL_MODULES ?= ""
>  TI_CORE_INITRAMFS_EXTRA_INSTALL ?= ""
> @@ -22,4 +22,4 @@ TI_WKS_INITRAMFS ?= "${@ ',initrd=${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('
>  
>  IMAGE_BOOT_FILES += "${@ '${TI_CORE_INITRAMFS_IMAGE_FILE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
>  
> -INITRAMFS_IMAGE ?= "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> +INITRAMFS_IMAGE ?= "${@ '${TI_CORE_INITRAMFS_IMAGE}' if d.getVar('TI_CORE_INITRAMFS_ENABLED') == "1" else ''}"
> \ No newline at end of file

You are not changing the code here, but it shows as a diff because you lost 
the newline at the end of file.


> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
> new file mode 100644
> index 00000000..25fe775f
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
> @@ -0,0 +1,25 @@
> +# Install the essential utils for dm-verity in ti-core-initramfs
> +TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
> +
> +# Ensure dm-verity.env is updated also when rebuilding DM_VERITY_IMAGE
> +do_image[nostamp] = "1"
> +do_rootfs[nostamp] = "1"
> +
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +
> +deploy_verity_hash() {
> +    # The .verity.env file is created by the DM_VERITY_IMAGE build (e.g., arago-base-image).
> +    # On the first pass, it won't exist yet because the initramfs is built before the rootfs
> +    # (due to INITRAMFS_IMAGE dependency). The do_rootfs[nostamp] = "1" causes this task
> +    # to re-run after the rootfs is built, at which point the file will exist.
> +    if [ -f ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env ]; then
> +        install -D -m 0644 \
> +            ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env \
> +            ${IMAGE_ROOTFS}${datadir}/misc/dm-verity.env
> +    else
> +        bbwarn "dm-verity.env not found at ${STAGING_VERITY_DIR}/${DM_VERITY_IMAGE}.${DM_VERITY_IMAGE_TYPE}.verity.env - will retry on rebuild (nostamp)"
> +    fi
> +}
> +
> +
> +IMAGE_PREPROCESS_COMMAND += "deploy_verity_hash;"
> -- 
> 2.34.1

