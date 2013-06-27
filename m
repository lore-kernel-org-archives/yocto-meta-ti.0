Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E7A7E00722
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 09:27:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RGRc36005937
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 11:27:38 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RGRbgA003599
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 11:27:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Thu, 27 Jun 2013 11:27:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCHv3] recipes-kernel: Add GLSDK specific kernel
	tree	for omap-a15
Thread-Index: AQHOc09rhS/6GkedwkycKJmVU7acmZlJv8mw
Date: Thu, 27 Jun 2013 16:27:37 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015961CA92@DLEE11.ent.ti.com>
References: <20130627155932.GA6908@ti.com>
In-Reply-To: <20130627155932.GA6908@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv3] recipes-kernel: Add GLSDK specific kernel tree	for omap-a15
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Jun 2013 16:27:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Heroor, Siddharth
>Sent: Thursday, June 27, 2013 11:00 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCHv3] recipes-kernel: Add GLSDK specific
>kernel tree for omap-a15
>
>* Machine compatible with only omap-a15 devices.
>* The TI Staging tree will not be used to maintain K3.8. Instead,
>  this new tree is set up as a production tree. Pending features
>  for 3.8 will be implemented on this tree.
>  - Backported features from linux mainline
>  - Backported bug-fixes from linux mainline and linux-stable.
>  - Features implemented by the GLSDK team which maybe product
>    specific.
>  This is the tree on which GLSDK kernel releases will be made.
>* This recipe is based off the Core SDK 2013.04.02 released kernel
>  recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb
>
>v2:
>    Regenerate the patch using --find-copies-harder -M
>
>v3:
>
>* Set DEFAULT_PREFERENCE =3D -1. This will be overridden in the
>  glsdk branding in meta-arago.
>* Set MACHINE_KERNEL_PR_append to 'a+'. The basis for this
>  recipe is linux-ti-staging_3.8.bb, but since a new recipe is
>  created, we reset.
>* Remove comment on Core SDK version to avoid confusion.
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> .../{linux-ti-staging =3D> linux-ti-glsdk}/defconfig |    0
> recipes-kernel/linux/linux-ti-glsdk_3.8.bb         |   31
>++++++++++++++++++++
> 2 files changed, 31 insertions(+), 0 deletions(-)
> copy recipes-kernel/linux/{linux-ti-staging =3D> linux-ti-
>glsdk}/defconfig (100%)
> create mode 100644 recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>
>diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig
>b/recipes-kernel/linux/linux-ti-glsdk/defconfig
>similarity index 100%
>copy from recipes-kernel/linux/linux-ti-staging/defconfig
>copy to recipes-kernel/linux/linux-ti-glsdk/defconfig
>diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
>kernel/linux/linux-ti-glsdk_3.8.bb
>new file mode 100644
>index 0000000..2746188
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>@@ -0,0 +1,31 @@
>+SECTION =3D "kernel"
>+DESCRIPTION =3D "Linux kernel for TI devices supported by the GLSDK
>product"
>+LICENSE =3D "GPLv2"
>+LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>+KERNEL_IMAGETYPE =3D "uImage"
>+
>+inherit kernel
>+
>+require recipes-kernel/linux/linux-dtb.inc
>+require recipes-kernel/linux/setup-defconfig.inc
>+
>+KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts
>arch/arm/boot/dts/omap5-uevm.dts"
>+KERNEL_DEVICETREE_dra7xx-evm =3D "arch/arm/boot/dts/dra7-evm.dts"
>+
>+COMPATIBLE_MACHINE =3D "omap-a15"
>+
>+DEFAULT_PREFERENCE =3D "-1"
>+
>+S =3D "${WORKDIR}/git"
>+
>+BRANCH =3D "master"
>+
>+SRCREV =3D "4e8193eb3b7465d7f67cd8c7e6c2ed99dad1a483"
>+PV =3D "3.8.13"
>+
>+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>+MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+
>+SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>+           file://defconfig \
>+          "
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

