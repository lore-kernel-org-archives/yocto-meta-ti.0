Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E15DCCF9E0
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 21:25:07 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4448.1761341102596740000
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 14:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=vb5YqplG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59OLP0Dc827066;
	Fri, 24 Oct 2025 16:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761341100;
	bh=qC4F5Z34LLUbrwGG1TQU8yjU8rc+Oz0R2MqvveRKzOQ=;
	h=From:To:Subject:Date;
	b=vb5YqplGGyo3z5an9HxZ1isavBKDzbsUWRmzeBP94p8ttIAlhORpZVYTCReHTGtvC
	 wJSN9F1Kdh808qKpgoYowt9L8IkNdknuBgzbN9cB5q4Igav0vtjRc2Sl9bycrAQlt4
	 0tQcdJHdcQIcEiKWVBbPnzCDN0aSvIvZgyTggqP4=
Received: from DFLE210.ent.ti.com (dfle210.ent.ti.com [10.64.6.68])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59OLP0ts4153946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Oct 2025 16:25:00 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Oct
 2025 16:25:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Oct 2025 16:25:00 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59OLP04X925284;
	Fri, 24 Oct 2025 16:25:00 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1vCPHQ-0001jU-9x; Fri, 24 Oct 2025 16:25:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] check_yocto_rules: Add new rule exception
Date: Fri, 24 Oct 2025 16:25:00 -0500
Message-ID: <20251024212500.6621-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Oct 2025 21:25:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19179

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 237aa6a3..56e8c771 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -24,6 +24,11 @@
     "GUARD-2" : {
         "skip_vars" : [ "k3" , "ti-soc" ]
     },
+    "GUARD-3" : {
+        "skip_files" : [
+            "meta-ti-bsp/recipes-security/optee/optee-os-tadevkit_%.bbappend"
+        ]
+    },
     "SUMMARY-1" : {
         "skip_files" : [
             "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
-- 
2.17.1


