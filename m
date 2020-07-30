Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.1356.1596133630982608701
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 11:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=o87knJ0H;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: denys@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06UIRAFo110130
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Jul 2020 13:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596133630;
	bh=c5GPJvO9lN8vmEMYWmvTlSPzQZdUoAIzMkU34PkieUM=;
	h=From:To:CC:Subject:Date;
	b=o87knJ0HvS41dt0p6GG+bJyNgtqVIP0yfK14/JpR+7O9yWzNOQO0AjGTqH3qNghAO
	 9ZOE13e6owCo7Ihopp9YMcqQsdsVUSznFjkKUc5c6On9TSUAk41VeTX+YcURcUFsoQ
	 9vZBSiIq1EmjacD57fdDzMTXsBlCX6oSCbK9xR6s=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06UIR9pl103264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Jul 2020 13:27:09 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Jul 2020 13:27:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Jul 2020 13:27:09 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06UIR9Ls043618;
	Thu, 30 Jul 2020 13:27:09 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] linux-ti-staging: update to 5.4.52
Date: Thu, 30 Jul 2020 18:27:08 +0000
Message-ID: <20200730182708.5043-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 6c53ec95..87c64c55 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "17e2c5c658e9bcdf7566c9e7f70b1f0a8c9f7036"
-PV = "5.4.43+git${SRCPV}"
+SRCREV = "92c1547f2d83a4a75a1181a88631ef2d64f1e0dd"
+PV = "5.4.52+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 806fc41f..28dedccc 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,8 +61,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "66cf445b7697a4963cfc796e06918fe5b147fe7d"
-PV = "5.4.40+git${SRCPV}"
+SRCREV = "41c32273d7f5666a5637a109ec004fd746d5efac"
+PV = "5.4.52+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1

