Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08B07C7EE30
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:42:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26998.1684255349189672060
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ekXz27KF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgQwN075847;
	Tue, 16 May 2023 11:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255346;
	bh=4k7RhhicIGposyGXsMjAO7RAD+i4dKuNSK6wlQmR6EM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ekXz27KFs4/23mRUxh5ZjBK7QPSJdK2ITuIuMrUBiBzNsG7LsIXt480E2x4OnhVuo
	 wMOLQX9kQzWYxDtEKoSd6RRciU+jYd7wyjU6o82yH4jtl/sUu5EY/pDabXbPT96u7S
	 xwSRVyiD8ZGUAjn/MCGqVBosXWYpA+TxjEXuCwfw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGgQU7020310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:42:26 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:42:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:42:26 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgQKQ077232;
	Tue, 16 May 2023 11:42:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxko-0003E7-Ej; Tue, 16 May 2023 11:42:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 8/8] various: Remove DEFAULT_PREFERENCE
Date: Tue, 16 May 2023 11:42:25 -0500
Message-ID: <20230516164225.12311-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164225.12311-1-reatmon@ti.com>
References: <20230516164225.12311-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 16:42:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16544

Now that are past the inital stages of our LTS migration, we can remove
the DEFAULT_PREFERENCE settings that prevented these recipes from being
the default.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb     | 1 -
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb     | 2 --
 .../recipes-kernel/linux/linux-ti-staging-systest_6.1.bb        | 2 --
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb        | 2 --
 4 files changed, 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index b993a56f..bbca4bae 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -8,4 +8,3 @@ BRANCH = "ti-u-boot-2023.04"
 
 SRCREV = "c22f1ee591f84ab28c025d7aed9ee10c7f0154c1"
 
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index 8b05515b..8348b870 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -1,7 +1,5 @@
 require linux-ti-staging_6.1.bb
 
-DEFAULT_PREFERENCE = "-1"
-
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
index 1c30d27c..9c170e65 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-systest_6.1.bb
@@ -1,7 +1,5 @@
 require linux-ti-staging_6.1.bb
 
-DEFAULT_PREFERENCE = "-1"
-
 # Look in the generic major.minor directory for files
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 62873491..6b8e2754 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -5,8 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 inherit kernel
 
-DEFAULT_PREFERENCE = "-1"
-
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
-- 
2.17.1


