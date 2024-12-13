Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C278E7718C
	for <webhook@archiver.kernel.org>; Fri, 13 Dec 2024 23:32:10 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8567.1734132728427343541
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Dec 2024 15:32:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D88B540CC4;
	Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SR66EFB8m6FP; Fri, 13 Dec 2024 23:32:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE6D640CC8;
	Fri, 13 Dec 2024 23:32:05 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 87C0D16412E;
	Fri, 13 Dec 2024 18:32:04 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 09/12] conf/machine: add BeagleY-AI platform
Date: Fri, 13 Dec 2024 18:32:00 -0500
Message-Id: <20241213233203.2688541-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241213233203.2688541-1-denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Dec 2024 23:32:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18114

From: Denys Dmytriyenko <denys@konsulko.com>

Add machine configuration for BeagleY-AI platform.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
No changes since RFC v2

 meta-beagle/conf/machine/beagley-ai-k3r5.conf | 14 +++++++++++
 meta-beagle/conf/machine/beagley-ai.conf      | 23 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  5 ++++
 3 files changed, 42 insertions(+)
 create mode 100644 meta-beagle/conf/machine/beagley-ai-k3r5.conf
 create mode 100644 meta-beagle/conf/machine/beagley-ai.conf

diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/=
conf/machine/beagley-ai-k3r5.conf
new file mode 100644
index 00000000..87462e72
--- /dev/null
+++ b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: BeagleY AI (R5F)
+#@DESCRIPTION: Machine configuration for the BeagleY AI (R5F core)
+
+require conf/machine/include/k3r5.inc
+require conf/machine/include/beagle-bsp.inc
+
+SYSFW_SOC =3D "j722s"
+SYSFW_CONFIG =3D "evm"
+SYSFW_SUFFIX =3D "hs-fs"
+
+UBOOT_MACHINE =3D "j722s_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/=
machine/beagley-ai.conf
new file mode 100644
index 00000000..8dcc9b14
--- /dev/null
+++ b/meta-beagle/conf/machine/beagley-ai.conf
@@ -0,0 +1,23 @@
+#@TYPE: Machine
+#@NAME: BeagleY AI (A53)
+#@DESCRIPTION: Machine configuration for the BeagleY AI board (A53 core)
+
+require conf/machine/include/j722s.inc
+require conf/machine/include/beagle-bsp.inc
+
+UBOOT_MACHINE =3D "j722s_evm_a53_config"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org =3D "am67a_beagley_ai_a53.config"
+
+KERNEL_DEVICETREE_PREFIX =3D " \
+    ti/k3-j722s \
+"
+
+KERNEL_DEVICETREE =3D ""
+
+KERNEL_DEVICETREE:append:bsp-bb_org =3D " \
+ti/k3-j722s-evm.dtb \
+ti/k3-am67a-beagley-ai.dtb \
+"
+
+MACHINE_GUI_CLASS =3D "bigscreen"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-b=
eagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 1d895f9c..fb7b0c18 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -17,3 +17,8 @@ BRANCH:beagleplay =3D "v2023.04-ti-09.01.00.008-BeagleP=
lay"
 BRANCH:beagleplay-k3r5 =3D "v2023.04-ti-09.01.00.008-BeaglePlay"
 SRCREV:beagleplay =3D "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
 SRCREV:beagleplay-k3r5 =3D "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
+
+BRANCH:beagley-ai =3D "v2023.04-ti-09.02.00.009-BeagleY-AI-Production"
+BRANCH:beagley-ai-k3r5 =3D "v2023.04-ti-09.02.00.009-BeagleY-AI-Producti=
on"
+SRCREV:beagley-ai =3D "93735daa6fe024304934d5a5e93ab05a06abf1a8"
+SRCREV:beagley-ai-k3r5 =3D "93735daa6fe024304934d5a5e93ab05a06abf1a8"
--=20
2.25.1


