Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2344.1607663296740755517
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 21:08:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=WqNwRwpk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BB58Cut028070;
	Thu, 10 Dec 2020 23:08:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607663292;
	bh=uOOSXebbXR2sF09TkwrgAp10c+2J9aLw0W8iPp1fqj0=;
	h=From:To:CC:Subject:Date;
	b=WqNwRwpkEwVMyQcbtHBeGtkKXJbMDm3/XdrFWiFRp6U/J75YCgMLJsECnvFkqyFqn
	 F1WNg3QMLJxCs/yeD5U1H+LTvcSPCbTDeAe6gQU7aiDnynxcoATDCh32gntN9dPh7x
	 Pvi6mfYYe2TaKiApsc8yU4pJv/bAB19g0LF5n/do=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BB58CGY083698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 23:08:12 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 23:08:09 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 23:08:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BB589bi072550;
	Thu, 10 Dec 2020 23:08:09 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <d-gerlach@ti.com>, <s-anna@ti.com>, <dmurphy@ti.com>,
        <denis@denix.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V5] trusted-firmware-a: Update to v2.4 merge
Date: Thu, 10 Dec 2020 23:08:08 -0600
Message-ID: <20201211050808.9809-1-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update to v2.4 tag merge from upstream to keep TF-A in sync.

For major changes in trusted-firmware-a, See:
https://trustedfirmware-a.readthedocs.io/en/latest/change-log.html#version-2-4

TI specific fixups include:
 - stub for shutdown (CPUs enter wfi)
 - uart console is now configurable.

While at it, update to include PV_k3 as 2.4. We use PV_k3 instead of
PV since this allows meta-ti to not affect other platforms esp in a
multi-BSP configuration.

We also add LIC_FILES_CHKSUM_k3 to make sure that we don't let any
re-licensing in the project pass through unnoticed as that has to
be carefully examined for making sure we have all the right legal
compliance - There has been no change compared to previous versions,
but we introduce this as a protection in case there is a change in the
future.

Reviewed-by: Denys Dmytriyenko <denis@denix.org>
Suggested-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v4:
- Picked up Deny's review.. let me know if that does'nt stand.
- commit message update to add a little more verbage around LIC_FILES_CHKSUM_k3
  for future reference

Changes since v3:
-  s/LIC_FILES_CHKSUM/LIC_FILES_CHKSUM_k3 coming right up..

Changes since v2:
 - Update license file and checksum (Thanks Dan for catching my next
   blunder)

Changes since v1 in v2:
 - Update for PV_k3 (Thanks Denys)

 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 3c1862643086..c561fe2d7e76 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,8 @@
+PV_k3 = "2.4"
+LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 BRANCH_k3 = "ti-atf"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
+SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.25.1.377.g2d2118b814c1

