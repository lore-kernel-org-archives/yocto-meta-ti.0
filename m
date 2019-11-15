Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44262E00E89; Fri, 15 Nov 2019 07:34:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11280E00E7B
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:20 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYJ0h067954
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832059;
	bh=b+umzUAAJT9pQtRgZcmhhqLM6Vzid2rkAPdzAf3TVug=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i5JqEfcLlg8cQjwzOJpE5LMPFYCypK0C6hqOwHmkYJEi9Mba+leTCGx7vt8aw0TSo
	LCX5/etVPn8ElrCiSgv6py3HMUZd91dPmZZ4uBLpsMiOHcm/lNwhDDtSAzvo403e/m
	xFx5FZ/5iCr6/VYrdC5fxShAVo2m8EH1Aq+pJFI0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYJ4i050833
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:19 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:19 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfm041975;
	Fri, 15 Nov 2019 09:34:19 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:46 -0500
Message-ID: <1573830902-17409-27-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 26/42] pruss-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb |  2 --
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb |  2 --
 recipes-bsp/pruss-lld/pruss-lld-test_git.bb |  2 --
 recipes-bsp/pruss-lld/pruss-lld.inc         | 13 +++----------
 recipes-bsp/pruss-lld/pruss-lld_git.bb      |  2 --
 5 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
index 5867984..48eab40 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
@@ -9,8 +9,6 @@ include pruss-lld.inc
 
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
-
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=${S}"
 
 
diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
index b8db20e..9ab09b6 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -6,8 +6,6 @@ require recipes-bsp/pruss-lld/pruss-lld.inc
 COMPATIBLE_MACHINE_append = "|k3"
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
-
 DEPENDS_append = " osal-rtos"
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
diff --git a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
index 93f1901..8007f65 100644
--- a/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld-test_git.bb
@@ -6,8 +6,6 @@ include pruss-lld.inc
 
 PR = "${INC_PR}.2"
 
-S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
-
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PRUSS_SRC_DIR=${S}"
 
 DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pruss-lld.inc
index 1fd3fb7..793ba83 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -4,18 +4,11 @@ LIC_FILES_CHKSUM = "file://pruicss.h;beginline=1;endline=31;md5=315177aa03d58bcd
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PRUSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pruss-lld.git"
-PRUSS_LLD_GIT_PROTOCOL = "git"
-PRUSS_LLD_GIT_BRANCH = "master"
-PRUSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/pruss"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.15B"
-PRUSS_LLD_SRCREV = "989f802266d52f50a6db8f2be6967eacd9d2b409"
+TI_PDK_COMP = "ti.drv.pruss"
 
-BRANCH = "${PRUSS_LLD_GIT_BRANCH}"
-SRC_URI = "${PRUSS_LLD_GIT_URI};destsuffix=${PRUSS_LLD_GIT_DESTSUFFIX};protocol=${PRUSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+PE = "1"
 
-SRCREV = "${PRUSS_LLD_SRCREV}"
-PV = "01.00.00.15B"
 INC_PR = "r0"
 
diff --git a/recipes-bsp/pruss-lld/pruss-lld_git.bb b/recipes-bsp/pruss-lld/pruss-lld_git.bb
index 5b0a257..f1e93cd 100644
--- a/recipes-bsp/pruss-lld/pruss-lld_git.bb
+++ b/recipes-bsp/pruss-lld/pruss-lld_git.bb
@@ -6,8 +6,6 @@ include pruss-lld.inc
 
 PR = "${INC_PR}.2"
 
-S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
-
 EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
2.7.4


