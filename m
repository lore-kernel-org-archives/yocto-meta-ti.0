Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF187C6370A
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:07 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.192.1667598060070693640
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2B95440D92
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8aOVkPQHTMb for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1EF0D40D89
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:58 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7DDD316368D
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 20/47] machine: add am62xx-lp-evm configuration
Date: Fri,  4 Nov 2022 21:40:28 +0000
Message-Id: <20221104214055.1221197-21-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15239

From: Anand Gadiyar <gadiyar@ti.com>

This platform is similar to the currently supported am62xx-evm, except
that we currently need new defconfigs for u-boot and new dtbs in the
filesystem.

Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
Cc: Hari Nagalla <hnagalla@ti.com>
Cc: Andrew Davis <afd@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>
Cc: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 11 +++++++++++
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      | 16 ++++++++++++++++
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb       |  1 +
 .../tifs-lpm-stub/tifs-lpm-stub_git.bb           |  2 +-
 .../recipes-kernel/linux/kernel-rdepends.inc     |  3 +--
 5 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-b=
sp/conf/machine/am62xx-lp-evm-k3r5.conf
new file mode 100644
index 00000000..ca4ced5a
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM62XX LP EVM (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM62xx LP EVM (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC =3D "am62x"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "gp"
+
+UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/co=
nf/machine/am62xx-lp-evm.conf
new file mode 100644
index 00000000..ef8e8692
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -0,0 +1,16 @@
+#@TYPE: Machine
+#@NAME: AM62XX LP EVM
+#@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
+
+require conf/machine/include/am62xx.inc
+
+MACHINE_FEATURES +=3D "gpu"
+
+KERNEL_DEVICETREE =3D " \
+    ti/k3-am62x-lp-sk.dtb \
+    ti/k3-am625-skeleton.dtb \
+    ti/k3-am625-sk-lpmdemo.dtb \
+    ti/k3-am625-sk-csi2-ov5640.dtbo \
+"
+
+UBOOT_MACHINE =3D "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 1b0dc4a1..6484ae87 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -36,6 +36,7 @@ SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
=20
 SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
=20
diff --git a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb b=
/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
index 90af55f1..ce5f4e1f 100644
--- a/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
+++ b/meta-ti-bsp/recipes-bsp/tifs-lpm-stub/tifs-lpm-stub_git.bb
@@ -7,7 +7,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "am62xx-evm"
+COMPATIBLE_MACHINE =3D "am62xx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 1071a278..3da41581 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -30,5 +30,4 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vx=
d-dec-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cnm-wave-fw"
=20
 # Add run-time dependency for TIFS Low Power Module stub
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx-evm =3D " tifs-lpm-st=
ub"
-
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am62xx =3D " tifs-lpm-stub"
--=20
2.25.1


