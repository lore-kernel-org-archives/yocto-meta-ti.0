Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B62D262B1
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 00:14:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1179.1768954475222831337
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 16:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 578A940C6C;
	Wed, 21 Jan 2026 00:14:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyDrxSgXnfVT; Wed, 21 Jan 2026 00:14:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1240A407E5;
	Wed, 21 Jan 2026 00:14:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5E419177BCC; Tue, 20 Jan 2026 19:14:30 -0500 (EST)
Date: Tue, 20 Jan 2026 19:14:30 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][master][PATCH v2] ti-core-initramfs: Shrink size of
 initramfs
Message-ID: <20260121001430.GY11121@denix.org>
References: <20260109182737.2973551-1-reatmon@ti.com>
 <188C8BB97D98E175.3496637@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <188C8BB97D98E175.3496637@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jan 2026 00:14:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19432

So, if systemd is required and to respect other VIRTUAL_RUNTIME vars, need to 
double the initramfs size to 128 MB.

Yes, maybe systemd recipe in OE-Core needs more granular packaging for only 
pulling minimal dependencies in order to get even smaller...

========================= 
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
index c759808c..5ed9391e 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -11,6 +11,12 @@ TI_INITRAMFS_KERNEL_MODULES ?= ""
 RDEPENDS:${PN} += "\
     ${TI_INITRAMFS_KERNEL_MODULES} \
     ${VIRTUAL-RUNTIME_base-utils} \
+    ${VIRTUAL-RUNTIME_login_manager} \
+    ${VIRTUAL-RUNTIME_init_manager} \
+    ${VIRTUAL-RUNTIME_dev_manager} \
+    ${VIRTUAL-RUNTIME_update-alternatives} \
+    netbase \
+    base-files \
     base-passwd \
     initramfs-framework-base \
     initramfs-module-udev \
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index 223fef7a..ddf4e5b4 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 INITRAMFS_FSTYPES = "cpio cpio.xz"
 
-INITRAMFS_MAXSIZE = "65536"
+INITRAMFS_MAXSIZE = "131072"
 
 IMAGE_NAME = "ti-core-initramfs"
========================= 
 


On Tue, Jan 20, 2026 at 03:52:56PM -0500, Denys Dmytriyenko wrote:
> I'm not sure this is a fully correct change for the ti-core-initramfs.
> It might be fine for the tisdk-tiny-initramfs though.
> 
> If I recall, the requirement was for this initramfs to use systemd as 
> init manager...
> 
> 
> On Fri, Jan 09, 2026 at 12:27:37PM -0600, Ryan Eatmon via lists.yoctoproject.org wrote:
> > License-Update: Moving away from packagegroup-core-boot.bb removed the
> > LICENSE setting.  Just adding it back in.
> > 
> > It looks like we were modelling this initramfs off of the wrong example
> > from poky.  This setup produces a much smaller initramfs.
> > 
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > ---
> > v2: Add missing License-Udate.
> > 
> >  .../packagegroup-ti-core-initramfs.bb         | 12 ++++---
> >  .../recipes-ti/initramfs/ti-core-initramfs.bb | 33 +++++++++----------
> >  2 files changed, 22 insertions(+), 23 deletions(-)
> > 
> > diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> > index 86b69aff..c759808c 100644
> > --- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> > +++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
> > @@ -1,16 +1,18 @@
> >  SUMMARY = "Minimal initramfs for boot requirements"
> >  
> > -require recipes-core/packagegroups/packagegroup-core-boot.bb
> > +LICENSE = "MIT"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +inherit packagegroup
> >  
> >  TI_INITRAMFS_KERNEL_MODULES ?= ""
> >  
> >  RDEPENDS:${PN} += "\
> >      ${TI_INITRAMFS_KERNEL_MODULES} \
> > +    ${VIRTUAL-RUNTIME_base-utils} \
> > +    base-passwd \
> >      initramfs-framework-base \
> >      initramfs-module-udev \
> >      initramfs-module-nfsrootfs \
> > -    nfs-utils \
> > -    nfs-utils-client \
> >  "
> > -
> > -RDEPENDS:${PN}:remove = "grub-efi kernel"
> > diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > index 1a102d82..223fef7a 100644
> > --- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
> > @@ -7,29 +7,26 @@ DESCRIPTION = "Image meant to probe boot essential modules\
> >  
> >  LICENSE = "MIT"
> >  
> > -inherit core-image
> > -
> > -IMAGE_NAME = "ti-core-initramfs"
> > -
> > -IMAGE_NAME_SUFFIX = ""
> > +INITRAMFS_FSTYPES = "cpio cpio.xz"
> >  
> > -IMAGE_FEATURES:remove = "package-management"
> > +INITRAMFS_MAXSIZE = "65536"
> >  
> > -INITRAMFS_FSTYPES = "cpio cpio.xz"
> > +IMAGE_NAME = "ti-core-initramfs"
> >  
> > -IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> > +export IMAGE_BASENAME = "${IMAGE_NAME}"
> >  
> >  PACKAGE_INSTALL = "packagegroup-ti-core-initramfs"
> >  
> > -export IMAGE_BASENAME = "${IMAGE_NAME}"
> > +# Ensure the initramfs only contains the bare minimum
> > +IMAGE_FEATURES = ""
> > +IMAGE_LINGUAS = ""
> >  
> > -IMAGE_OVERHEAD_FACTOR = "1.1"
> > +# on the kernel image.
> > +PACKAGE_EXCLUDE = "kernel-image-*"
> > +
> > +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> > +IMAGE_NAME_SUFFIX ?= ""
> > +IMAGE_ROOTFS_SIZE = "8192"
> > +IMAGE_ROOTFS_EXTRA_SPACE = "0"
> >  
> > -# To further reduce the size of the rootfs, remove the /boot directory from
> > -# the final image this is usually done by adding RDEPENDS_kernel-base = ""
> > -# in the configuration file. In our case we can't use this method. Instead we
> > -# just wipe out the content of "/boot" before creating the image.
> > -ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
> > -empty_boot_dir () {
> > -	rm -rf ${IMAGE_ROOTFS}/boot/*
> > -}
> > +inherit image
> > -- 
> > 2.43.0

