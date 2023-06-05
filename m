Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42869C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 13:12:33 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.7189.1685970745277808325
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Jun 2023 06:12:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SWsRXyz/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 355DCOsT023539
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 08:12:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685970744;
	bh=j9HPwWJGjfVXX15epMq6JwIAHsXKule6r6Wdo8BYHus=;
	h=From:To:CC:Subject:Date;
	b=SWsRXyz/U5qDMHu/+Sc4cCedLJuIoEmJDsouRngoiVY+ZUK0CI0kKrg8ZphCUBfou
	 FRIeotBA1L7efKyfevo/ZszIk16pw8nzMFN1ewyLasZkEK4YCG6740dvMxqzltL7XF
	 WFvGmK1ZPa/oa1AbCDWfrmF14ypU1qq1lXC2MH+Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 355DCOZP066778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 5 Jun 2023 08:12:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 Jun 2023 08:12:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 Jun 2023 08:12:23 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 355DCNkk021690;
	Mon, 5 Jun 2023 08:12:23 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH v2] meta-ti-bsp: Add recipe for u-boot-ti-jailhouse and linux-ti-jailhouse
Date: Mon, 5 Jun 2023 18:41:52 +0530
Message-ID: <20230605131152.69991-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Jun 2023 13:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16664

Add new recipe for u-boot-ti-jailhouse and linux-ti-jailhouse which will
be used for jailhouse for am62xx-evm.

Jailhouse support for am62xx-evm requires few patches for u-boot and linux
which are hosted at processor-sdk/u-boot and processor/linux respectively.
To build a image with jailhouse for am62xx-evm, these recipes
will be used instead of u-boot-ti-staging and linux-ti-staging by changing
the preferred_provider.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb    | 9 +++++++++
 .../recipes-kernel/linux/linux-ti-jailhouse_6.1.bb       | 9 +++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
new file mode 100644
index 00000000..079d55dd
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-jailhouse_2023.04.bb
@@ -0,0 +1,9 @@
+require u-boot-ti-staging_2023.04.bb
+
+# This will have priority over generic uboot path
+
+BRANCH = "ti-u-boot-2023.04-jailhouse"
+
+UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
+
+SRCREV = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
new file mode 100644
index 00000000..8e1edb55
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-jailhouse_6.1.bb
@@ -0,0 +1,9 @@
+require linux-ti-staging_6.1.bb
+
+# Use different commit, repo and branch for jailhouse build
+
+BRANCH = "ti-linux-6.1.y-jailhouse"
+
+SRCREV = "0ed0dec2462b805b0188fe080895adc437871549"
+
+KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
-- 
2.34.1


