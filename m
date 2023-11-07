Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FA9C4167D
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 16:06:55 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.14698.1699373211587938746
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 08:06:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Jetx1vOu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A7G6oIo073244;
	Tue, 7 Nov 2023 10:06:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699373210;
	bh=NZQVZ8sMDFosOyJsf4J86vlYp+IJHkoTcTFW5Spw05I=;
	h=From:To:CC:Subject:Date;
	b=Jetx1vOuS8lcOMdfwhOWBoD/7RNBWKVMesm/kMFxs2H7+E+W60OucK4M4H/LTG5zk
	 EFz0wcerXK1THWa3/sBkZL6EfFUKEbiB6jJOJNUPTamRwTPjwD2A61r1lr4Rbutt0+
	 lKSnynfrPm7K3itbLOi8mX0NA7mUr4FQAoTTtTsY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A7G6ouo047979
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Nov 2023 10:06:50 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 7
 Nov 2023 10:06:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 7 Nov 2023 10:06:49 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A7G6ndT029203;
	Tue, 7 Nov 2023 10:06:49 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][RFC] ti-extras: Add support for extra kernel features for RT
Date: Tue, 7 Nov 2023 21:35:58 +0530
Message-ID: <20231107160558.2661070-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Nov 2023 16:06:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17256

Add support for ti-extras features for rt as it was added for non
rt kernel and u-boot earlier. It will also be accessible via the
TI_EXTRAS variable in the local.conf file.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging-rt_6.1.bb   |  5 +++--
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc     | 11 +++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index a600630e..93e1be39 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -1,10 +1,11 @@
 require linux-ti-staging_6.1.bb
+include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
 
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
-BRANCH = "ti-rt-linux-6.1.y"
+BRANCH ?= "ti-rt-linux-6.1.y"
 
-SRCREV = "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
+SRCREV ?= "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
 PV = "6.1.46+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
new file mode 100644
index 00000000..1fc40934
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc
@@ -0,0 +1,11 @@
+
+# Use different commit, repo and branch for TI extras build
+# This will have priority over generic rt path
+
+COMPATIBLE_MACHINE = "am62xx"
+
+BRANCH = "ti-rt-linux-6.1.y"
+BRANCH:tie-jailhouse = "ti-rt-linux-6.1.y-jailhouse"
+
+SRCREV = "685e77152461bd6b791500f717bec62d17c1b36d"
+SRCREV:tie-jailhouse = "a74088b40b4d27478a2af5c20cdc0b4ec8ed9470"
-- 
2.34.1


