Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.15894.1627878881089201298
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 21:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mW83ZSSU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: lokeshvutla@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1724Ya3Z019994;
	Sun, 1 Aug 2021 23:34:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627878876;
	bh=nSFR1VaTHIBywdKNSSz4bUGW+9/uQTUD7fabtxNl+hM=;
	h=From:To:CC:Subject:Date;
	b=mW83ZSSUO/Th0UA7W/q8ag0eQBrSAFx5BQ35OvhzT+70njS4fxhsSJEUssSeeHPFF
	 LZ7I2IHLDLrrOtSP6w4tkWvJblqvOURPupvI8XSodbIve786e6T9ZZz/PZYsD6tKVp
	 QcxwJtxOlI1KPv+uCBtbmpl+J16O/q7eH7rVNiPQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1724YapF084029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 1 Aug 2021 23:34:36 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 1 Aug
 2021 23:34:35 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 1 Aug 2021 23:34:35 -0500
Received: from uda0131933.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1724YWiu109536;
	Sun, 1 Aug 2021 23:34:33 -0500
From: "Lokesh Vutla" <lokeshvutla@ti.com>
To: <meta-ti@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>
CC: <yogeshs@ti.com>, <denis@denix.org>, Nishanth Menon <nm@ti.com>,
        Lokesh
 Vutla <lokeshvutla@ti.com>
Subject: [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to v5.14-rc3
Date: Mon, 2 Aug 2021 10:04:32 +0530
Message-ID: <20210802043432.16635-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Bump the kernel version to 5.14-rc3

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 5d043da7..fad01ae1 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
 BRANCH = "master"
 TOOLS_BRANCH = "master"
 
-# 5.13 Mainline version
-SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
-PV = "5.13+git${SRCPV}"
+# 5.14-rc3 Mainline version
+SRCREV = "ff1176468d368232b684f75e82563369208bc371"
+PV = "5.14-rc3+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
-- 
2.30.0

