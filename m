Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.22.1619197624770996300
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Apr 2021 10:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=c7OWgrUX;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13NH727e064387;
	Fri, 23 Apr 2021 12:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619197622;
	bh=r4mRJm9kkxhURpg/Kqcc89CV/aHQM/vEyn5CKuXJrAA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=c7OWgrUXRslfE//PGL08cif3Dn9NcRqNMlWAasX8lIAPOASKvokZ2t4ePWQJjfGsp
	 lF4GBTD6mZO0d6Gx8VUNbrJKe+oVOCtbUgowgwee/eIKyABtTKIg9CLfHf2/Rlqas+
	 TLJpTzJTDqxGCt+6SUgAQJiNaDBDBHr+2cKr6+C4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13NH714D042866
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Apr 2021 12:07:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 23
 Apr 2021 12:07:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 23 Apr 2021 12:07:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13NH71Zo116240;
	Fri, 23 Apr 2021 12:07:01 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.10 kernel to the latest commit SHA
Date: Fri, 23 Apr 2021 12:07:00 -0500
Message-ID: <20210423170700.4220-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210423170700.4220-1-praneeth@ti.com>
References: <20210423170700.4220-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update 5.10 kernel to the latest commit SHA

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 6fd08e63..e97aca3b 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "85acf0d261f2dfd6c0bc5dcb7fda42771656701d"
+SRCREV = "79bfe5400b3fe9350cca6a009d8fdafcfc59879f"
 PV = "5.10.21+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index c4261397..698ec871 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "f513af27cd3301533e5a5e550e83e72b282f8759"
+SRCREV = "b53d877300ae60870b85823c6bfabb3aa643933b"
 PV = "5.10.21+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

