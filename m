Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98760E00E18; Thu,  7 Nov 2019 10:10:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 479E3E00E14
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:56 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9uoU039673
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150196;
	bh=gi3KoB/J/WpKDEHl8l5u7fNLMlkqz2IY4U7Q08srgPc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FvoM+adKm80jx97xq9vBHKuEl4yMPjsQoVsI9y0wPMX4MIC8RPZlFhI/CShkuyR0t
	NBnHmelpwTw31rWFYfLv20zQWMkUumpX8GgzWL7Ts4F0h0k1nTw26y1SmCj1sLlEOr
	rbgmcwOEGv9f2lsdr4ymCqjwF+HeMGoXNdjyNryQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9uRs125264
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:56 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:40 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIc067418;
	Thu, 7 Nov 2019 12:09:55 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:27 -0500
Message-ID: <1573149037-762-33-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 32/42] tcp3d-lld: migrate to ti-pdk-fetch.bbclass
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
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
index 31922c2..5428cc9 100644
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI third generation Turbo Coprocessor (TCP3) low level driver"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://tcp3dver.h;beginline=1;endline=47;md5=3fe46c6320fb9ca4ac6692961402beb7"
@@ -8,23 +9,8 @@ LIC_FILES_CHKSUM = "file://tcp3dver.h;beginline=1;endline=47;md5=3fe46c6320fb9ca
 COMPATIBLE_MACHINE = "k2hk|k2l|c66x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TCP3D_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/tcp3d-lld.git"
-TCP3D_LLD_GIT_PROTOCOL = "git"
-TCP3D_LLD_GIT_BRANCH = "master"
-TCP3D_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
-
-# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.06B"
-TCP3D_LLD_SRCREV = "a8b3791044edf632e8348cdbd287d48a754d11ac"
-
-BRANCH = "${TCP3D_LLD_GIT_BRANCH}"
-SRC_URI = "${TCP3D_LLD_GIT_URI};destsuffix=${TCP3D_LLD_GIT_DESTSUFFIX};protocol=${TCP3D_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${TCP3D_LLD_SRCREV}"
-PV = "02.01.00.06B"
 PR = "r0"
 
-S = "${WORKDIR}/${TCP3D_LLD_GIT_DESTSUFFIX}"
-
 DEPENDS_append = " edma3-lld-rtos"
 
 export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
@@ -32,3 +18,4 @@ XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "TCP3D LLD"
+TI_PDK_COMP = "ti.drv.tcp3d"
-- 
2.7.4


