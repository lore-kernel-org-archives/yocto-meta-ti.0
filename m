Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.37986.1597643905938982745
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 16 Aug 2020 22:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NddWK3uZ;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 718F9E01FEC; Sun, 16 Aug 2020 22:58:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17917E01FEC
	for <meta-ti@yoctoproject.org>; Sun, 16 Aug 2020 22:58:23 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07H5wNS0085986
	for <meta-ti@yoctoproject.org>; Mon, 17 Aug 2020 00:58:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597643903;
	bh=HHq1wL6Aj7L9udgj5Dh/1tiM/KEYNvd7w/MYM+j4NgQ=;
	h=From:To:CC:Subject:Date;
	b=NddWK3uZ7XgKWdTkuGRx30TYKqO7edD155h/n0Z8FDP9xSeeqC/zrJLCNo0unSSKV
	 UuJuwztuERpkCigDpF3heeMew+0VmlM362FVEciQLeZE96pxuePxmTLAY0q2SAPVtG
	 ynt8ClxJmQrH1haofS58NGyPASdnmOygN5JYDXU8=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07H5wNut030688
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 17 Aug 2020 00:58:23 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 17
 Aug 2020 00:58:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 17 Aug 2020 00:58:22 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07H5wKHm007524;
	Mon, 17 Aug 2020 00:58:21 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>, <dmurphy@ti.com>
CC: <meta-ti@yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Update SRCREV to latest
Date: Mon, 17 Aug 2020 11:28:08 +0530
Message-ID: <20200817055808.26422-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 46447af6..8f5e50b6 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.12+git${SRCPV}"
-SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
+SRCREV = "0d059b6f2c3efeaa2466517300540498b34b7655"
 BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
-- 
2.17.1

