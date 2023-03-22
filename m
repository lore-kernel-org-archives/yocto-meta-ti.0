Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCBFC74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:32:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.44628.1679495525147315462
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Mar 2023 07:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yQK5+zW0;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32MEW4wJ115292;
	Wed, 22 Mar 2023 09:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679495524;
	bh=gCYHaebyxKHih8XbfEZijr78UvCOpU4sPw9gvPm/JJE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yQK5+zW0/MXTkTZmS/G+j9CPIQpyeOWdSqOZwi0fTOxrWp7fFIyiRg8tzRW2bJ5rS
	 5Tvr1xc9ceNMe/IfvPOlGbFs4lXUlDlF029Q3gKSmvrSUp+PutcolSScNRhOcOxHKG
	 yWXw1eC+w0uTHiTYT3rc8aQnV+FO/UZ57fcRUmBU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32MEW4o1020523
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Mar 2023 09:32:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 22
 Mar 2023 09:32:03 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 22 Mar 2023 09:32:03 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32MEW39c073431;
	Wed, 22 Mar 2023 09:32:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pezVT-0005JO-Pw; Wed, 22 Mar 2023 09:32:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone/master][PATCH v4 3/3] u-boot-ti-staging: Add 2023.01 in prep for LTS migration
Date: Wed, 22 Mar 2023 09:32:03 -0500
Message-ID: <20230322143203.20360-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230322143203.20360-1-reatmon@ti.com>
References: <20230322143203.20360-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Mar 2023 14:32:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16234

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


