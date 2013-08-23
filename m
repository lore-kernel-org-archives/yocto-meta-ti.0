Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E545E00343
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 13:03:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7NK3iwg016147;
	Fri, 23 Aug 2013 15:03:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7NK3iuM026719;
	Fri, 23 Aug 2013 15:03:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Fri, 23 Aug 2013 15:03:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] linux-ti-staging: add the latest
	integration tree in prep for 3.12 release
Thread-Index: AQHOoDthmCfM77O540G5eCuDMcTTO5mjNw6A
Date: Fri, 23 Aug 2013 20:03:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596DEF1F@DLEE11.ent.ti.com>
References: <1377287906-17115-1-git-send-email-denis@denix.org>
In-Reply-To: <1377287906-17115-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] linux-ti-staging: add the latest integration tree in prep for 3.12 release
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
X-List-Received-Date: Fri, 23 Aug 2013 20:03:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Although, I would ask why not call it _3.12 instead of _git.  But I'm OK ei=
ther way, just we will need to cut an _3.12 at some point.

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Denys Dmytriyenko
>Sent: Friday, August 23, 2013 2:58 PM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/4] linux-ti-staging: add the latest
>integration tree in prep for 3.12 release
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> recipes-kernel/linux/linux-ti-staging_git.bb | 42
>++++++++++++++++++++++++++++
> 1 file changed, 42 insertions(+)
> create mode 100644 recipes-kernel/linux/linux-ti-staging_git.bb
>
>diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb
>b/recipes-kernel/linux/linux-ti-staging_git.bb
>new file mode 100644
>index 0000000..cb59dbb
>--- /dev/null
>+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
>@@ -0,0 +1,42 @@
>+SECTION =3D "kernel"
>+DESCRIPTION =3D "Linux kernel for TI devices"
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
>+# Add a run-time dependency for the PM firmware to be installed
>+# on the target file system.
>+RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-cm3-initscript"
>+
>+# Default is to package all dts files for ti33x devices unless
>building
>+# for the specific beaglebone machine.
>+KERNEL_DEVICETREE_ti33x =3D "arch/arm/boot/dts/am335x-evm.dts
>arch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-
>bone.dts"
>+KERNEL_DEVICETREE_am437x-evm =3D "arch/arm/boot/dts/am43x-epos-
>evm.dts"
>+KERNEL_DEVICETREE_beaglebone =3D "arch/arm/boot/dts/am335x-
>bone.dts"
>+KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts
>arch/arm/boot/dts/omap5-uevm.dts"
>+KERNEL_DEVICETREE_dra7xx-evm =3D "arch/arm/boot/dts/dra7-evm.dts"
>+
>+KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT}"
>+
>+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15"
>+
>+DEFAULT_PREFERENCE =3D "-1"
>+
>+S =3D "${WORKDIR}/git"
>+
>+BRANCH =3D "ti-linux-3.12.y"
>+
>+SRCREV =3D "b36f4be3de1b123d8601de062e7dbfc904f305fb"
>+PV =3D "3.10+3.11-rc6"
>+
>+# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause
>a rebuild
>+MACHINE_KERNEL_PR_append =3D "a+gitr${SRCPV}"
>+
>+SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-
>kernel.git;protocol=3Dgit;branch=3D${BRANCH} \
>+           file://defconfig \
>+          "
>--
>1.8.3.2
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

