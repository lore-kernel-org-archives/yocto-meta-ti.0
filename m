Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF01E77190
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.139698.1734645245155616050
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=v2oR5/E7;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3sd064265
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 19 Dec 2024 15:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645244;
	bh=wZ05P+9G5JaqL4u34E48/gsnZ40EZwH8tbwqte7Fo5c=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=v2oR5/E7W0UA+QapBjjuPBRZq4aMlUKfu3KIrr+Ea6vAg5yO9Fojs05cIOEDVpirm
	 FGTYcqlivWnmFu8Ienrsxk/KNXU0a7rDLIxNRzJ2r5sQHqhWniaUgXz8VFV2gS7Yo3
	 +Rwvew6183k3fhKJZljAPevO5TApzCXxuFoOmbj0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs39Q050851;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3g7017424;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007am-H1; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 09/13] conf/machine: add BeagleY-AI platform
Date: Thu, 19 Dec 2024 15:53:58 -0600
Message-ID: <20241219215402.28324-10-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18157

From: Denys Dmytriyenko <denys@konsulko.com>

Add machine configuration for BeagleY-AI platform.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/beagley-ai-k3r5.conf | 14 +++++++++++
 meta-beagle/conf/machine/beagley-ai.conf      | 23 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-bb.org_git.bb   |  5 ++++
 3 files changed, 42 insertions(+)
 create mode 100644 meta-beagle/conf/machine/beagley-ai-k3r5.conf
 create mode 100644 meta-beagle/conf/machine/beagley-ai.conf

diff --git a/meta-beagle/conf/machine/beagley-ai-k3r5.conf b/meta-beagle/conf/machine/beagley-ai-k3r5.conf
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
+SYSFW_SOC = "j722s"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "j722s_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am67a_beagley_ai_r5.config"
diff --git a/meta-beagle/conf/machine/beagley-ai.conf b/meta-beagle/conf/machine/beagley-ai.conf
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
+UBOOT_MACHINE = "j722s_evm_a53_config"
+
+UBOOT_CONFIG_FRAGMENTS:bsp-bb_org = "am67a_beagley_ai_a53.config"
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j722s \
+"
+
+KERNEL_DEVICETREE = ""
+
+KERNEL_DEVICETREE:append:bsp-bb_org = " \
+ti/k3-j722s-evm.dtb \
+ti/k3-am67a-beagley-ai.dtb \
+"
+
+MACHINE_GUI_CLASS = "bigscreen"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
index 0b23effc..8e14c495 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_git.bb
@@ -15,3 +15,8 @@ BRANCH:beagleplay = "v2023.04-ti-09.01.00.008-BeaglePlay"
 BRANCH:beagleplay-k3r5 = "v2023.04-ti-09.01.00.008-BeaglePlay"
 SRCREV:beagleplay = "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
 SRCREV:beagleplay-k3r5 = "43791d945f4e5c25bcc19b9c778e8f9d194dc16e"
+
+BRANCH:beagley-ai = "v2023.04-ti-09.02.00.009-BeagleY-AI-Production"
+BRANCH:beagley-ai-k3r5 = "v2023.04-ti-09.02.00.009-BeagleY-AI-Production"
+SRCREV:beagley-ai = "93735daa6fe024304934d5a5e93ab05a06abf1a8"
+SRCREV:beagley-ai-k3r5 = "93735daa6fe024304934d5a5e93ab05a06abf1a8"
-- 
2.17.1


