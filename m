Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.9972.1607808213823344120
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Dec 2020 13:23:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aPl2eT2K;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BCLNWVe112808
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 15:23:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607808212;
	bh=BcixGI5nmuKvl5oXiMmwJPGGyyu1tinj9tgp7avb6bc=;
	h=From:To:CC:Subject:Date;
	b=aPl2eT2KjUDL0lTZejjB12s8cdV0VcM7QvktPPU+JEeVoFB/ur+uY0Jiq7diwpfbL
	 +s3DP3aKxw/5VvQVm9l83sLJZkIgbqFwR+UU82g+GX58qemk7+/r2QncVK8Q6Ksndz
	 EAp+MW5PlW1th2rFRmv4B0Vl3U4QdnQ6cZ1mlm68=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BCLNWOt058051
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sat, 12 Dec 2020 15:23:32 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 12
 Dec 2020 15:23:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 12 Dec 2020 15:23:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BCLNWAq022262;
	Sat, 12 Dec 2020 15:23:32 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, Nishanth Menon <nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] trusted-firmware-a: Update SRCREV to pick latest
Date: Sat, 12 Dec 2020 15:23:32 -0600
Message-ID: <20201212212332.11836-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update SRCREV to pick latest that includes AM64 support

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 3ca4a204..7821ed3a 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -2,7 +2,7 @@ PV_k3 = "2.4"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 BRANCH_k3 = "ti-atf"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
+SRCREV_tfa_k3 = "65dd16b4ea5032752af62e94ca64cff41733a123"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1

