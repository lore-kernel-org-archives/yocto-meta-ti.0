Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 835EBE010F0; Thu, 19 Jul 2018 10:24:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87644E0141D
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOSh3022020
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021068;
	bh=c+6TR9ACffOmy3JGmOJnDUxLPeAK2lm4+Kx3KE1cv/A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YvIwJEvTaEEVNnppLOM2IPHozMuj1Yu9laG7zLvupO4uPrk9FksXYn8fY0Ra4LQYn
	bi9+OKFBQtjsw0WTk+dk4AlNtNxhHCP/3kiXOmCb9578ICAhrM9jzyg3mM/xAZfKGa
	1UiadXHrac7FmEhv4ACAc6rf1Oel1pRF4T3faJv0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOSvU011601
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:28 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:28 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORo023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:53 -0400
Message-ID: <1532021058-48916-21-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 20/45] mcbsp-lld-rtos: Update to version 1.0.0.10 after adding support for ompal1, makefile based build
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:34 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
index 5573e10..f65e22a 100644
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://mcbspver.h;beginline=1;endline=47;md5=a8a39efd13fa6fe66da5461b898d620e"
 
-COMPATIBLE_MACHINE = "k2g|c665x-evm"
+COMPATIBLE_MACHINE = "k2g|c665x-evm|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 MCBSP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcbsp-lld.git"
@@ -13,14 +13,14 @@ MCBSP_LLD_GIT_PROTOCOL = "git"
 MCBSP_LLD_GIT_BRANCH = "master"
 MCBSP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcbsp"
 
-# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.09"
-MCBSP_LLD_SRCREV = "e782f251a7009c786a208a15e6bc0331bb6808f6"
+# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.10"
+MCBSP_LLD_SRCREV = "4b53ebb479c769dac4908b759191f62b3b90ce4d"
 
 BRANCH = "${MCBSP_LLD_GIT_BRANCH}"
 SRC_URI = "${MCBSP_LLD_GIT_URI};destsuffix=${MCBSP_LLD_GIT_DESTSUFFIX};protocol=${MCBSP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MCBSP_LLD_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.10"
 PR = "r0"
 
 S = "${WORKDIR}/${MCBSP_LLD_GIT_DESTSUFFIX}"
@@ -31,5 +31,10 @@ DEPENDS_append = " edma3-lld-rtos \
 export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
 XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
 
+TI_PDK_XDCMAKE = "0"
+
+export PDK_MCBSP_ROOT_PATH = "${WORKDIR}/build"
+export DEST_ROOT = "${S}"
+
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "MCBSP LLD"
-- 
1.9.1


