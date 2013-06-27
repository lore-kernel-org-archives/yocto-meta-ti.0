Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A69B4E005B3
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 06:52:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RDqguZ013590
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:52:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RDqgBb028544
	for <meta-ti@yoctoproject.org>; Thu, 27 Jun 2013 08:52:42 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 27 Jun 2013 08:52:42 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Thu, 27 Jun 2013 08:52:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>
Thread-Topic: [meta-ti] [PATCH] recipes-kernel: Add GLSDK specific kernel
	tree	for omap-a15
Thread-Index: AQHOcz0f/0XhcwVVJUSFegh+H0GGMJlJlLX4
Date: Thu, 27 Jun 2013 13:52:41 +0000
Message-ID: <9C1727E2-7531-40E7-A6D7-961A465D6720@ti.com>
References: <20130627134905.GA6760@ti.com>
In-Reply-To: <20130627134905.GA6760@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] recipes-kernel: Add GLSDK specific kernel tree	for omap-a15
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
X-List-Received-Date: Thu, 27 Jun 2013 13:52:45 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9C1727E2753140E7A6D7961A465D6720ticom_"

--_000_9C1727E2753140E7A6D7961A465D6720ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good. I would also recommend in the future if you create an updated v=
ersion of a patch to update the patch title to reflect the new version.

Ex
 [meta-ti] [PATCH v2] recipes-kernel: Add GLSDK specific kernel tree for om=
ap-a15

On Jun 27, 2013, at 8:49 AM, "Heroor, Siddharth" <heroor@ti.com<mailto:hero=
or@ti.com>> wrote:

* Machine compatible with only omap-a15 devices.
* The TI Staging tree will not be used to maintain K3.8. Instead,
 this new tree is set up as a production tree. Pending features
 for 3.8 will be implemented on this tree.
 - Backported features from linux mainline
 - Backported bug-fixes from linux mainline and linux-stable.
 - Features implemented by the GLSDK team which maybe product
   specific.
 This is the tree on which GLSDK kernel releases will be made.
* This recipe is based off the Core SDK 2013.04.02 released kernel
 recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb

v2:
   Regenerate the patch using --find-copies-harder -M

Signed-off-by: Siddharth Heroor <heroor@ti.com<mailto:heroor@ti.com>>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com<mailto:mrinmayee@ti.com>>
---
.../{linux-ti-staging =3D> linux-ti-glsdk}/defconfig |    0
...nux-ti-staging_3.8.bb =3D> linux-ti-glsdk_3.8.bb} |   16 ++++-----------=
-
2 files changed, 4 insertions(+), 12 deletions(-)
copy recipes-kernel/linux/{linux-ti-staging =3D> linux-ti-glsdk}/defconfig =
(100%)
copy recipes-kernel/linux/{linux-ti-staging_3.8.bb =3D> linux-ti-glsdk_3.8.=
bb} (51%)

diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kern=
el/linux/linux-ti-glsdk/defconfig
similarity index 100%
copy from recipes-kernel/linux/linux-ti-staging/defconfig
copy to recipes-kernel/linux/linux-ti-glsdk/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/=
linux/linux-ti-glsdk_3.8.bb
similarity index 51%
copy from recipes-kernel/linux/linux-ti-staging_3.8.bb
copy to recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 29ffebc..8d66f84 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -1,5 +1,5 @@
SECTION =3D "kernel"
-DESCRIPTION =3D "Linux kernel for TI devices"
+DESCRIPTION =3D "Linux kernel for TI devices supported by the GLSDK produc=
t"
LICENSE =3D "GPLv2"
LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7=
"
KERNEL_IMAGETYPE =3D "uImage"
@@ -9,22 +9,14 @@ inherit kernel
require recipes-kernel/linux/linux-dtb.inc
require recipes-kernel/linux/setup-defconfig.inc

