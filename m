Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF64CF8849
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 15:19:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.24479.1728055138917435241
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Oct 2024 08:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=FTjGx3dp;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 494FIvgn079698;
	Fri, 4 Oct 2024 10:18:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728055137;
	bh=vC2U887+UrPIETHYWAWRmW6C8ipdF+hwLKZd5kEPY/E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FTjGx3dpg619YdTOms7w1je8JJbEFEJFzYk1fsNl5mjofq7SmjHdYhax78aVS6m8m
	 NsMw0vF64+71iidKokkqGvUN+1oYL8rs72NItuTitATe4OS8cu2TrUwc1/4kfT4GO5
	 sJuB4MKCubzJjuOS8XgNxCFIzJfv/JESuD3qsBPQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 494FIvd0045403
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Oct 2024 10:18:57 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 4
 Oct 2024 10:18:57 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 4 Oct 2024 10:18:57 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 494FIvgr127597;
	Fri, 4 Oct 2024 10:18:57 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1swk53-0006PF-8O; Fri, 04 Oct 2024 10:18:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH 2/4] u-boot-ti-staging: Add v2024.10 recipe
Date: Fri, 4 Oct 2024 10:18:55 -0500
Message-ID: <20241004151857.24578-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241004151857.24578-1-reatmon@ti.com>
References: <20241004151857.24578-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Oct 2024 15:19:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17979

Adding needed recipe for initial testing and development of the 2024.10
version of u-boot for the next LTS.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb   | 11 +++++++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc          |  3 +++
 2 files changed, 14 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
new file mode 100644
index 00000000..1ab94fcc
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
@@ -0,0 +1,11 @@
+require u-boot-ti.inc
+
+DEFAULT_PREFERENCE = "-1"
+
+include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
+
+PR = "r0"
+
+BRANCH = "ti-u-boot-2024.10"
+
+SRCREV = "c97ada2dc66934ee00a7a03d9ed078bdfb7b4039"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index e1f1972e..97237d66 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -26,6 +26,9 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 
 PV:append = "+git"
 
+# u-boot builds a tool mkeficapsule and it needs this
+DEPENDS += "gnutls-native"
+
 # u-boot needs devtree compiler to parse dts files
 DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
 
-- 
2.17.1


