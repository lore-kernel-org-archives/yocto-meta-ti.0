Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 51FA0E008D9; Thu,  7 Nov 2019 10:10:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8FE4E00E0F
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:57 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9v3D070530
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150197;
	bh=R/ZivR+sULyPnipy2LdQKpmxO4NFE7OZSXFGp5+8r1Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gRk9YHQOKE/Fqh2lN0hovJp8xg7vLFVwz7ylbp8lQV59pMIB90xAlNUafkmOjn0ZF
	m6DOth4ezhvDKEH5CPKWkxLLY9bGmHgmtxsZLrv23HB7jr5y11a1BYfJmKFys3dFzd
	7zvbuCBIAsiNXq9jOGfHDhloSnWZopUZiNterlHw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9vYA004252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:57 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:40 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIg067418;
	Thu, 7 Nov 2019 12:09:56 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:31 -0500
Message-ID: <1573149037-762-37-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 36/42] udma-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
index c3352c1..8a58764 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -1,7 +1,8 @@
 SUMMARY = "TI RTOS low level driver for UDMA"
 DESCRIPTION = "TI RTOS low level driver for Universal DMA module "
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://udma.h;beginline=1;endline=31;md5=83d177cf3df55c16b27ae4102b6ade9a"
@@ -9,18 +10,6 @@ LIC_FILES_CHKSUM = "file://udma.h;beginline=1;endline=31;md5=83d177cf3df55c16b27
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-UDMA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/udma-lld.git"
-UDMA_LLD_GIT_PROTOCOL = "git"
-UDMA_LLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.04"
-UDMA_LLD_SRCREV = "67edfa436beb3362051a097b456ba07c95faa4a6"
-
-BRANCH = "${UDMA_LLD_GIT_BRANCH}"
-SRC_URI = "${UDMA_LLD_GIT_URI};protocol=${UDMA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${UDMA_LLD_SRCREV}"
-PV = "01.00.00.04"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
@@ -30,7 +19,7 @@ DEPENDS_append = " osal-rtos \
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-UDMA_PACKAGE_BASE   = "${S}/../udma_base"
+UDMA_PACKAGE_BASE   = "${WORKDIR}/udma_base"
 UDMA_LLD_ROOTPATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/udma"
 
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
@@ -71,3 +60,4 @@ do_install() {
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
 
 INSANE_SKIP_${PN} = "arch ldflags"
+TI_PDK_COMP = "ti.drv.udma"
-- 
2.7.4