-# Add a run-time dependency for the PM firmware to be installed
-# on the target file system.
-RDEPENDS_kernel-base_ti33x +=3D "am33x-cm3 am33x-cm3-initscript"
-
-# Default is to package all dts files for ti33x devices unless building
-# for the specific beaglebone machine.
-KERNEL_DEVICETREE_ti33x =3D "arch/arm/boot/dts/am335x-evm.dts arch/arm/boo=
t/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts"
-KERNEL_DEVICETREE_beaglebone =3D "arch/arm/boot/dts/am335x-bone.dts"
KERNEL_DEVICETREE_omap5-evm =3D "arch/arm/boot/dts/omap5-sevm.dts arch/arm/=
boot/dts/omap5-uevm.dts"
KERNEL_DEVICETREE_dra7xx-evm =3D "arch/arm/boot/dts/dra7-evm.dts"

-COMPATIBLE_MACHINE =3D "ti33x|omap-a15"
+COMPATIBLE_MACHINE =3D "omap-a15"

S =3D "${WORKDIR}/git"

-BRANCH =3D "ti-linux-3.8.y"
+BRANCH =3D "master"

# This commit corresponds to ti2013.04.02 release tag
SRCREV =3D "f3cb62a800ae37f17a3382b10d155ee02dbc83fc"
@@ -33,6 +25,6 @@ PV =3D "3.8.13"
# Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
MACHINE_KERNEL_PR_append =3D "f+gitr${SRCPV}"

-SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=
=3Dgit;branch=3D${BRANCH} \
+SRC_URI =3D "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;pr=
otocol=3Dgit;branch=3D${BRANCH} \
           file://defconfig \
          "
--
1.7.0.4

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_9C1727E2753140E7A6D7961A465D6720ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
<div style=3D"-webkit-text-size-adjust: auto; ">Looks good. I would also re=
commend in the future if you create an updated version of a patch to update=
 the patch title to reflect the new version.</div>
<div style=3D"-webkit-text-size-adjust: auto; "><br>
</div>
<div style=3D"-webkit-text-size-adjust: auto; ">Ex</div>
<div style=3D"-webkit-text-size-adjust: auto; "><span style=3D"font-family:=
 '.HelveticaNeueUI'; font-size: 15px; line-height: 19px; white-space: nowra=
p; -webkit-tap-highlight-color: rgba(26, 26, 26, 0.296875); -webkit-composi=
tion-fill-color: rgba(175, 192, 227, 0.230469); -webkit-composition-frame-c=
olor: rgba(77, 128, 180, 0.230469); -webkit-text-size-adjust: none; ">&nbsp=
;[meta-ti]
 [PATCH v2] recipes-kernel: Add GLSDK specific kernel tree</span><span clas=
s=3D"Apple-tab-span" style=3D"font-family: '.HelveticaNeueUI'; font-size: 1=
5px; line-height: 19px; -webkit-tap-highlight-color: rgba(26, 26, 26, 0.296=
875); -webkit-composition-fill-color: rgba(175, 192, 227, 0.230469); -webki=
t-composition-frame-color: rgba(77, 128, 180, 0.230469); -webkit-text-size-=
adjust: none; white-space: pre; ">
</span><span style=3D"font-family: '.HelveticaNeueUI'; font-size: 15px; lin=
e-height: 19px; white-space: nowrap; -webkit-tap-highlight-color: rgba(26, =
26, 26, 0.296875); -webkit-composition-fill-color: rgba(175, 192, 227, 0.23=
0469); -webkit-composition-frame-color: rgba(77, 128, 180, 0.230469); -webk=
it-text-size-adjust: none; ">for
 omap-a15</span></div>
