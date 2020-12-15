Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.3452.1608067336057373460
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 13:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jXl44o3j;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFLMFRl106555
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 15:22:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608067335;
	bh=+rHY/D/ywmFkUwH7BjpRbldgOE1gTNG/5FGwDuB08K0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jXl44o3jtQT1m3jfN3G0A3YoFlJAI4OOX77SgYT3QXlKwoVMfhYHJ7b3YD7YJa+4g
	 RKLonrDNYHqTubYMwJTDwXK4A3HvCB5WxqGUDyKOenXuCzgK+exfEgFE6tTQ9xRUl2
	 yQSaa6aN5wh0gcfpqmc65FQeXd+nbOeMqRCb4JeU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFLMF8Y075449
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 15:22:15 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 15:22:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 15:22:15 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFLMEph123880;
	Tue, 15 Dec 2020 15:22:14 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V3] trusted-firmware-a: Update SRCREV for AM64X support
Date: Tue, 15 Dec 2020 15:22:14 -0600
Message-ID: <20201215212214.32304-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cc97983c-848e-c8e2-4c23-17aee5df2f6d@ti.com>
References: <cc97983c-848e-c8e2-4c23-17aee5df2f6d@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update SRCREV to pick latest that includes AM64X support

commit 65dd16b4e ("ti: k3: Introduce lite device board support")
adds support of AM64X platform in ti-atf branch.

This patch updates the SRCREV and also updates the BOARD to "lite" to
build for the mentioned platform.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
Changes since V2:
- Update commit message adding more details on new platform

Changes since V1:
- Update TFA_BOARD target name for AM64 as "lite"

 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 3ca4a204..a7ca43c3 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -2,11 +2,12 @@ PV_k3 = "2.4"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
 BRANCH_k3 = "ti-atf"
 SRC_URI_k3 = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH};name=tfa"
-SRCREV_tfa_k3 = "f0a310d000fd6e8a1ed0ccc365b5931390393db1"
+SRCREV_tfa_k3 = "65dd16b4ea5032752af62e94ca64cff41733a123"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
 TFA_SPD_k3 = "opteed"
+TFA_BOARD_am64xx-evm = "lite"
 
 do_compile_append_am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-- 
2.17.1

