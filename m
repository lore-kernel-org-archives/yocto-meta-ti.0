Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C06ADE00E23; Thu,  7 Nov 2019 10:09:54 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE793E00BA1
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:51 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9pA0039653
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150191;
	bh=X8bwZUmyrfDKBrt/+gwNO3LPvOcNSsMMMcZL0EL4xmw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zIc10V19V8e4XSYD5Cl451066Hp1RAAL21w7WoXhd5NucHci3NK2MntYRzTiJhLX1
	r0SosGAACDxIoHn9G/vrxtS9zWtB5HhGSg7mCoLrvGWVwoIvEYog/8CoqAhwN6oCqM
	isBh59b1xl9NS23ni1zWsVx17u4qaEnwDYKgN47o=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9pZb121266
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:35 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIN067418;
	Thu, 7 Nov 2019 12:09:51 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:12 -0500
Message-ID: <1573149037-762-18-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 17/42] mcasp-lld: migrate to ti-pdk-fetch.bbclass
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
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
index 808a02a..e2c7207 100644
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low level driver for Multi channel Audio Serial port (McASP)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=19;endline=47;md5=75a9adc782a6df0d3a5419743e9a9f18"
@@ -8,22 +9,9 @@ LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=19;endline=47;md5=75a9adc782a6df
 COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-MCASP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcasp-lld.git"
-MCASP_LLD_GIT_PROTOCOL = "git"
-MCASP_LLD_GIT_BRANCH = "master"
-MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
 
-# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.15C"
-MCASP_LLD_SRCREV = "3b206c0081cc3e78122982948b40a16e2e24522c"
-
-BRANCH = "${MCASP_LLD_GIT_BRANCH}"
-SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${MCASP_LLD_SRCREV}"
-PV = "01.01.00.15C"
 PR = "r0"
 
-S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
 
 DEPENDS_append = " edma3-lld-rtos \
                    osal-rtos \
@@ -48,3 +36,4 @@ XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "MCASP LLD"
+TI_PDK_COMP = "ti.drv.mcasp"
-- 
2.7.4


