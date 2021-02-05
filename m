Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.724.1612550479257364033
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:41:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=hm10d+1s;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: lokeshvutla@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115IfHLJ073746
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:41:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612550478;
	bh=QiIFzf3fcejUATHAvX/QVaBcSPcv9FC87LgUzLM4kT0=;
	h=From:To:CC:Subject:Date;
	b=hm10d+1sSoApKiRxc/ujtfyiYFQT8fVKxaXLFN13aVLpcXpLle4/lek9544nbRws+
	 Ywgpzytx6Ds1hvaF+c7SRRfCcBWxPqHkOQlcWRvi471Rs5Ljm8OMdDNWqtw+KMkIDZ
	 uLvxs9k835/qtIcV0PbpTHLQW46eWDRZo3KTYQq8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115IfHSr094335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:41:17 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:41:17 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:41:17 -0600
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115IfFwd102030;
	Fri, 5 Feb 2021 12:41:16 -0600
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Dan
 Murphy <dmurphy@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH dunfell/master] machine: am64xx-sk.conf: Add machine definition for AM64xx SK
Date: Sat, 6 Feb 2021 00:11:14 +0530
Message-ID: <20210205184114.7570-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 115IfHLJ073746
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

AM642 StarterKit (SK) board is a low cost, small form factor board
designed for TI=E2=80=99s AM642 SoC. Add machine definition for SK board.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
- To be merged only after U-Boot and Kernel gets updated with AM64xx sk
  platform.

 conf/machine/am64xx-sk-k3r5.conf | 14 ++++++++++++++
 conf/machine/am64xx-sk.conf      | 19 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 conf/machine/am64xx-sk-k3r5.conf
 create mode 100644 conf/machine/am64xx-sk.conf

diff --git a/conf/machine/am64xx-sk-k3r5.conf b/conf/machine/am64xx-sk-k3=
r5.conf
new file mode 100644
index 00000000..1256db72
--- /dev/null
+++ b/conf/machine/am64xx-sk-k3r5.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: AM64xx SK (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM64xx SK (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "am64x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "am64x_sk_r5_defconfig"
+UBOOT_BINARY =3D "tiboot3.${UBOOT_SUFFIX}"
+UBOOT_IMAGE =3D "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
+UBOOT_SYMLINK =3D "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
new file mode 100644
index 00000000..4cad8adc
--- /dev/null
+++ b/conf/machine/am64xx-sk.conf
@@ -0,0 +1,19 @@
+#@TYPE: Machine
+#@NAME: AM64xx SK
+#@DESCRIPTION: Machine configuration for the TI AM64xx SK board
+
+require conf/machine/include/am64xx.inc
+
+IMAGE_BOOT_FILES =3D "tispl.bin u-boot.img"
+
+UBOOT_MACHINE =3D "am64x_sk_a53_defconfig"
+
+do_image_wic[depends] +=3D "trusted-firmware-a:do_deploy"
+do_image_tar[depends] +=3D "trusted-firmware-a:do_deploy"
+
+do_image_wic[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] =3D "mc::k3r5:ti-sci-fw:do_deploy"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am642-sk.dtb \
+"
--=20
2.30.0

