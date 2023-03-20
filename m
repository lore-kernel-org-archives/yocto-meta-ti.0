Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035AFC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 04:12:50 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6704.1679285563309589214
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 21:12:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7234240C90
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PV5_G35d8RSy for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5C67640C16
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 461A21637C4
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 00:12:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 01/54] conf: machine: Add J784S4 hs platform
Date: Mon, 20 Mar 2023 04:11:48 +0000
Message-Id: <20230320041241.1293077-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320041241.1293077-1-denis@denix.org>
References: <20230320041241.1293077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 04:12:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16106

From: Manorit Chawdhry <m-chawdhry@ti.com>

Machine conf for J784S4 HS platform.
Used J721S2 hs as reference.

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf | 11 +++++++++++
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf      | 11 +++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf

diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/j784s4-hs-evm-k3r5.conf
new file mode 100644
index 00000000..80a228a0
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "j784s4"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs"
+
+UBOOT_MACHINE =3D "j784s4_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/co=
nf/machine/j784s4-hs-evm.conf
new file mode 100644
index 00000000..62357d62
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: J784S4 HS EVM
+#@DESCRIPTION: Machine configuration for the TI J784S4 HS EVM
+
+require conf/machine/j784s4-evm.conf
+
+UBOOT_MACHINE =3D "j784s4_evm_a72_defconfig"
+
+SPL_BINARY =3D "tispl.bin_HS"
+UBOOT_BINARY =3D "u-boot.img_HS"
+UBOOT_SYMLINK =3D "u-boot.img"
--=20
2.25.1


