Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D7DC74A5B
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 15:09:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.22109.1679065788611990202
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Mar 2023 08:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MkbzZhp2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32HF9kY8118409;
	Fri, 17 Mar 2023 10:09:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679065786;
	bh=gCYHaebyxKHih8XbfEZijr78UvCOpU4sPw9gvPm/JJE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MkbzZhp2EOa5YJo+nJRIcooTK4c6vLNWdeEJxkFCkhc4rWrYVGTUPpWws0fqlULR4
	 KlaPWYQxpbOBYijV1xnpsXv+/6lmFXDf9v61jAv61GIuu5/0H7r3AkkaV6eq2M8JKW
	 ixR1sW+FRzwtUkMqts4vQK2jNfujM3wGBcKuM8eY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32HF9kjl002767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 17 Mar 2023 10:09:46 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 17
 Mar 2023 10:09:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 17 Mar 2023 10:09:46 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32HF9kY1103059;
	Fri, 17 Mar 2023 10:09:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pdBiE-0006O1-76; Fri, 17 Mar 2023 10:09:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2 3/3] u-boot-ti-staging: Add 2023.01 in prep for LTS migration
Date: Fri, 17 Mar 2023 10:09:45 -0500
Message-ID: <20230317150945.24492-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230317150945.24492-1-reatmon@ti.com>
References: <20230317150945.24492-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Mar 2023 15:09:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15998

We are preparing to migrate our u-boot version to 2023.01.  As we are still
working on the migration, mark the default preference low for this
version.  We will enable building with this u-boot in a meta-arago brand
in the near future.  Once the migration is complete, we will remove the
2021.01 u-boot and make this the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb   | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
new file mode 100644
index 00000000..b3f56878
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.01.bb
@@ -0,0 +1,11 @@
+require u-boot-ti.inc
+
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2023.01"
+
+SRCREV = "62e2ad1ceafbfdf2c44d3dc1b6efc81e768a96b9"
+
+DEFAULT_PREFERENCE = "-1"
-- 
2.17.1


