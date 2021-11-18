Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.529.1637275229914195105
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 14:40:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=CiZf41JJ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AIMeQqA106519;
	Thu, 18 Nov 2021 16:40:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637275226;
	bh=oS07di71bcaygHM+8veP5BScfT2iOu6GyJYaZV/w9LA=;
	h=From:To:CC:Subject:Date;
	b=CiZf41JJeV1LDISETFxQ0O7uZ6i4W+SkJz8KudewPTmOJMpdi+UO4AtVQvheLvCQs
	 iAJMPGlzwtt3FcbSBEGbYpXVPJrl4oiOdu7R8jSJN8+ZPy7qETo9yidMpG6YPyvauF
	 p9KeoSmB4YH0HcNUc2YMR9xmj4Ko1NbhBHDFWfwo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AIMeQo5106429
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 18 Nov 2021 16:40:26 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 18
 Nov 2021 16:40:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 18 Nov 2021 16:40:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AIMeQfG106352;
	Thu, 18 Nov 2021 16:40:26 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Sidraya Jayagond <sidraya.bj@pathpartnertech.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        <prashanth.ka@pathpartnertech.com>
Subject: [dunfell/master PATCHv5] vxd-dec-fw: Add the recipe for vxd-dec-fw
Date: Thu, 18 Nov 2021 16:40:26 -0600
Message-ID: <20211118224026.5086-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 1AIMeQqA106519
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: Praneeth Bajjuri <praneeth@ti.com>

Add the firmware packaging recipe for the video decoder
for j721e.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
Changes in v5: Add TI-IMG license file

 licenses/TI-IMG                               | 63 +++++++++++++++++++
 .../ti-img-encode-decode/vxd-dec-fw_git.bb    | 24 +++++++
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  5 +-
 recipes-kernel/linux/kernel-rdepends.inc      |  3 +
 4 files changed, 93 insertions(+), 2 deletions(-)
 create mode 100644 licenses/TI-IMG
 create mode 100644 recipes-bsp/ti-img-encode-decode/vxd-dec-fw_git.bb

diff --git a/licenses/TI-IMG b/licenses/TI-IMG
new file mode 100644
index 00000000..8d2e6f9e
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
index 00000000..cccda6bb
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
+FILES_${PN} =3D "${base_libdir}/firmware"
diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-lin=
ux-fw/ti-linux-fw.inc
index c59120b8..f6d5b8d1 100644
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
index 5e5241c9..76b7a508 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -39,3 +39,6 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm =
=3D " prueth-fw-am65x-sr2"
=20
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D " cadence-mhdp-fw"
+
+# Add run-time dependency for Video Decoding firmware to the rootfs
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 =3D " vxd-dec-fw"
--=20
2.17.1

