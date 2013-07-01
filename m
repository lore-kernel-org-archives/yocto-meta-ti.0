Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C988E013B0
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 06:41:45 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61DfiXv029050
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:41:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61Dfif6004474
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 08:41:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 08:41:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/2] recipes-bsp: Add recipe for PowerVR
	SGX544MP2 kernel drivers
Thread-Index: AQHOdlb37m0KmxqkPUGeAhsWg5sRMZlP0z4w
Date: Mon, 1 Jul 2013 13:41:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962B49B@DLEE11.ent.ti.com>
References: <20130701123138.GA16101@ti.com>
In-Reply-To: <20130701123138.GA16101@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] recipes-bsp: Add recipe for PowerVR SGX544MP2 kernel drivers
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
X-List-Received-Date: Mon, 01 Jul 2013 13:41:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>bounces@yoctoproject.org] On Behalf Of Hingolikar, Mrinmayee
>Sent: Monday, July 01, 2013 7:32 AM
>To: meta-ti@yoctoproject.org
>Subject: [meta-ti] [PATCH 1/2] recipes-bsp: Add recipe for PowerVR
>SGX544MP2 kernel drivers
>
>* The PowerVR SGX544MP2 is found on omap5 and dra7xx devices. This
>  recipe adds support for the PowerVR graphics subsystem.
>
>Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   42
>++++++++++++++++++++
> 1 files changed, 42 insertions(+), 0 deletions(-)
> create mode 100644 recipes-bsp/powervr-drivers/omapdrm-
>pvr_1.9.2253347.bb
>
>diff --git a/recipes-bsp/powervr-drivers/omapdrm-
>pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-
>pvr_1.9.2253347.bb
>new file mode 100644
>index 0000000..edb2682
>--- /dev/null
>+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
>@@ -0,0 +1,42 @@
>+DESCRIPTION =3D  "Kernel drivers for the PowerVR SGX chipset found
>in the omap5 SoCs"
>+HOMEPAGE =3D "http://git.ti.com"
>+LICENSE =3D "GPLv2"
>+
>+LIC_FILES_CHKSUM =3D "file://MIT-
>COPYING;md5=3D8c2810fa6bfdc5ae5c15a0c1ade34054"

I see an issue with you setting the LICENSE to GPLv2 but having the file yo=
u are checking be MIT-COPYING.  This seems wrong.

>+
>+inherit module
>+
>+SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-
>linux.git;protocol=3Dgit"
>+S =3D "${WORKDIR}/git"
>+
>+SRCREV =3D "6668f4ea0bbf7e3df7f72dc2230ab8da1e748b2d"
>+PR =3D "${MACHINE_KERNEL_PR}"
>+
>+do_compile() {
>+    cd ${S}/eurasiacon/build/linux2/omap5430_linux
>+    oe_runmake KERNELDIR=3D"${STAGING_KERNEL_DIR}"
>+}

I think you could do a do_compile_prepend here to perform the cd command an=
d set EXTRA_OEMAKE to include the KERNELDIR setting.  That way you don't ha=
ve to override the entire do_compile function.

>+
>+do_install() {
>+    mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
>+    cp
>${S}/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapd
>rm_pvr.ko \
>+    ${D}/lib/modules/${KERNEL_VERSION}/extra/
>+}

Can you not use the default do_install in the module.bbclass?  As long as y=
our makefile can handle modules_install you should be fine here.

>+
>+FILES_omapdrm-pvr =3D
>"/lib/modules/${KERNEL_VERSION}/extra/omapdrm_pvr.ko"

The FILES setting in module.bbclass should pick this us out of /lib/modules

>+RDEPENDS_omapdrm-pvr +=3D "update-modules"

This RDEPENDS is already part of module.bbclass

>+
>+pkg_postinst_omapdrm-pvr () {
>+#!/bin/sh
>+if [ -n "$D" ]; then
>+        exit 1
>+fi
>+
>+depmod -a
>+update-modules || true
>+}
>+
>+pkg_postrm_omapdrm-pvr () {
>+#!/bin/sh
>+update-modules || true

Why did you need to define these functions?  The module.bbclass that you in=
herit already has:

pkg_postinst_append () {
if [ -z "$D" ]; then
    depmod -a
    update-modules || true
fi
}

pkg_postrm_append () {
update-modules || true
}

Won't these work for you?

>+}
>--
>1.7.0.4
>
>_______________________________________________
>meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti

