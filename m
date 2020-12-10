Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.245.1607637700586158444
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Dec 2020 14:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cqFbrtOe;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAM1dSo131054
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 16:01:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607637699;
	bh=PgTNFMlWHwcURzEDsZCLkuTmYW88utd1wcXQj/pqxZ0=;
	h=From:To:CC:Subject:Date;
	b=cqFbrtOeEZSHG74n+j7DznR4HOaXwwY4Bi60VMAm4aNGX9hhxZXI8vhFdOXtqrsCW
	 WC7tADl06ZWwnlLa6jmhAJ6/tir/6M33n/oUvmL4ocmzdcQvKjZqtj2oDNgYlA7a6w
	 LQST/AxGkpNYuYZ6Iv5aIAsnwDhfPUN90kACK7Fs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAM1dJj087769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 10 Dec 2020 16:01:39 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 16:01:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 16:01:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAM1chT124739;
	Thu, 10 Dec 2020 16:01:38 -0600
From: "Nishanth Menon" <nm@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <d-gerlach@ti.com>, <s-anna@ti.com>, <dmurphy@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2] trusted-firmware-a: Update to v2.4 merge
Date: Thu, 10 Dec 2020 16:01:37 -0600
Message-ID: <20201210220137.2191-1-nm@ti.com>
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

While at it, update to include PV_k3 as 2.4

NOTE: We use PV_k3 instead of PV since this allows meta-ti to not
affect other platforms esp in a multi-BSP configuration.

Suggested-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes from V1:
- Updated PV to PV_k3 to make sure we dont mess up multi-BSP configs
  (thanks Denys)
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 3c1862643086..b1fb4e67ef9e 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,7 @@
+PV_k3 = "2.4"
 BRANCH_k3 = "ti-atf"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "52c334fc361194e3896ea3b2529c10a06e586a5f"
+SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.25.1.377.g2d2118b814c1

