Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A1AC54795
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.397.1747674101246544389
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=P0MFO/Mc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1dNR177131;
	Mon, 19 May 2025 12:01:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674099;
	bh=d8KD5ujocdYgnJYl5iB5On45p0zerN3X7EZu6g5gnP0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=P0MFO/McTjEn/RzCjiuSwih/Stwveq5JLff97cuyfgKAf/fjNrs2D3CqF5mb47noB
	 /SimYJ4gCgcTqvojQagJZ8jf4zWXLvB0aqWZKu2pKQPYHbRltQZG/A4btJcUGXfCGD
	 inwTR1MoTG2u1L0pMPT++IjsyUliTqJBMIn4DQRI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH1dj21577712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:01:39 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1d38111867;
	Mon, 19 May 2025 12:01:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rv-0005vm-6r; Mon, 19 May 2025 12:01:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 3/3] check_yocto_rules: Add new config file
Date: Mon, 19 May 2025 12:01:38 -0500
Message-ID: <20250519170138.22739-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170138.22739-1-reatmon@ti.com>
References: <20250519170138.22739-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18583

TI is starting to run an automated checker for all incoming patches to
the mailing list.  One of the checks is to scan all of the files in the
repository looking for things that we have flagged as the "right way" of
doing recipes.  This file contains a set of exceptions that the checking
script is finding but can be skipped due to manual review.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 check_yocto_rules.json

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
new file mode 100644
index 00000000..7e8eb211
--- /dev/null
+++ b/check_yocto_rules.json
@@ -0,0 +1,31 @@
+{
+    "APPEND-1" : {
+        "skip_vars" : [ "ALTERNATIVE", "FILES", "INSANE_SKIP", "RDEPENDS", "RRECOMMENDS" ]
+    },
+    "APPEND-2" : {
+        "skip_vars" : [ "KERNEL_LOCALVERSION", "PR", "PV" ],
+        "file_regex" : {
+            "meta-ti-bsp\\/recipes-graphics\\/mesa\\/mesa-pvr_\\S+\\.bb" : {
+                "skip_vars": [ "GALLIUMDRIVERS", "VULKAN_DRIVERS" ]
+            },
+            "meta-ti-bsp\\/recipes-graphics\\/mesa\\/mesa-pvr\\.inc" : {
+                "skip_vars": [ "TOOLS", "TOOLS_DEPS", "GALLIUMDRIVERS", "VULKAN_DRIVERS" ]
+            }
+        }
+    },
+    "GUARD-1" : {
+        "skip_files" : [
+            "meta-ti-bsp/recipes-core/udev/eudev_%.bbappend",
+            "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bbappend",
+            "meta-ti-bsp/recipes-security/optee/optee-%.bbappend"
+        ]
+    },
+    "GUARD-2" : {
+        "skip_vars" : [ "k3" , "ti-soc" ]
+    },
+    "SUMMARY-1" : {
+        "skip_files" : [
+            "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
+        ]
+    }
+}
-- 
2.17.1


