Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E5C7C6FA8E
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.842.1663041349786922727
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 154DF40D6E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prZzMO7rqFws for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E3BFC40D7C
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5DBEF1749DA
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 14/65] conf: machine: Add j721s2 hs platform
Date: Tue, 13 Sep 2022 03:54:50 +0000
Message-Id: <20220913035541.2364351-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15083

From: Jayesh Choudhary <j-choudhary@ti.com>

Machine conf for J721S2 HS platform.
Used j7200 hs as reference.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/j721s2-hs-evm-k3r5.conf      | 13 +++++++++++
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf   | 22 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf

diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/j721s2-hs-evm-k3r5.conf
new file mode 100644
index 00000000..ac4df86e
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm-k3r5.conf
@@ -0,0 +1,13 @@
+#@TYPE: Machine
+#@NAME: J721S2 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "j721s2"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs"
+
+UBOOT_MACHINE =3D "j721s2_hs_evm_r5_defconfig"
+
+TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/j721s2-hs-evm.conf
new file mode 100644
index 00000000..43fb2ebc
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -0,0 +1,22 @@
+#@TYPE: Machine
+#@NAME: J721S2 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J721S2 HS EVM
+
+require conf/machine/j721s2-evm.conf
+
+UBOOT_MACHINE =3D "j721s2_hs_evm_a72_defconfig"
+
+UBOOT_ENTRYPOINT =3D       "0x80080000"
+UBOOT_LOADADDRESS =3D      "0x80080000"
+UBOOT_RD_LOADADDRESS =3D   "0x84000000"
+UBOOT_RD_ENTRYPOINT =3D    "0x84000000"
+UBOOT_DTB_LOADADDRESS =3D  "0x83000000"
+UBOOT_DTBO_LOADADDRESS =3D "0x83080000"
+UBOOT_DTBO_OFFSET =3D      "0x00010000"
+
+SPL_BINARY =3D "tispl.bin_HS"
+SPL_BINARYNAME =3D "tispl.bin"
+UBOOT_BINARY =3D "u-boot.img_HS"
+IMAGE_BOOT_FILES =3D "${UBOOT_BINARY}"
+
+TI_SECURE_DEV_PKG =3D "${TI_SECURE_DEV_PKG_K3}"
--=20
2.25.1


