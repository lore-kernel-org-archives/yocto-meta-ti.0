Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.3526.1619814071878922414
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 13:21:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OoKvweEu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13UKLANK130894;
	Fri, 30 Apr 2021 15:21:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619814070;
	bh=+Nivdv6v2rl1qAKq1HUeCqmEOsATu2HZBIv4o3rSDpA=;
	h=From:To:CC:Subject:Date;
	b=OoKvweEudIkskfNuUylcP7a95FjVMtPqg4XatH3g5Ksx6Ls2/CPDxSNN+VNgLjcQP
	 rj5p9Y4OChOqwigDYOJaI1TPvU18Uv8Y/774ERssyW6OjUIXkRVk7sAQ99r0RoN+W/
	 LHlEEaLxy+tEdQtUZM4SiR4kakIDav/0dTnFF6O0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13UKLAgd002772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Apr 2021 15:21:10 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 15:21:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:21:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13UKLAcG049969;
	Fri, 30 Apr 2021 15:21:10 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2] linux-ti-staging: Update 5.10 kernel to 5.10.30
Date: Fri, 30 Apr 2021 15:21:09 -0500
Message-ID: <20210430202110.31235-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update linux 5.10 to 5.10.30 stable.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index d4104b6d..aaed7f3f 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "00634c794573abb7fcbbf44437b2969214edfc7a"
-PV = "5.10.21+git${SRCPV}"
+SRCREV = "fa80ffc7961b847a40745adedeae289081762ee7"
+PV = "5.10.30+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index b4de40de..80c677c1 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
-PV = "5.10.21+git${SRCPV}"
+SRCREV = "49d1242fa195c081de943c8be078ec27baba3701"
+PV = "5.10.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1

