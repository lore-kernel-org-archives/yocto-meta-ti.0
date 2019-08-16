Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA4A1E00E7D; Thu, 15 Aug 2019 18:38:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EC31E00E0B
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 18:38:15 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7G1cEYf050341
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:38:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565919494;
	bh=e3duqq873zM8m7YphW71Upg1+yX+FD8j+hCQPPBP48U=;
	h=From:To:Subject:Date;
	b=RLlPS74FEXXXoBhbDb76XLJx7uDywQii7t96YuL2J6uSdS7oFmKvRZK15DMoM4xSw
	aUcf8Tujmqc+zP0+lS9GWrBokbWe7YxLLfL/DqEa5WPQOCzydgKIw+/m3SJxh6WU9X
	xlMpiE53WqlerSBQ3WjvmZS2fDT1rHchTkteKGAw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7G1cET5066944
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:38:14 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 15 Aug 2019 20:38:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 15 Aug 2019 20:38:14 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7G1cELL030259
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2019 20:38:14 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Aug 2019 21:38:09 -0400
Message-ID: <1565919489-34716-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2] udma-lld-rtos: Adding support for J7-evm
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
X-List-Received-Date: Fri, 16 Aug 2019 01:38:16 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Added LIMIT_CORES option to do_compile

 recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
index e18c4aa..09c1df8 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -36,7 +36,8 @@ UDMA_LLD_ROOTPATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/udma"
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
 export PDK_UDMA_ROOT_PATH = "${UDMA_PACKAGE_BASE}/package/all/pdk_/packages"
 
-TI_PDK_LIMIT_BOARDS_k3 = "am65xx_evm"
+TI_PDK_LIMIT_BOARDS_am65xx = "am65xx_evm"
+
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "UDMA LLD"
@@ -57,7 +58,7 @@ do_compile() {
     cd ${UDMA_LLD_ROOTPATH}
     
     # Build am65xx libraries
-    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" LIMIT_CORES="${TI_PDK_LIMIT_CORES}" 
 
     #archive
     tar -cf udma_lld.tar --exclude='*.tar' ./*
-- 
1.9.1


