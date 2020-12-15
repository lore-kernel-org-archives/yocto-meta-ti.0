Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2888.1608065499785313678
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 12:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sHwM3K4c;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFKpcKo101999
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 14:51:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608065498;
	bh=KEzOMcagpsM54MQrB5NIaBCduk4BHQeeRuu6ybzwR20=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sHwM3K4cfmmzOAWEW3yOYFZbWJ5qC4qk5/l1W4eldeATvZB++ArXjeLFS6dtVmKhQ
	 g9Estf2aHb35mSFbeQyFAcVmKqwzsp3FTDSrAYy7COT2OfGVISOnQkTaNp/KRkOQbU
	 +1JtL6RySFoBKKLCNgk/XWC2YWaxb/F9yDDz62s4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFKpcVo110079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Dec 2020 14:51:38 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 14:51:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 14:51:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFKpcuu068308;
	Tue, 15 Dec 2020 14:51:38 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2] trusted-firmware-a: Update SRCREV to pick latest
Date: Tue, 15 Dec 2020 14:51:38 -0600
Message-ID: <20201215205138.27986-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
References: <8c5b53d9-8c01-ff9e-12c6-03a7e2c13dc6@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update SRCREV to pick latest that includes AM64 support

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 4942bf46..39ef1171 100644
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

