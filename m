Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C9A6C54756
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:54:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.4229.1747443280098813996
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 May 2025 17:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74C6C40C21;
	Sat, 17 May 2025 00:54:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqXWUPqF45iy; Sat, 17 May 2025 00:54:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F41040CC0;
	Sat, 17 May 2025 00:54:38 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C7D5B168558;
	Fri, 16 May 2025 20:54:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 5/6] beagley-ai: upgrade BeagleY-AI to 6.12
Date: Fri, 16 May 2025 20:54:29 -0400
Message-Id: <20250517005430.3648211-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250517005430.3648211-1-denis@denix.org>
References: <20250517005430.3648211-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 May 2025 00:54:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18567

From: Denys Dmytriyenko <denys@konsulko.com>

Upgrade BeagleY-AI platform to 6.12 BSP.

U-boot support for this platform is still in its own branch.

Also adjust U-boot bootcmd, as Distro Boot doesn't fully work yet.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/beagley-ai-k3r5.conf             | 3 +--
 meta-beagle/conf/machine/beagley-ai.conf                  | 8 ++++++--
 .../u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti-mmc.cfg   | 1 +
 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb   | 7 +++++++
 4 files changed, 15 insertions(+), 4 deletions(-)
 create mode 100644 meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+=
git/bootcmd-ti-mmc.cfg

diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/=
conf/machine/beagley-ai-k3r5.conf
index 6cc370d1..8d5111f0 100644
--- a/meta-beagle/conf/machine/beagley-ai-k3r5.conf
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -3,8 +3,6 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
=20
 require conf/machine/include/k3r5.inc
-
-TI_PREFERRED_BSP ?=3D "bb_org-6_1"
 require conf/machine/include/beagle-bsp.inc
=20
 SYSFW_SOC =3D "j722s"
@@ -12,5 +10,6 @@ SYSFW_CONFIG =3D "evm"
 SYSFW_SUFFIX =3D "hs-fs"
=20
 UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
+UBOOT_MACHINE:bsp-bb_org-6_12 =3D "am67a_beagley_ai_r5_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/=
machine/beagley-ai.conf
index 9b1832d2..497001ee 100644
--- a/meta-beagle/conf/machine/beagley-ai.conf
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -3,11 +3,10 @@
 #@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
=20
 require conf/machine/include/j722s.inc
-
-TI_PREFERRED_BSP ?=3D "bb_org-6_1"
 require conf/machine/include/beagle-bsp.inc
=20
 UBOOT_MACHINE =3D "j722s_evm_a53_config"
+UBOOT_MACHINE:bsp-bb_org-6_12 =3D "am67a_beagley_ai_a53_defconfig"
=20
 UBOOT_CONFIG_FRAGMENTS:bsp-bb_org-6_1 =3D "am67a_beagley_ai_a53.config"
=20
@@ -22,4 +21,9 @@ ti/k3-j722s-evm.dtb \
 ti/k3-am67a-beagley-ai.dtb \
 "
=20
+KERNEL_DEVICETREE:append:bsp-bb_org-6_12 =3D " \
+ti/k3-j722s-evm.dtb \
+ti/k3-am67a-beagley-ai.dtb \
+"
+
 MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/boo=
tcmd-ti-mmc.cfg b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+gi=
t/bootcmd-ti-mmc.cfg
new file mode 100644
index 00000000..362696b9
--- /dev/null
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org-2025.04+git/bootcmd-ti=
-mmc.cfg
@@ -0,0 +1 @@
+CONFIG_BOOTCOMMAND=3D"run bootcmd_ti_mmc"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb b/me=
ta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
index 492705c2..9fc4015e 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.04.bb
@@ -10,3 +10,10 @@ UBOOT_GIT_URI =3D "git://github.com/beagleboard/u-boot=
.git"
 UBOOT_GIT_PROTOCOL =3D "https"
 BRANCH =3D "v2025.04-Beagle"
 SRCREV =3D "ea2aeefcb2de36f8ca1b51d0580826d13c01f143"
+
+BRANCH:beagley-ai =3D "v2025.04-rc3-BeagleY-AI"
+BRANCH:beagley-ai-k3r5 =3D "v2025.04-rc3-BeagleY-AI"
+SRCREV:beagley-ai =3D "cc376f9faef201670c7bb1734f42f5475c73f85d"
+SRCREV:beagley-ai-k3r5 =3D "cc376f9faef201670c7bb1734f42f5475c73f85d"
+
+SRC_URI:append:beagley-ai =3D " file://bootcmd-ti-mmc.cfg"
--=20
2.25.1


