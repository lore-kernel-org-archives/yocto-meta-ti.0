Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86912C2BD09
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 15:06:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.523.1720537598949457502
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jul 2024 08:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 45ACD40CB4;
	Tue,  9 Jul 2024 15:06:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TtkYWbd2Agdr; Tue,  9 Jul 2024 15:06:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D6DD3407DA;
	Tue,  9 Jul 2024 15:06:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 72B62163FEC; Tue,  9 Jul 2024 11:06:27 -0400 (EDT)
Date: Tue, 9 Jul 2024 11:06:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: p-bhagat@ti.com
Cc: meta-ti@lists.yoctoproject.org, praneeth@ti.com, reatmon@ti.com,
	c-shilwant@ti.com, s-adivi@ti.com, khasim@ti.com, g-gupta@ti.com
Subject: Re: [meta-ti] [master/scarthgap][PATCH] recipes-ti: jailhouse:
 Update jailhouse for scarthgap
Message-ID: <20240709150627.GO18231@denix.org>
References: <20240709123359.3086351-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709123359.3086351-1-p-bhagat@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jul 2024 15:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17847

On Tue, Jul 09, 2024 at 06:03:59PM +0530, Paresh Bhagat via lists.yoctoproject.org wrote:
> Update SRCREV for jailhouse which incorporates makefile changes for
> scarthgap.
> Add ${ARAGO_IMAGE_SUFFIX} so that jailhouse can pick correct inmate

NAK - this is meta-ti, no Arago specifics here.


> image for RT build.
> Skip QA checks for usrmerge and buildpath. This is required to package
> jailhouse in image.
> Update FILES:${PN}.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>  .../recipes-ti/jailhouse/jailhouse_git.bb     | 20 +++++++++----------
>  .../recipes-ti/jailhouse/ti-jailhouse.inc     |  2 +-
>  2 files changed, 10 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> index 98ec0e9e..32e94dd0 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> +++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
> @@ -51,11 +51,11 @@ do_install() {
>  	install -d ${D}/boot
>  	if [ -n "${JH_RAMFS_IMAGE}" ]
>  	then
> -		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ]
> +		if [ -f ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio ]
>  		then
> -			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}-${MACHINE}.cpio ${D}/boot
> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio ${D}/boot
>  		else
> -			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}-${MACHINE}.cpio)!"
> +			bberror "Could not find JH_RAMFS_IMAGE (${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio)!"
>  			bberror "Please make sure that \"cpio\" is in IMAGE_FSTYPES."
>  		fi
>  	fi
> @@ -68,7 +68,7 @@ do_install() {
>  		./jailhouse-cell-linux -w ${D}${JH_DATADIR}/${JH_INMATE_DTB} \
>  			-a ${JH_ARCH} -c "${JH_CMDLINE}" \
>  			-d ../configs/${JH_ARCH}/dts/${JH_INMATE_DTB} \
> -			-i ${D}/boot/${JH_RAMFS_IMAGE}-${MACHINE}.cpio \
> +			-i ${D}/boot/${JH_RAMFS_IMAGE}${ARAGO_IMAGE_SUFFIX}-${MACHINE}.rootfs.cpio \
>  			${D}${CELL_DIR}/${JH_LINUX_DEMO_CELL} \
>  			${DEPLOY_DIR_IMAGE}/Image \
>  			| tr -cd '\11\12\15\40-\176' \
> @@ -96,7 +96,8 @@ RDEPENDS:pyjailhouse = "python3-core python3-ctypes python3-fcntl python3-shell"
>  
>  RRECOMMENDS:${PN} = "${PN}-tools"
>  
> -INSANE_SKIP:${PN} = "ldflags"
> +INSANE_SKIP:${PN} = "ldflags usrmerge"
> +INSANE_SKIP:${PN}-dbg = "usrmerge buildpaths"
>  
>  KERNEL_MODULE_AUTOLOAD += "jailhouse"
>  
> @@ -117,10 +118,7 @@ python __anonymous () {
>  }
>  
>  FILES:${PN} = " \
> -    /boot/* \
> -    /usr/libexec \
> -    /usr/sbin/* \
> -    /usr/libexec/* \
> -    /usr/share/* \
> -    /lib/firmware/* \
> +    /boot \
> +    /usr \
> +    /lib \
>  "
> diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> index 6faf16b8..2831e560 100644
> --- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> +++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
>  COMPATIBLE_MACHINE = "am62xx|am62pxx"
>  TARGET_CC_ARCH += "${LDFLAGS}"
>  PV = "0.12+git"
> -SRCREV = "603819ef9a771a3c253a141220daab8e61751a43"
> +SRCREV = "9b494ddf4bd8845a2c1063352d08a274ef61777b"
>  BRANCH = "master"
>  SRC_URI = " \
>      git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=https;branch=${BRANCH} \
> -- 
> 2.34.1

