Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1401.1619806808005663012
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Apr 2021 11:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CqCaPVcF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13UIK67P079278;
	Fri, 30 Apr 2021 13:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619806806;
	bh=xCiqB+mVFO9xeJtZie7oG5yNe/Ta+azIcUvuMBYRKRw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CqCaPVcF4OHYyQ3Jv11WozWKE4+PiyaAraqrrwty9Jp5WbLQ7mPbH+CfN4ITFb3PJ
	 olwdNl5s+WkHzWKPwJpzLa0VLWHsHK1cTCx4wauEfP7ZNrA/Jum1qyT3+4jQdcay7R
	 ZZ2LqvoIzOD7QwSkcYZHjfv7beZozgEK6uWil8ko=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13UIK6Ax074280
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Apr 2021 13:20:06 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 30
 Apr 2021 13:20:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 30 Apr 2021 13:20:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13UIK6Uq113664;
	Fri, 30 Apr 2021 13:20:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Yogesh Siraswar <yogeshs@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.10 kernel to 5.10.30
Date: Fri, 30 Apr 2021 13:20:06 -0500
Message-ID: <20210430182006.12039-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210430182006.12039-1-praneeth@ti.com>
References: <20210430182006.12039-1-praneeth@ti.com>
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
index d4104b6d..a6f104a2 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "00634c794573abb7fcbbf44437b2969214edfc7a"
-PV = "5.10.21+git${SRCPV}"
+SRCREV = "bafb98f9e116d9f41e40299d4f900b66d6f673fe"
+PV = "5.10.30+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index b4de40de..6121f912 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "bdfd5b0c1ee5617c9a94bacad0d818920d95b486"
-PV = "5.10.21+git${SRCPV}"
+SRCREV = "d29eceaef9c09b732d8e95afb47429a9fe602275"
+PV = "5.10.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1

