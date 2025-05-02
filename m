Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F67CC3ABAA
	for <webhook@archiver.kernel.org>; Fri,  2 May 2025 21:25:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.149.1746221111348237189
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 May 2025 14:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aw4wPy/G;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542LPAmg3949705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 16:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746221110;
	bh=/Hi7VWSiad1c9wzADepHMIeoxz+TWilGKbX/gG9wTIc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aw4wPy/GDGW43DXN7MqrIqJF8ElWx1QNlf2O9/eGUClF9HSyHeTz8Ft1s7uQ2gO0/
	 ODRA09ahrYgyv1B6gzMsLQVhqgXo2ScaMgYlRT5i/e6rw9m11wHdZHsCKl9Eu0jc+O
	 9ET2iZaniNNB86azJe0tm161RjveC7VhzeUS4iT0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542LPApv026070
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 16:25:10 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 16:25:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 16:25:09 -0500
Received: from lelvsmtp6.itg.ti.com ([10.250.35.60])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542LP9aN095517;
	Fri, 2 May 2025 16:25:09 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v2 2/3] ti-linux-fw: Set INHIBIT_DEFAULT_DEPS
Date: Fri, 2 May 2025 16:25:06 -0500
Message-ID: <20250502212507.78984-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250502212507.78984-1-afd@ti.com>
References: <20250502212507.78984-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 May 2025 21:25:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18529

Firmware here are not built, no need for C compiler nor std libs.
Add INHIBIT_DEFAULT_DEPS=1 and remove the same from all recipes
that include this file.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb               | 2 --
 meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb             | 2 --
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc        | 3 +++
 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb | 2 --
 4 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
index a7d15e30..ddb91e99 100644
--- a/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb
@@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 inherit deploy
 inherit update-alternatives
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
index e4b6d1de..8037ac6c 100644
--- a/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-eth-fw/ti-eth-fw.bb
@@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "j721e|j7200|j784s4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 inherit update-alternatives
 
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 8605d708..56a2df81 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -43,6 +43,9 @@ INHIBIT_SYSROOT_STRIP = "1"
 # This is used to prevent the build system from splitting out the firmware debug info into a separate file
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
+# Firmware here are prebuilt with no external dependencies
+INHIBIT_DEFAULT_DEPS = "1"
+
 # Disable arch checking as firmware is likely to be a different arch from the Yocto build
 INSANE_SKIP:${PN} += "arch"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
index 86e319c7..13587603 100644
--- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
@@ -7,8 +7,6 @@ COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-INHIBIT_DEFAULT_DEPS = "1"
-
 inherit update-alternatives
 
 PLAT_SFX = ""
-- 
2.39.2


