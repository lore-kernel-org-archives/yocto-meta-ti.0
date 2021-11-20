Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3411.1637378777238220649
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B5E2640BEA
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XCrV_xHgQ0BN for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CF35940C8F
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9030E1746DF
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 21/26] vxd-dec-fw: Add the recipe for vxd-dec-fw
Date: Fri, 19 Nov 2021 22:26:06 -0500
Message-Id: <1637378771-24987-22-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Praneeth Bajjuri <praneeth@ti.com>

Add the firmware packaging recipe for the video decoder
for j721e.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 licenses/TI-IMG                                    | 63 ++++++++++++++++=
++++++
 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb | 24 +++++++++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc            |  5 +-
 recipes-kernel/linux/kernel-rdepends.inc           |  3 ++
 4 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 licenses/TI-IMG
 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb

diff --git a/licenses/TI-IMG b/licenses/TI-IMG
new file mode 100644
index 0000000..8d2e6f9
--- /dev/null
+++ b/licenses/TI-IMG
@@ -0,0 +1,63 @@
+This license applies to the Imagination D5520 firmware image, pvdec_full=
_bin.fw.
+
+Copyright (C) 2019 Texas Instruments Incorporated
+
+All rights reserved not granted herein.
+
+Limited License.
+
+Texas Instruments Incorporated grants a world-wide, royalty-free, non-ex=
clusive
+license under copyrights and patents it now or hereafter owns or control=
s to
+make, have made, use, import, offer to sell and sell ("Utilize") this so=
ftware
+subject to the terms herein. With respect to the foregoing patent licens=
e, such
+license is granted solely to the extent that any such patent is necessar=
y to
+Utilize the software alone. The patent license shall not apply to any
+combinations which include this software, other than combinations with d=
evices
+manufactured by or for TI (=E2=80=9CTI Devices=E2=80=9D). No hardware pa=
tent is licensed
+hereunder.
+
+Redistributions must preserve existing copyright notices and reproduce t=
his
+license (including the above copyright notice and the disclaimer and
+(if applicable) source code license limitations below) in the documentat=
ion
+and/or other materials provided with the distribution
+
+Redistribution and use in binary form, without modification, are permitt=
ed
+provided that the following conditions are met:
+
+	* No reverse engineering, decompilation, or disassembly of this
+	  software is permitted with respect to any software provided in binary
+	  form.
+
+	* any redistribution and use are licensed by TI for use only with TI
+	  Devices.
+
+	* Nothing shall obligate TI to provide you with source code for the
+	  software licensed and provided to you in object code.
+
+If software source code is provided to you, modification and redistribut=
ion of
+the source code are permitted provided that the following conditions are=
 met:
+
+	* any redistribution and use of the source code, including any
+	  resulting derivative works, are licensed by TI for use only with TI
+	  Devices.
+
+	* any redistribution and use of any object code compiled from the
+	  source code and any resulting derivative works, are licensed by TI
+	  for use only with TI Devices.
+
+Neither the name of Texas Instruments Incorporated nor the names of its
+suppliers may be used to endorse or promote products derived from this
+software without specific prior written permission.
+
+DISCLAIMER.
+
+THIS SOFTWARE IS PROVIDED BY TI AND TI=E2=80=99S LICENSORS "AS IS" AND A=
NY EXPRESS OR
+IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIE=
S OF
+MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN =
NO
+EVENT SHALL TI AND TI=E2=80=99S LICENSORS BE LIABLE FOR ANY DIRECT, INDI=
RECT,
+INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT=
 NOT
+LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DA=
TA, OR
+PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEG=
LIGENCE
+OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN I=
F
+ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
diff --git a/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb b/recipes=
-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
new file mode 100644
index 0000000..7a184be
--- /dev/null
+++ b/recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb
@@ -0,0 +1,24 @@
+SUMMARY =3D "Video Decoding Firmware"
+LICENSE =3D "TI-IMG"
+LIC_FILES_CHKSUM =3D "file://LICENSE.ti-img;md5=3D84ca7278930db001870686=
ad997d6bb1"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV =3D "${IMG_DEC_FW_VERSION}"
+PR =3D "${INC_PR}.0"
+
+CLEANBROKEN =3D "1"
+
+COMPATIBLE_MACHINE =3D "j7"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+S =3D "${WORKDIR}/git"
+TARGET =3D "pvdec_full_bin.fw"
+
+do_install() {
+        install -d ${D}${base_libdir}/firmware/ti-img
+        install -m 0644 ${S}/ti-img/${TARGET} ${D}${base_libdir}/firmwar=
e/ti-img/${TARGET}
+}
+
+FILES:${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-lin=
ux-fw/ti-linux-fw.inc
index c59120b..f6d5b8d 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -13,11 +13,12 @@ NETCP_SA_FW_VERSION =3D "1.0.0"
 NETCP_PA_FW_VERSION =3D "3.0.2.3"
 QMSS_PDSP_FW_VERSION =3D "1.0.0.9"
 PRUETH_FW_AM65X_VERSION =3D "08.00.00.20"
-PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.09.06"
+PRUETH_FW_AM65X_SR2_VERSION =3D "02.02.09.07"
 GOODIX_FW_VERSION =3D "1.0.0.0"
 CADENCE_MHDP_FW_VERSION =3D "1.2.17"
+IMG_DEC_FW_VERSION =3D "1.0"
=20
-TI_LINUX_FW_SRCREV ?=3D "95232a584175a8ac872adf477b2dbb9ca68ba063"
+TI_LINUX_FW_SRCREV ?=3D "c96a734a059889e571dcf30c0638157c690a6e6e"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/li=
nux/kernel-rdepends.inc
index 7777e2b..41200c5 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -39,3 +39,6 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx-evm =
=3D " prueth-fw-am65x-sr2"
=20
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " cadence-mhdp-fw"
+
+# Add run-time dependency for Video Decoding firmware to the rootfs
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vxd-dec-fw"
--=20
2.7.4

