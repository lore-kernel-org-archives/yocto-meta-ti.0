Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD967CA6002
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 20:11:21 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.759.1791403878382886924
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 07 Oct 2026 13:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2199940C86;
	Wed,  7 Oct 2026 20:11:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id enNIsY8WYwdD; Wed,  7 Oct 2026 20:11:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5B30F40B88;
	Wed,  7 Oct 2026 20:11:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5A5A817EEF3; Wed,  7 Oct 2026 16:11:09 -0400 (EDT)
Date: Wed, 7 Oct 2026 16:11:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: a-dubey@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, denys@konsulko.com,
	a-limaye@ti.com, u-kumar1@ti.com, m-chawdhry@ti.com
Subject: Re: [meta-ti][master][PATCH v5 1/3] dm-verity-upstream: Add
 dynamic layer for meta-security dm-verity
Message-ID: <20261007201109.GO4190@denix.org>
References: <20261005121218.844998-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005121218.844998-1-a-dubey@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 07 Oct 2026 20:11:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20444

Looks good to me, thank you for addressing the feedback comments.


On Mon, Oct 05, 2026 at 05:42:16PM +0530, Atharv Dubey via lists.yoctoproject.org wrote:
> Add an optional dynamic layer enabling dm-verity block-level integrity
> verification of the root filesystem for TI K3 platforms, using
> meta-security's stock dm-verity mechanism as-is. Requires meta-security
> to be present in bblayers.conf.
> 
> dm-verity hashes the rootfs at build time; at boot, a dedicated
> initramfs loads the root hash and the kernel checks every block read
> against it. Set DM_VERITY_IMAGE to enable all the verity-related
> recipes for that image; other images build as usual.
> 
> Signed-off-by: Atharv Dubey <a-dubey@ti.com>
> 
> ---
> v5:
>  - unify the python functions
> v4:
>  - Use ti-core-initramfs instead of a separate dm-verity initramfs
>  - Instead of a DISTRO_FEATURE, just check if DM_VERITY_IMAGE is set
> v3:
>  - Disabled the automount rules from udev-aragoconf, so don't need the
>    ignorelist for dm-verity
> v2:
>  - Replaced hardcoded /dev/mmcblk1p2 with a PARTUUID
> ---
>  meta-ti-bsp/conf/layer.conf                   |  3 +++
>  meta-ti-bsp/conf/machine/include/k3.inc       |  7 +++++++
>  .../conf/include/dm-verity-upstream.inc       | 21 +++++++++++++++++++
>  .../udev/udev-aragoconf_%.bbappend            |  5 +++++
>  .../udev/udev-extraconf_%.bbappend            |  6 ++++++
>  meta-ti-bsp/files/wic/k3-verity.wks.in        |  5 +++++
>  6 files changed, 47 insertions(+)
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
>  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
>  create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
> 
> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
> index 3cc54aa4..aca35cd3 100644
> --- a/meta-ti-bsp/conf/layer.conf
> +++ b/meta-ti-bsp/conf/layer.conf
> @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
>  LAYERRECOMMENDS_meta-ti-bsp = " \
>      openembedded-layer \
>      tpm-layer \
> +    security \
>  "
>  
>  BBFILES_DYNAMIC += " \
>      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
>      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
>      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappend \
>  "
>  
>  SIGGEN_EXCLUDERECIPES_ABISAFE += " \
> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
> index 2ebbfb9e..f19db45f 100644
> --- a/meta-ti-bsp/conf/machine/include/k3.inc
> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> @@ -64,3 +64,10 @@ FALCON_INCLUDE = ""
>  FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
>  
>  require ${FALCON_INCLUDE}
> +
> +# dm-verity protects the rootfs listed in DM_VERITY_IMAGE; see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc for what that turns on.
> +DM_VERITY_IMAGE ??= ""
> +
> +DM_VERITY_UPSTREAM_INCLUDE = "${@'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc' if d.getVar('DM_VERITY_IMAGE') else ''}"
> +
> +require ${DM_VERITY_UPSTREAM_INCLUDE}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
> new file mode 100644
> index 00000000..e9353fcc
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
> @@ -0,0 +1,21 @@
> +# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
> +DM_VERITY_IMAGE_TYPE = "ext4"
> +IMAGE_CLASSES += "dm-verity-img"
> +
> +# ti-core-initramfs.bbappend already wires the initramfs into the boot partition once dm-verity is enabled, so we don't need to do it here.
> +
> +python () {
> +    import uuid
> +
> +    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
> +        return
> +
> +    # Derive the root partition's UUID from MACHINE so everyone computes the same one.
> +    if not d.getVar('DM_VERITY_ROOT_PARTUUID'):
> +        d.setVar('DM_VERITY_ROOT_PARTUUID',
> +                 str(uuid.uuid5(uuid.NAMESPACE_DNS, 'dm-verity-root-%s' % d.getVar('MACHINE'))))
> +
> +    d.setVar('WKS_FILE', 'k3-verity.wks.in')
> +    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
> +    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR DM_VERITY_ROOT_PARTUUID')
> +}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
> new file mode 100644
> index 00000000..e5f6c1b2
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
> @@ -0,0 +1,5 @@
> +do_install:append() {
> +    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
> +        : > ${D}${libdir}/udev/rules.d/50-arago.rules
> +    fi
> +}
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
> new file mode 100644
> index 00000000..a14e21ea
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
> @@ -0,0 +1,6 @@
> +# Nothing should ever get auto-mounted under dm-verity, so just kill the automounter.
> +do_install:append() {
> +    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
> +        : > ${D}${sysconfdir}/udev/rules.d/automount.rules
> +    fi
> +}
> diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
> new file mode 100644
> index 00000000..62ae0ec1
> --- /dev/null
> +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
> @@ -0,0 +1,5 @@
> +# Disk layout for a board that boots with dm-verity enabled.
> +
> +bootloader --timeout=3 --append="rootfstype=ext4 root=PARTUUID=${DM_VERITY_ROOT_PARTUUID} ${TI_WKS_BOOTLOADER_APPEND}"
> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}${TI_WKS_INITRAMFS}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
> +part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024 --uuid ${DM_VERITY_ROOT_PARTUUID}
> -- 
> 2.34.1
> 

