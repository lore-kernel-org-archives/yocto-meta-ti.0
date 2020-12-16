Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.359.1608079754028305226
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Dec 2020 16:49:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=p3l/WNa1;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BG0n8bo049312;
	Tue, 15 Dec 2020 18:49:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608079748;
	bh=P/J9U2QuTZsKa9pojxVODzBvPR6SDc/Kt3XDvx86SvE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=p3l/WNa1+guyJnCZHGWMXAXQaXDf/qCU+HWPV3mU+W9DzVwcIxYJ+tz7oJwZKpvzf
	 92KwPHiwZat+8rn1E+rgRogHT9MgR0RYZ0EvL+LtWr3W9s5sAnxPvhP1RPLsuQCIX0
	 5iL0uCVLcOv64aPzBrl0nt/4fshaFE3r32UMWwpU=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BG0n8lN084546
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Dec 2020 18:49:08 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 18:49:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 18:49:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BG0n8VE099723;
	Tue, 15 Dec 2020 18:49:08 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>
CC: Suman Anna <s-anna@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Dave Gerlach
	<d-gerlach@ti.com>, Nishanth Menon <nm@ti.com>,
        <denis@denix.org>
Subject: [dunfell/master PATCH V5] trusted-firmware-a: Update SRCREV for AM64X support
Date: Tue, 15 Dec 2020 18:49:08 -0600
Message-ID: <20201216004908.31574-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <Changes since V3:>
References: <Changes since V3:>
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
Suggested-by: Denys Dmytriyenko <denis@denix.org>
Suggested-by: Dan Murphy <dmurphy@ti.com>
---
Changes since V4:
- Added Suggested-by of Dan and Denys for moving TFA_board definition to
  am64xx.inc correctly.

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
index 79a403a9..de0ac634 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -12,6 +12,7 @@ KERNEL_DEVICETREE = " \
 
 #IMAGE_BOOT_FILES += "sysfw-am64x-evm.itb"
 
+TFA_BOARD = "lite"
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

