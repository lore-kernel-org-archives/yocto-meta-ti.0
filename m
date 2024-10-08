Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F448CF0428
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 20:52:25 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.6696.1728420741612096476
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Oct 2024 13:52:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=whPbqpC4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKkF050115;
	Tue, 8 Oct 2024 15:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728420740;
	bh=8dN4MB/7/fXW2m8midAmT/hNIN6419zOZuxpkCoLPuE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=whPbqpC4dX29hp/fsYS58K6aQhA6KmnR/yxtuA6cxsqaulHrM0wP6aAyU8OfwZNFl
	 jPjwG6uF/YBPDH3ObAQdr5Qds6ew7MYQsNisTu5NFNVubZNe7qs5+A1AMtqK/1gNdU
	 cJ7U591hgsSpZhSpIpZa+EfEAO9JSey++aWisNGQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKDO061380;
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Oct 2024 15:52:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Oct 2024 15:52:20 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 498KqKZ5068810;
	Tue, 8 Oct 2024 15:52:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1syHBr-00013t-V0; Tue, 08 Oct 2024 15:52:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH v2 2/4] u-boot-ti-staging: Add v2024.10 recipe
Date: Tue, 8 Oct 2024 15:52:17 -0500
Message-ID: <20241008205219.4037-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241008205219.4037-1-reatmon@ti.com>
References: <20241008205219.4037-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Oct 2024 20:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17997

Adding needed recipe for initial testing and development of the 2024.10
version of u-boot for the next LTS.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added --find-copies-harder option.

 ...t-ti-staging_2023.04.bb => u-boot-ti-staging_2024.10.bb} | 6 ++++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc                | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)
 copy meta-ti-bsp/recipes-bsp/u-boot/{u-boot-ti-staging_2023.04.bb => u-boot-ti-staging_2024.10.bb} (52%)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
similarity index 52%
copy from meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
copy to meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
index b92a0a93..1ab94fcc 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.10.bb
@@ -1,9 +1,11 @@
 require u-boot-ti.inc
 
+DEFAULT_PREFERENCE = "-1"
+
 include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 PR = "r0"
 
-BRANCH = "ti-u-boot-2023.04"
+BRANCH = "ti-u-boot-2024.10"
 
-SRCREV = "7044504f44002fe46b4598420852033d335d56c7"
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


