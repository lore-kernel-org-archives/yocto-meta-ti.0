Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDFC7C4167B
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1025.1650383259587314349
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Apr 2022 08:47:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dMfMyMtC;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: devarsht@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23JFlcsH100559
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 10:47:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650383258;
	bh=QWv3sx0Mco+YTGF0ZW0CxKbcBq1/mKpKfJI7xf98mbQ=;
	h=From:To:CC:Subject:Date;
	b=dMfMyMtC/ScqW8oWk0vC0hNML+xxnipk8ee4EBiiZfh6ubSPMeGEKeMqbebbB9qhj
	 nOXehFmeYM+r9weqLU0S9NMVEd+zMAraA1KcipRWWDycSQHIFdikrYOYXKGg5P7OpA
	 eSfDCTzxDieWlT/yvry3Djv0+qtJQIAqyqHsUgtE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23JFlcfk017246
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 10:47:38 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Apr 2022 10:47:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Apr 2022 10:47:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23JFlZO1073234;
	Tue, 19 Apr 2022 10:47:36 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>
CC: <nikhil.nd@ti.com>, <nsekhar@ti.com>, <devarsht@ti.com>,
 <vigneshr@ti.com>,
        Ryan Eatmon <reatmon@ti.com>, <a-m1@ti.com>, <nm@ti.com>
Subject: [meta-ti][dunfell][PATCH] u-boot-ti: Use SRCREV to get short commit
 ID
Date: Tue, 19 Apr 2022 21:17:34 +0530
Message-ID: <20220419154734.6346-1-devarsht@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14604

Due to recent security update in git, we are
not able to fetch revision currently using existing method:
https://github.blog/2022-04-12-git-security-vulnerability-announced/

So instead, use the SRCREV to parse the short commit ID
and set the UBOOT_LOCALVERSION variable.

Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 231b7647..cc775e2e 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,14 +1,6 @@
 # UBOOT_LOCALVERSION can be set to add a tag to the end of the
 # U-boot version string.  such as the commit id
-def get_git_revision(p):
-    import subprocess
-
-    try:
-        return subprocess.Popen("git rev-parse HEAD 2>/dev/null ", cwd=p, shell=True, stdout=subprocess.PIPE, universal_newlines=True).communicate()[0].rstrip()
-    except OSError:
-        return None
-
-UBOOT_LOCALVERSION = "-g${@get_git_revision('${S}').__str__()[:10]}"
+UBOOT_LOCALVERSION = "-g${@d.getVar("SRCREV", False).__str__()[:10]}"
 
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
-- 
2.17.1


