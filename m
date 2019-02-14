Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 746D0E00C46; Thu, 14 Feb 2019 11:16:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 795E8E00A1A
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 11:16:05 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1EJG4f8050948
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 13:16:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1550171765;
	bh=9UAQxHnVwpBAHgkwr/zxeiCB8Yg86rIlA4XQPQl4vsQ=;
	h=From:To:CC:Subject:Date;
	b=mAqQxYqvubrMpDfA8L2YHl3EL//1p5TpMHbrw6isrcRq7pPkmG+hhzqGgXj7+PqQV
	Ar2Tyc+/CCET+No7UKSeWLTFa/VNk3VqTI95XyK+Jqhv/SBijCrMlNMzVhe4SKCAFX
	diurozbmm4jhttGu/9hJGKxdwn/0Yjm2D/YQio9o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1EJG40R119040
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Feb 2019 13:16:04 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Feb 2019 13:16:04 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Feb 2019 13:16:04 -0600
Received: from legion.dal.desgin.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1EJG43i006377;
	Thu, 14 Feb 2019 13:16:04 -0600
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.120.181])
	by legion.dal.desgin.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x1EJG4U03760; Thu, 14 Feb 2019 13:16:04 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Feb 2019 13:15:54 -0600
Message-ID: <20190214191554.10945-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-linux-firmware: Change TI linux firmware branch
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2019 19:16:07 -0000
Content-Type: text/plain

Changing the branch that the TI linux firmware is picked
up from.  As this is a branch that is used for numerous
kernel versions so the version needs to be removed from the
branch name.

Changing ti-linux-firmware-4.1.y to ti-linux-firmware

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/goodix-fw/goodix-fw_git.bb       | 2 +-
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb   | 2 +-
 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb   | 2 +-
 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb   | 2 +-
 recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb | 2 +-
 recipes-bsp/serdes-fw/serdes-fw_git.bb       | 2 +-
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb       | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/goodix-fw/goodix-fw_git.bb b/recipes-bsp/goodix-fw/goodix-fw_git.bb
index 815466b7..0a9f3ff9 100644
--- a/recipes-bsp/goodix-fw/goodix-fw_git.bb
+++ b/recipes-bsp/goodix-fw/goodix-fw_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "f1a8d1d0131f83bd1a775cde7075eb67c070892c"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
index 40aa6841..fe7fa2b2 100644
--- a/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
+++ b/recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "k2hk|k2l|k2e"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "953ab647b0b6af411965242ecd919b1cb0e570d6"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
index 5f07b920..56373a73 100644
--- a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "588f602a21c62f90b1f4318b881c80a1e711317a"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
index 1a01446f..d129620c 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "am65xx-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "1e03f08e89bee6d29ffd25782f5ce45b1b4bf1e6"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
index b8c49a72..cd207826 100644
--- a/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
+++ b/recipes-bsp/qmss-pdsp-fw/qmss-pdsp-fw_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "778668c4bb5fe59870e549a4a2820b9f7f90e89e"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/serdes-fw/serdes-fw_git.bb b/recipes-bsp/serdes-fw/serdes-fw_git.bb
index 69e1e979..66271788 100644
--- a/recipes-bsp/serdes-fw/serdes-fw_git.bb
+++ b/recipes-bsp/serdes-fw/serdes-fw_git.bb
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "8d861bd8f8f792df60b6873989ff208766fbebae"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 83d01885..9e68fdff 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -13,7 +13,7 @@ COMPATIBLE_MACHINE = "k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRCREV = "ab507546f0f3f217f4c782a20845856e14b38224"
-BRANCH ?= "ti-linux-firmware-4.1.y"
+BRANCH ?= "ti-linux-firmware"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
 
-- 
2.20.1.390.gb5101f9297