<div><font face=3D".HelveticaNeueUI"><span style=3D"font-size: 15px; line-h=
eight: 19px; white-space: nowrap; -webkit-tap-highlight-color: rgba(26, 26,=
 26, 0.292969); -webkit-composition-fill-color: rgba(175, 192, 227, 0.23046=
9); -webkit-composition-frame-color: rgba(77, 128, 180, 0.230469);"><br>
</span></font><span style=3D"-webkit-text-size-adjust: auto;">On Jun 27, 20=
13, at 8:49 AM, &quot;Heroor, Siddharth&quot; &lt;<a href=3D"mailto:heroor@=
ti.com">heroor@ti.com</a>&gt; wrote:</span><br>
<br>
</div>
<blockquote type=3D"cite" style=3D"-webkit-text-size-adjust: auto; ">
<div><span>* Machine compatible with only omap-a15 devices.</span><br>
<span>* The TI Staging tree will not be used to maintain K3.8. Instead,</sp=
an><br>
<span>&nbsp;this new tree is set up as a production tree. Pending features<=
/span><br>
<span>&nbsp;for 3.8 will be implemented on this tree.</span><br>
<span>&nbsp;- Backported features from linux mainline</span><br>
<span>&nbsp;- Backported bug-fixes from linux mainline and linux-stable.</s=
pan><br>
<span>&nbsp;- Features implemented by the GLSDK team which maybe product</s=
pan><br>
<span>&nbsp;&nbsp;&nbsp;specific.</span><br>
<span>&nbsp;This is the tree on which GLSDK kernel releases will be made.</=
span><br>
<span>* This recipe is based off the Core SDK 2013.04.02 released kernel</s=
pan><br>
<span>&nbsp;recipe - recipes-kernel/linux/linux-ti-staging_3.8.bb</span><br=
>
<span></span><br>
<span>v2:</span><br>
<span>&nbsp;&nbsp;&nbsp;Regenerate the patch using --find-copies-harder -M<=
/span><br>
<span></span><br>
<span>Signed-off-by: Siddharth Heroor &lt;<a href=3D"mailto:heroor@ti.com">=
heroor@ti.com</a>&gt;</span><br>
<span>cc: Mrinmayee Hingolikar &lt;<a href=3D"mailto:mrinmayee@ti.com">mrin=
mayee@ti.com</a>&gt;</span><br>
<span>---</span><br>
<span>.../{linux-ti-staging =3D&gt; linux-ti-glsdk}/defconfig | &nbsp;&nbsp=
;&nbsp;0</span><br>
<span>...nux-ti-staging_3.8.bb =3D&gt; linux-ti-glsdk_3.8.bb} | &nbsp;&nbsp=
;16 &#43;&#43;&#43;&#43;------------</span><br>
<span>2 files changed, 4 insertions(&#43;), 12 deletions(-)</span><br>
<span>copy recipes-kernel/linux/{linux-ti-staging =3D&gt; linux-ti-glsdk}/d=
efconfig (100%)</span><br>
<span>copy recipes-kernel/linux/{linux-ti-staging_3.8.bb =3D&gt; linux-ti-g=
lsdk_3.8.bb} (51%)</span><br>
<span></span><br>
<span>diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipe=
s-kernel/linux/linux-ti-glsdk/defconfig</span><br>
<span>similarity index 100%</span><br>
<span>copy from recipes-kernel/linux/linux-ti-staging/defconfig</span><br>
<span>copy to recipes-kernel/linux/linux-ti-glsdk/defconfig</span><br>
<span>diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-k=
ernel/linux/linux-ti-glsdk_3.8.bb</span><br>
<span>similarity index 51%</span><br>
<span>copy from recipes-kernel/linux/linux-ti-staging_3.8.bb</span><br>
<span>copy to recipes-kernel/linux/linux-ti-glsdk_3.8.bb</span><br>
<span>index 29ffebc..8d66f84 100644</span><br>
<span>--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb</span><br>
<span>&#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb</span><b=
r>
<span>@@ -1,5 &#43;1,5 @@</span><br>
<span>SECTION =3D &quot;kernel&quot;</span><br>
<span>-DESCRIPTION =3D &quot;Linux kernel for TI devices&quot;</span><br>
<span>&#43;DESCRIPTION =3D &quot;Linux kernel for TI devices supported by t=
he GLSDK product&quot;</span><br>
<span>LICENSE =3D &quot;GPLv2&quot;</span><br>
<span>LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd7810fab7487fb0aad327=
b76f1be7cd7&quot;</span><br>
<span>KERNEL_IMAGETYPE =3D &quot;uImage&quot;</span><br>
<span>@@ -9,22 &#43;9,14 @@ inherit kernel</span><br>
<span>require recipes-kernel/linux/linux-dtb.inc</span><br>
<span>require recipes-kernel/linux/setup-defconfig.inc</span><br>
<span></span><br>
<span>-# Add a run-time dependency for the PM firmware to be installed</spa=
n><br>
<span>-# on the target file system.</span><br>
<span>-RDEPENDS_kernel-base_ti33x &#43;=3D &quot;am33x-cm3 am33x-cm3-initsc=
ript&quot;</span><br>
<span>-</span><br>
<span>-# Default is to package all dts files for ti33x devices unless build=
ing</span><br>
<span>-# for the specific beaglebone machine.</span><br>
<span>-KERNEL_DEVICETREE_ti33x =3D &quot;arch/arm/boot/dts/am335x-evm.dts a=
rch/arm/boot/dts/am335x-evmsk.dts arch/arm/boot/dts/am335x-bone.dts&quot;</=
span><br>
<span>-KERNEL_DEVICETREE_beaglebone =3D &quot;arch/arm/boot/dts/am335x-bone=
.dts&quot;</span><br>
<span>KERNEL_DEVICETREE_omap5-evm =3D &quot;arch/arm/boot/dts/omap5-sevm.dt=
s arch/arm/boot/dts/omap5-uevm.dts&quot;</span><br>
<span>KERNEL_DEVICETREE_dra7xx-evm =3D &quot;arch/arm/boot/dts/dra7-evm.dts=
&quot;</span><br>
<span></span><br>
<span>-COMPATIBLE_MACHINE =3D &quot;ti33x|omap-a15&quot;</span><br>
<span>&#43;COMPATIBLE_MACHINE =3D &quot;omap-a15&quot;</span><br>
<span></span><br>
<span>S =3D &quot;${WORKDIR}/git&quot;</span><br>
<span></span><br>
<span>-BRANCH =3D &quot;ti-linux-3.8.y&quot;</span><br>
<span>&#43;BRANCH =3D &quot;master&quot;</span><br>
<span></span><br>
<span># This commit corresponds to ti2013.04.02 release tag</span><br>
<span>SRCREV =3D &quot;f3cb62a800ae37f17a3382b10d155ee02dbc83fc&quot;</span=
><br>
<span>@@ -33,6 &#43;25,6 @@ PV =3D &quot;3.8.13&quot;</span><br>
<span># Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a r=
ebuild</span><br>
<span>MACHINE_KERNEL_PR_append =3D &quot;f&#43;gitr${SRCPV}&quot;</span><br=
>
<span></span><br>
<span>-SRC_URI =3D &quot;git://git.ti.com/ti-linux-kernel/ti-linux-kernel.g=
it;protocol=3Dgit;branch=3D${BRANCH} \</span><br>
<span>&#43;SRC_URI =3D &quot;git://git.ti.com/ti-linux-kernel/ti-linux-3-8-=
y-kernel.git;protocol=3Dgit;branch=3D${BRANCH} \</span><br>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fil=
e://defconfig \</span><br>
<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&quot;</s=
pan><br>
<span>-- </span><br>
<span>1.7.0.4</span><br>
<span></span><br>
<span>_______________________________________________</span><br>
<span>meta-ti mailing list</span><br>
<span><a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org<=
/a></span><br>
<span><a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://l=
ists.yoctoproject.org/listinfo/meta-ti</a></span><br>
</div>
</blockquote>
</body>
</html>

--_000_9C1727E2753140E7A6D7961A465D6720ticom_--
