Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.584.1625009827261286690
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 16:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Cto8pPYe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TNb5p0080530;
	Tue, 29 Jun 2021 18:37:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625009825;
	bh=Tid7B6CUQd4pJQZ3xYi+UVo6TdLk5YEVqxm/LLXFsmU=;
	h=From:To:CC:Subject:Date;
	b=Cto8pPYeSq3sMu2kIifmEdhOsbNxf6sJmrp0JGSQ/LL6Jtad1Sm8tfQ+rLFVHyW6j
	 N30qMycze64ZQhZ1sRbme4ZkNN+mSInoYyS6KWKe8Qx1BOSC35s5d8BlNMGzUveb4Z
	 qAiiNEWOnw+4WuBDEvtkAovi4TO9oEjS7MiRAjoQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TNb57F104021
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 18:37:05 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 18:37:04 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 29 Jun 2021 18:37:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15TNb4xc081514;
	Tue, 29 Jun 2021 18:37:04 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>
CC: Tom Rini <trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [dunfell/master PATCH] linux-ti-mainline: Bump kernel version to v5.13
Date: Tue, 29 Jun 2021 18:37:03 -0500
Message-ID: <20210629233703.26088-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And lets work with the latest kernel and while at it bump the system up
to latest ti-upstream-tools repo to get:
* AM65x SR1.0 overlay support
* EFI configuration to allow for the eventual support
* Few more cleanups for new architectures that have popped in.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-kernel/linux/linux-ti-mainline_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-mainline_git.bb b/recipes-kernel/linux/linux-ti-mainline_git.bb
index 6770adcae3f7..5d043da7fee1 100644
--- a/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -20,9 +20,9 @@ S = "${WORKDIR}/git"
 BRANCH = "master"
 TOOLS_BRANCH = "master"
 
-# 5.12 Mainline version
-SRCREV = "9f4ad9e425a1d3b6a34617b8ea226d56a119a717"
-PV = "5.12+git${SRCPV}"
+# 5.13 Mainline version
+SRCREV = "62fb9874f5da54fdb243003b386128037319b219"
+PV = "5.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
@@ -36,7 +36,7 @@ SRC_URI += " \
     file://defconfig \
 "
 
-SRCREV_ti-upstream-tools = "d59b7471d99b806e3dc22342c8f42d5bb33f8cce"
+SRCREV_ti-upstream-tools = "c9b8150cb00a5beb7b7f3e42d0d817aa9392fabd"
 SRCREV_FORMAT = "linux"
 
 KERNEL_DEVICETREE = ""
-- 
2.32.0

