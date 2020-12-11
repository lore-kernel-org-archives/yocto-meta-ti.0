Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6642.1607693534432504998
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 05:32:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fakQl71s;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWDoC058103
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607693533;
	bh=45QmgH5duSkSE0UQJFfv5Jyqazj8YO01zeMhjB7mTps=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fakQl71sG1FitplYHJcD1U8aR4zSQrzdfXLjvmSHrzP38EDgCRitOskk6TuF9+II9
	 Bp6wiSxQakLYki5IeBJlLsXcz3X97NpJ8HssuhVRKkn+8PCLFtz1qum9e9zuqk7bs0
	 WrVeq8OcEzhIRUCOYV/fagYWPVK55hWWy5SLSgTY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BBDWDmB122712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 11 Dec 2020 07:32:13 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Dec 2020 07:32:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Dec 2020 07:32:13 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BBDWCfK005628;
	Fri, 11 Dec 2020 07:32:12 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/4] linux-ti-staging: Update kernel to pick up AM64 platform
Date: Fri, 11 Dec 2020 07:31:59 -0600
Message-ID: <20201211133201.10923-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201211133201.10923-1-dmurphy@ti.com>
References: <20201211133201.10923-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 0e7fa2dff29c..8275988bb1a7 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "673043a513673aaddded01f52124c37d0e28f4f9"
+SRCREV = "7a5e2e57a39a097b4dde09bad8f72a2d31dc09c4"
 PV = "5.4.78+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

