Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 878EAE00EE0; Fri, 15 Nov 2019 07:34:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89982E00E97
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:19 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYIws045769
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832058;
	bh=4v2pGizpmCTZUAWqFV8zChxIah+Q0hQW0Sa+SCAlKZQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=NJtFW2j1oxRzBtjyB7/k0oxPfBTFHDRUND7g+eYA3rBbXtSudMHcjfC1FeOVawUXE
	b6iNuImbb+VlHM3HgBc7Fe04PY3FX2Dknr4tqLQB6fylX1iw9lRmgir0o19NkaLW01
	alaDB9EiBp0wgeAqpS8Xx9UqznabHaz3UulV5QhY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYIPL095176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:18 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:17 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfh041975;
	Fri, 15 Nov 2019 09:34:17 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:41 -0500
Message-ID: <1573830902-17409-22-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 21/42] osal: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:20 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/osal/osal-rtos_git.bb |  2 --
 recipes-bsp/osal/osal-test_git.bb |  2 --
 recipes-bsp/osal/osal.inc         | 14 ++++----------
 recipes-bsp/osal/osal_git.bb      |  2 --
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/recipes-bsp/osal/osal-rtos_git.bb b/recipes-bsp/osal/osal-rtos_git.bb
index 62d1f99..a718f7c 100644
--- a/recipes-bsp/osal/osal-rtos_git.bb
+++ b/recipes-bsp/osal/osal-rtos_git.bb
@@ -5,8 +5,6 @@ PR = "${INC_PR}.0"
 
 COMPATIBLE_MACHINE_append = "|c66x|k3"
 
-S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
-
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
 
diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test_git.bb
index 58156e3..354aa79 100644
--- a/recipes-bsp/osal/osal-test_git.bb
+++ b/recipes-bsp/osal/osal-test_git.bb
@@ -6,8 +6,6 @@ include osal.inc
 
 PR = "${INC_PR}.1"
 
-S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
-
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}"
 
 do_compile () {
diff --git a/recipes-bsp/osal/osal.inc b/recipes-bsp/osal/osal.inc
index b0b015c..1f0a077 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -4,17 +4,11 @@ LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=6fbde6922f8bca1e6cd
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-OSAL_GIT_URI = "git://git.ti.com/keystone-rtos/osal.git"
-OSAL_GIT_PROTOCOL = "git"
-OSAL_GIT_BRANCH = "master"
-OSAL_GIT_DESTSUFFIX = "git/ti/osal"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.16B"
-OSAL_SRCREV = "b78489d9d78d9366f1865aa847b743b1b29f6fd4"
+TI_PDK_COMP = "ti.osal"
 
-BRANCH = "${OSAL_GIT_BRANCH}"
-SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
+PE = "1"
 
-SRCREV = "${OSAL_SRCREV}"
-PV = "01.00.00.16B"
 INC_PR = "r0"
+
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
index 8f58937..4f881d2 100644
--- a/recipes-bsp/osal/osal_git.bb
+++ b/recipes-bsp/osal/osal_git.bb
@@ -6,8 +6,6 @@ include osal.inc
 
 PR = "${INC_PR}.1"
 
-S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
-
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
 do_compile () {
-- 
2.7.4


