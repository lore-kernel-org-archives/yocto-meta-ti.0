Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE13C7619A
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:33:54 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.39488.1680212029032852097
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Mar 2023 14:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kEs18LbK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32ULXm99031203;
	Thu, 30 Mar 2023 16:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680212028;
	bh=+/hf0i2g5I65CinWGGtPgMr7rKTbA4HlqOiXDDPjSts=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=kEs18LbKy0aF9fI06bPxiDxbqo4Lr9LyJMGm4SQvcmlzghUG1yuXWUx7lNDOBTZLy
	 PguiCNHyN/4HpR+jTDMyc05x05KY4iSMRF+xyBTGnUOH8E1dVvot6D1xOXodEjuxIx
	 IlhPT3pjBW4y9NTVEQf+VTQ04yOCeUFnFvKAIUK8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32ULXmNJ022659
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Mar 2023 16:33:48 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 30
 Mar 2023 16:33:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 30 Mar 2023 16:33:47 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32ULXlsM080847;
	Thu, 30 Mar 2023 16:33:47 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1phztz-0005O9-QK; Thu, 30 Mar 2023 16:33:47 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v6 3/3] u-boot-ti-staging: Add 2023.04 in prep for LTS migration
Date: Thu, 30 Mar 2023 16:33:47 -0500
Message-ID: <20230330213347.20656-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230330213347.20656-1-reatmon@ti.com>
References: <20230330213347.20656-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Mar 2023 21:33:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16263

We are preparing to migrate our u-boot version to 2023.04.  As we are still
working on the migration, mark the default preference low for this
version.  We will enable building with this u-boot in a meta-arago brand
in the near future.  Once the migration is complete, we will remove the
2021.01 u-boot and make this the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
v6: Change from 2023.01 to 2023.04.

 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb   | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
new file mode 100644
index 00000000..6a46e812
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -0,0 +1,11 @@
+require u-boot-ti.inc
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2023.04"
+
+SRCREV = "41a88ad529b3943b1e465846eb24fe2c29203e35"
+
+DEFAULT_PREFERENCE = "-1"
-- 
2.17.1


