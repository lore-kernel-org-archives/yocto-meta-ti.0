Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E036EE015ED
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 06:51:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8ODpq4X010526;
	Tue, 24 Sep 2013 08:51:52 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8ODpqJn014150;
	Tue, 24 Sep 2013 08:51:52 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 08:51:52 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE
	from recipes, let machine config set it
Thread-Index: AQHOuM29vOGDmgXwS0mi8rOrIj4k4pnU6MHA
Date: Tue, 24 Sep 2013 13:51:52 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015974751E@DLEE11.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>
In-Reply-To: <1379989631-8098-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config set it
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
X-List-Received-Date: Tue, 24 Sep 2013 13:51:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, September 23, 2013 9:27 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/4] linux*: don't force
>KERNEL_IMAGETYPE from recipes, let machine config set it
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/linux-am335x-psp_3.2.bb      | 2 --
> recipes-kernel/linux/linux-davinci_git.bb         | 1 -
> recipes-kernel/linux/linux-mainline_3.2.bb        | 1 -
> recipes-kernel/linux/linux-omap-psp_2.6.32.bb     | 1 -
> recipes-kernel/linux/linux-omap_2.6.37.bb         | 1 -
> recipes-kernel/linux/linux-omap_2.6.39.bb         | 1 -
> recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 1 -
> recipes-kernel/linux/linux-ti-glsdk_3.8.bb        | 1 -
> recipes-kernel/linux/linux-ti-staging_3.8.bb      | 1 -
> recipes-kernel/linux/linux-ti-staging_git.bb      | 1 -
> recipes-kernel/linux/linux-ti33x-psp_3.2.bb       | 1 -
> recipes-kernel/linux/linux_3.0.bb                 | 1 -
> recipes-kernel/linux/linux_3.1.bb                 | 1 -
> recipes-kernel/linux/linux_3.3.7.bb               | 2 --
> 14 files changed, 16 deletions(-)
>
>diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
>b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
>index eaf788f..b5783eb 100644
>--- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
>+++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
>@@ -12,8 +12,6 @@ require setup-defconfig.inc
> # Stage the power management firmware before building the kernel
> DEPENDS +=3D "am33x-cm3"
>
>-KERNEL_IMAGETYPE =3D "uImage"
>-
> # The main PR is now using MACHINE_KERNEL_PR, for ti33x see
>conf/machine/include/ti33x.inc
> MACHINE_KERNEL_PR_append =3D "h+gitr${SRCPV}"
>
>diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-
>kernel/linux/linux-davinci_git.bb
>index e4b85d6..03eeb46 100644
>--- a/recipes-kernel/linux/linux-davinci_git.bb
>+++ b/recipes-kernel/linux/linux-davinci_git.bb
>@@ -1,7 +1,6 @@
> require multi-kernel.inc
>
> DESCRIPTION =3D "Linux kernel for DaVinci processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> COMPATIBLE_MACHINE =3D "hawkboard"
>
>diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-
>kernel/linux/linux-mainline_3.2.bb
>index 7eafdfa..7b4a2a2 100644
>--- a/recipes-kernel/linux/linux-mainline_3.2.bb
>+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
>@@ -1,7 +1,6 @@
> require linux.inc
>
> DESCRIPTION =3D "Linux kernel for TI processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> COMPATIBLE_MACHINE =3D "(beagleboard)"
>
>diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>index 61fc24f..9f7c472 100644
>--- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>+++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
>@@ -3,7 +3,6 @@ require multi-kernel.inc
> MULTI_CONFIG_BASE_SUFFIX =3D ""
>
> DESCRIPTION =3D "Linux kernel for OMAP processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> COMPATIBLE_MACHINE =3D "am3517-crane|beagleboard|omap3evm|am3517-
>evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
>
>diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-
>kernel/linux/linux-omap_2.6.37.bb
>index 62076fb..0a14cc8 100644
>--- a/recipes-kernel/linux/linux-omap_2.6.37.bb
>+++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
>@@ -1,7 +1,6 @@
> require multi-kernel.inc
>
> DESCRIPTION =3D "Linux kernel for OMAP processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> COMPATIBLE_MACHINE =3D "(beagleboard|overo|omap3evm|omap3-
>touchbook)"
>
>diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-
>kernel/linux/linux-omap_2.6.39.bb
>index ae90ad2..430fa09 100644
>--- a/recipes-kernel/linux/linux-omap_2.6.39.bb
>+++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
>@@ -1,7 +1,6 @@
> require linux.inc
>
> DESCRIPTION =3D "Linux kernel for OMAP processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> COMPATIBLE_MACHINE =3D "(beagleboard)"
>
>diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
>b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
>index e4a5451..a138fb6 100644
>--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
>+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
>@@ -1,7 +1,6 @@
> SECTION =3D "kernel"
> DESCRIPTION =3D "Linux kernel for OMAPL1 machines from PSP, based
>on linux-davinci kernel"
> LICENSE =3D "GPLv2"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> require multi-kernel.inc
> require tipspkernel.inc
>diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
>kernel/linux/linux-ti-glsdk_3.8.bb
>index 5fd17f8..09204a6 100644
>--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
>@@ -2,7 +2,6 @@ SECTION =3D "kernel"
> DESCRIPTION =3D "Linux kernel for TI devices supported by the GLSDK
>product"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> inherit kernel
>
>diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb
>b/recipes-kernel/linux/linux-ti-staging_3.8.bb
>index fd7b671..f0659f2 100644
>--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
>@@ -2,7 +2,6 @@ SECTION =3D "kernel"
> DESCRIPTION =3D "Linux kernel for TI devices"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> inherit kernel
>
>diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
>b/recipes-kernel/linux/linux-ti-staging_git.bb
>index 694a164..d3d11d2 100644
>--- a/recipes-kernel/linux/linux-ti-staging_git.bb
>+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
>@@ -2,7 +2,6 @@ SECTION =3D "kernel"
> DESCRIPTION =3D "Linux kernel for TI devices"
> LICENSE =3D "GPLv2"
> LIC_FILES_CHKSUM =3D
>"file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> inherit kernel
>
>diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>index 4200d03..a9f7ac2 100644
>--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
>@@ -1,7 +1,6 @@
> SECTION =3D "kernel"
> DESCRIPTION =3D "Linux kernel for TI33x EVM from PSP, based on
>am335x-kernel"
> LICENSE =3D "GPLv2"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> require multi-kernel.inc
> require tipspkernel.inc
>diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-
>kernel/linux/linux_3.0.bb
>index 522a87d..3aae2ca 100644
>--- a/recipes-kernel/linux/linux_3.0.bb
>+++ b/recipes-kernel/linux/linux_3.0.bb
>@@ -1,7 +1,6 @@
> require linux.inc
>
> DESCRIPTION =3D "Linux kernel for TI processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> COMPATIBLE_MACHINE =3D "(beagleboard)"
>
>diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-
>kernel/linux/linux_3.1.bb
>index d6ed98c..110d26c 100644
>--- a/recipes-kernel/linux/linux_3.1.bb
>+++ b/recipes-kernel/linux/linux_3.1.bb
>@@ -3,7 +3,6 @@ require linux.inc
> COMPATIBLE_MACHINE =3D "beagleboard"
>
> DESCRIPTION =3D "Linux kernel for TI processors"
>-KERNEL_IMAGETYPE =3D "uImage"
>
> DEFAULT_PREFERENCE =3D "-99"
>
>diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-
>kernel/linux/linux_3.3.7.bb
>index e38b6c2..aca5c53 100644
>--- a/recipes-kernel/linux/linux_3.3.7.bb
>+++ b/recipes-kernel/linux/linux_3.3.7.bb
>@@ -11,8 +11,6 @@ COMPATIBLE_MACHINE =3D "beagleboard"
> inherit kernel
> require setup-defconfig.inc
>
>-KERNEL_IMAGETYPE =3D "uImage"
>-
> # The main PR is now using MACHINE_KERNEL_PR, for beagleboard see
> # conf/machine/include/omap3.inc
> MACHINE_KERNEL_PR_append =3D "b+gitr${SRCREV}"
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

