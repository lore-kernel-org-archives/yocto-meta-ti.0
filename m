Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8D0AE00E81; Fri, 15 Nov 2019 07:34:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0788E00E96
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:16 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYGfa045756
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832056;
	bh=0mLDiMhe5R4ksSzIcmB0pWY1pBiDyUDv7RZG3bCDb0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Elpfkvw+xCsYVcqYxSBjjxSm9Vl5G/p24lppfiTdXRSt0oPWLjvZu9UfFHAt1D4Cm
	5sOKHwQFIb+gDu2uoGTO4yNKOulbnXrBSs9g8cmCWG/GLWmaV1UMjZiWlorF/KWqR4
	EfhMoHJ4NfaMPpEgGSd7lawUeMlU1TSSv9xQMRiE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYGwq114561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:16 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:16 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:16 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfb041975;
	Fri, 15 Nov 2019 09:34:15 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:35 -0500
Message-ID: <1573830902-17409-16-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 15/42] ipc-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld.inc | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
index 243678f..66bbf32 100644
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ b/recipes-bsp/ipc-lld/ipc-lld.inc
@@ -1,4 +1,8 @@
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.ipc"
+
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
@@ -6,24 +10,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-IPCLLD_GIT_URI = "git://git.ti.com/keystone-rtos/ipc-lld.git"
-IPCLLD_GIT_PROTOCOL = "git"
-IPCLLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "01.00.00.00"
-IPCLLD_SRCREV = "c695ca99aa4b7242e808889cfeacf848f14112c7"
-
-BRANCH = "${IPCLLD_GIT_BRANCH}"
-SRC_URI = "${IPCLLD_GIT_URI};protocol=${IPCLLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${IPCLLD_SRCREV}"
-PV = "01.00.00.00"
 PR = "r2"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-IPCLLD_PACKAGE_BASE   = "${S}/../ipclld_base"
+IPCLLD_PACKAGE_BASE   = "${WORKDIR}/ipclld_base"
 IPCLLD_ROOTPATH = "${IPCLLD_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/ipc"
 
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
-- 
2.7.4


