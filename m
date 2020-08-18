Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.72336.1597776708460014557
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 11:51:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RirHdXb0;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nikhil.nd@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB4EBE0203E; Tue, 18 Aug 2020 11:51:47 -0700 (PDT)
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
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00936E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 11:51:45 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IIpjet123376
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:51:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597776705;
	bh=4MTJBZ8J5wp0K48VhBn3XKQEO244nLGTIv0kRlAZ9pw=;
	h=From:To:CC:Subject:Date;
	b=RirHdXb0XW54b9r+YVkT6RKeSKLnqaZ7LdkIM6o2bTnU0Ro/DKCZ2vnGq0gype+W5
	 1isQwZRB9+tE8aKf/ULWZOjclKL/3kak+Okj55QJKWkSFATe1NobUBSnvCKAqqQwk3
	 ++2AbpRAEGNZHVwHUi3qlOZeLzgqRkZHJ+GCPSgQ=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07IIpiT3041103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 13:51:44 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 13:51:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 13:51:44 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IIpgMd049273;
	Tue, 18 Aug 2020 13:51:43 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <meta-ti@yoctoproject.org>, <denys@ti.com>, <dmurphy@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-kernel: linux-ti-staging: update SRCREV to latest
Date: Wed, 19 Aug 2020 00:21:40 +0530
Message-ID: <20200818185140.31666-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index cf1ecc6e..0e87f7d8 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "a32d62437eb9f2acd64a124c221de98d6f728bcc"
+SRCREV = "da26e63e96f403b7415fdf7e0b45eeaba63ddbe0"
 PV = "5.4.54+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

