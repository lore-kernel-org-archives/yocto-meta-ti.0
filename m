Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.45781.1622475290014247108
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 31 May 2021 08:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qFo4f2uG;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: grygorii.strashko@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14VFYnVR028516
	for <meta-ti@lists.yoctoproject.org>; Mon, 31 May 2021 10:34:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622475289;
	bh=mHjOjhdr71KcyMZ20Z9TQNTeTvbxD2fq0SpEK+8gRfY=;
	h=From:To:CC:Subject:Date;
	b=qFo4f2uGilbCEmHVJKVmr//HWVN/v2urU+dq8xjyxmXzikNiLaBw3R77N6djHtx+B
	 I5WLpESpUZnX8vp0zFBsCOhh/glyxa4zav3/QF1FCNHBU9ZrEPh8MLM77BMaUAZXMt
	 hOoA8tYC22hc8fu++ixr5GqqLemDC0ErA5OKvAJE=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14VFYn9e069711
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 31 May 2021 10:34:49 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 31
 May 2021 10:34:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 31 May 2021 10:34:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14VFYmCr036195;
	Mon, 31 May 2021 10:34:48 -0500
From: grygorii.strashko@ti.com
To: <meta-ti@lists.yoctoproject.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>,
        Grygorii Strashko
	<grygorii.strashko@ti.com>
Subject: [meta-ti PATCH] prueth-fw: am64xx-evm: add prebuilt PRU Ethernet FW
Date: Mon, 31 May 2021 18:34:42 +0300
Message-ID: <20210531153442.32342-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add prebuilt PRU Ethernet FW for am64xx-evm which is the same as
for AM65x SR2.0.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
 recipes-kernel/linux/kernel-rdepends.inc         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 57cf37a2..9d579fa4 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -7,7 +7,7 @@ PV = "02.02.08.02"
 
 CLEANBROKEN = "1"
 
-COMPATIBLE_MACHINE = "am65xx-evm"
+COMPATIBLE_MACHINE = "am65xx-evm|am64xx-evm"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
diff --git a/recipes-kernel/linux/kernel-rdepends.inc b/recipes-kernel/linux/kernel-rdepends.inc
index 56dfe4b2..743b352c 100644
--- a/recipes-kernel/linux/kernel-rdepends.inc
+++ b/recipes-kernel/linux/kernel-rdepends.inc
@@ -35,6 +35,7 @@ RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti43x = " prueth-fw pruhsr-fw pruprp
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_ti33x = " prueth-fw pruhsr-fw pruprp-fw"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx = " prueth-fw-am65x"
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am65xx-evm = " prueth-fw-am65x-sr2"
+RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_am64xx-evm = " prueth-fw-am65x-sr2"
 
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS_${KERNEL_PACKAGE_NAME}-base_append_j7 = " cadence-mhdp-fw"
-- 
2.17.1

