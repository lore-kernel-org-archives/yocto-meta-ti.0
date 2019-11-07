Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D1FAE00E21; Thu,  7 Nov 2019 10:09:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7DEF1E00E0B
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:51 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9oU7020106
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150191;
	bh=VR/NOsfCJLOLqw4UGksBGb1xxv5Gdh3fmbDXe6K9BaY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=plvOQ0DDESCJpovNNpHZbVv/49FN2Qjc/KRURV8HfXPn2JjYnkZUJwxTUFzNv0pVy
	CMXspJK1u7PpA6z65jwXjXDUZgQckqo+NGYimvDA3rwo1fgXR6RWuBZAxk5nwEJziQ
	dxCrmHMU4dz+3V1AHYHF/ZW3m2GWAF3RjJ6mfAvg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9oNn125191
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:50 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:35 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIL067418;
	Thu, 7 Nov 2019 12:09:50 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:10 -0500
Message-ID: <1573149037-762-16-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 15/42] ipc-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:54 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/ipc-lld/ipc-lld.inc | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/ipc-lld/ipc-lld.inc b/recipes-bsp/ipc-lld/ipc-lld.inc
index 243678f..2909c20 100644
--- a/recipes-bsp/ipc-lld/ipc-lld.inc
+++ b/recipes-bsp/ipc-lld/ipc-lld.inc
@@ -1,4 +1,5 @@
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
@@ -6,24 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7eae093f2b09fd39307f30028a068b91"
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
@@ -35,3 +24,4 @@ PDK_COMP_LINK_TEXT = "IPCLLD"
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${PDK_INSTALL_PATH} "
 
 TI_PDK_LIMIT_CORES_append_am65xx-evm = " mcu1_1 "
+TI_PDK_COMP = "ti.drv.ipc"
-- 
2.7.4


