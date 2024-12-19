Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEB5E7718D
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.139697.1734645245145146076
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=pFOzVxEo;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs418368405
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645244;
	bh=po/x7GBnnaNIL7qEiUFE3gGZfL0mqXjAMbabeq6WZH8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=pFOzVxEojMKMtEgu/pbAdFzk/nsunT4+3NKl21oITOMLROzU2mSQwyRTktj4iX7fZ
	 H/N2JgzMxxjmE/QnCIaIpvs6hhWQjR/9gT4HngsaXueaSlL39vM34BH9A/2GiRnnxq
	 yjcZBA3aqaqJBvAmGoGfDaUhr0QjQiEYOQJCkbqM=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3iA028146
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:03 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:02 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3Op017398;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT4-0007WF-Ub; Thu, 19 Dec 2024 15:54:02 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 04/13] conf/machine: move "bb_org" BSP settings to meta-beagle
Date: Thu, 19 Dec 2024 15:53:53 -0600
Message-ID: <20241219215402.28324-5-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18155

From: Denys Dmytriyenko <denys@konsulko.com>

Define "bb_org" default BSP settings in meta-beagle layer that all Beagle
platforms will use.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../conf/machine/include/beagle-bsp.inc       | 24 +++++++++++++++++++
 meta-ti-bsp/conf/machine/include/ti-bsp.inc   | 21 +---------------
 2 files changed, 25 insertions(+), 20 deletions(-)
 create mode 100644 meta-beagle/conf/machine/include/beagle-bsp.inc

diff --git a/meta-beagle/conf/machine/include/beagle-bsp.inc b/meta-beagle/conf/machine/include/beagle-bsp.inc
new file mode 100644
index 00000000..77d0b483
--- /dev/null
+++ b/meta-beagle/conf/machine/include/beagle-bsp.inc
@@ -0,0 +1,24 @@
+# Use meta-ti-bsp "multi-BSP" facility to create a custom "bb_org" BSP profile
+# with default preferences for Beagle platforms
+
+# Default is bb_org, but can override with any of the existing options
+TI_PREFERRED_BSP ?= "bb_org"
+
+# ==========
+# bb_org
+# BeagleBoard.org kernel 6.1, u-boot 2023.04
+# based on TI staging trees with extra Beagle-specific features
+# but may not be up-to-date with TI version
+# ==========
+BSP_KERNEL_PROVIDER:bsp-bb_org = "linux-bb.org"
+BSP_KERNEL_VERSION:bsp-bb_org = "%"
+BSP_BOOTLOADER_PROVIDER:bsp-bb_org = "u-boot-bb.org"
+BSP_BOOTLOADER_VERSION:bsp-bb_org = "%"
+
+BSP_SGX_DRIVER_PROVIDER:bsp-bb_org = "ti-sgx-ddk-km"
+BSP_SGX_DRIVER_VERSION:bsp-bb_org = "1.17%"
+BSP_SGX_UMLIBS_VERSION:bsp-bb_org = "1.17%"
+BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org = "ti-img-rogue-driver"
+BSP_ROGUE_DRIVER_VERSION:bsp-bb_org = "23%"
+BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org = "23%"
+BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
index 6549ff73..083177dc 100644
--- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
+++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
@@ -3,7 +3,7 @@
 # preferences for kernel, bootloader and graphics components, as
 # well as a dedicated machine override.
 
-# Supported options are: mainline, next, ti-6_6, ti-6_1, bb_org
+# Supported options are: mainline, next, ti-6_12, ti-6_6, ti-6_1
 TI_PREFERRED_BSP ??= "ti-6_6"
 
 # Use bsp-* namespace for overrides
@@ -82,25 +82,6 @@ BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_1 = "23%"
 BSP_ROGUE_UMLIBS_VERSION:bsp-ti-6_1 = "23%"
 BSP_MESA_PVR_VERSION:bsp-ti-6_1 = "22%"
 
-# ==========
-# bb_org
-# BeagleBoard.org kernel 6.1, u-boot 2023.04
-# based on TI staging trees with extra Beagle-specific features
-# but may not be up-to-date with TI version
-# ==========
-BSP_KERNEL_PROVIDER:bsp-bb_org = "linux-bb.org"
-BSP_KERNEL_VERSION:bsp-bb_org = "%"
-BSP_BOOTLOADER_PROVIDER:bsp-bb_org = "u-boot-bb.org"
-BSP_BOOTLOADER_VERSION:bsp-bb_org = "%"
-
-BSP_SGX_DRIVER_PROVIDER:bsp-bb_org = "ti-sgx-ddk-km"
-BSP_SGX_DRIVER_VERSION:bsp-bb_org = "1.17%"
-BSP_SGX_UMLIBS_VERSION:bsp-bb_org = "1.17%"
-BSP_ROGUE_DRIVER_PROVIDER:bsp-bb_org = "ti-img-rogue-driver"
-BSP_ROGUE_DRIVER_VERSION:bsp-bb_org = "23%"
-BSP_ROGUE_UMLIBS_VERSION:bsp-bb_org = "23%"
-BSP_MESA_PVR_VERSION:bsp-bb_org = "22%"
-
 # ==========
 # sane fallback defaults
 # if specific values are not defined or bsp is set incorrectly
-- 
2.17.1


