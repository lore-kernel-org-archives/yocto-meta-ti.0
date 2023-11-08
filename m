Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A6BC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 07:24:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.8753.1699428263678463043
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 23:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LmnQXHEa;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A87OGRg059758;
	Wed, 8 Nov 2023 01:24:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699428256;
	bh=Xfs3vQXbSoOWKDHVEDb7WVI+cCheZty7jJ7OE2aY3Bs=;
	h=From:To:CC:Subject:Date;
	b=LmnQXHEaLFNHa5zNVrz0OAC5uBfmz+7S58P/Z+LCIB9+EfJcAPML5jcEIGo4SrTCX
	 P3W5UoPV0JP0ug4RvPuARYDbHF4JzCYnwMQNQXw8aqjcwIviKfyOX1Fy7qtYwhqhcJ
	 ktnhaKv4YnrxulkwV/ux50E/L8/mqv0hqwStz36Y=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A87OGjx021365
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 01:24:16 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 01:24:16 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 01:24:16 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A87OFjB092897;
	Wed, 8 Nov 2023 01:24:16 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <denis@denix.org>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] ti-extras: Add support for extra kernel features for RT
Date: Wed, 8 Nov 2023 12:53:32 +0530
Message-ID: <20231108072332.3433926-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 07:24:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17267

Add support for ti-extras features for rt as it was added for non
rt kernel and u-boot earlier. It will also be accessible via the
TI_EXTRAS variable in the local.conf file.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../recipes-kernel/linux/linux-ti-staging-rt_6.1.bb   |  3 +++
 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc     | 11 +++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras-rt.inc

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index a600630e..ac6a6e75 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -7,4 +7,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 BRANCH = "ti-rt-linux-6.1.y"
 
 SRCREV = "eda9974e8513cdd2c5cc20c3c6b851f9977acd4d"
+
+include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
+
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


