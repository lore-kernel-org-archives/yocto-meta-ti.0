Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.4803.1608070833095509893
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 14:20:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iO6sSi+h;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFMKTum125566;
	Tue, 15 Dec 2020 16:20:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608070829;
	bh=ys+Ptn+nVi5E9ec4dLpSnCWpIjYIB/we5oVWx3r3sfs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iO6sSi+hidjB8gT9QE8j8Q+tg54cMSG1IUF/0fBDydbko69xEFM6edtYY6CSRaeLm
	 BbkGv9IFIlZVsP0WErdTu7xtPCfD20dFsgGejF/HGdwXvHzxIb2VGPhK5/90gFVhQy
	 YrMsoRKJwlWEIC3Vn8ZSZf2isN4BdjoKEVA8nH94=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFMKT64122662
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Dec 2020 16:20:29 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 16:20:29 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 16:20:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFMKTFK021663;
	Tue, 15 Dec 2020 16:20:29 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>,
        <denis@denix.org>
Subject: [dunfell/master PATCH V4] trusted-firmware-a: Update SRCREV for AM64X support
Date: Tue, 15 Dec 2020 16:20:29 -0600
Message-ID: <20201215222029.8816-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201215212214.32304-1-praneeth@ti.com>
References: <20201215212214.32304-1-praneeth@ti.com>
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
Changes since V3:
- moved TFA_BOARD definition to am64xx.inc
 
Changes since V2:
- Update commit message adding more details on new platform

Changes since V1:
- Update TFA_BOARD target name for AM64 as "lite"

 conf/machine/include/am64xx.inc                              | 1 +
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 79a403a9..99d573e8 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
 
 #IMAGE_BOOT_FILES += "sysfw-am64x-evm.itb"
 
+TFA_BOARD_am64xx-evm = "lite"
 OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
 
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 4942bf46..4852c560 100644
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

