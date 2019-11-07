Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5D512E00E0F; Thu,  7 Nov 2019 10:09:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 464A9E00BF7
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:53 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9qH0106927
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150192;
	bh=pQvv16pGs+HQqN6nQ9k+Doxq1AuB9+1ZCHDpnKldAJw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hg58jqHLnss8ZJFKW7kIYf3vPsVWy8uO3s6NE4LlSnURUPxZDC2rMqS9dlyc0J65d
	OsoQ3MGQSJbn0YBZLEw+6YGEYcDQXoC6cx2JjAfGJFuoiOuLO63GY0cbcpPWCiVDaz
	MCntDKPnm363JqSQ8tX3d1SduGmkSj1NDPRYcKmg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9qJS121289
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:52 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:36 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:37 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIR067418;
	Thu, 7 Nov 2019 12:09:52 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:16 -0500
Message-ID: <1573149037-762-22-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 21/42] osal: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/osal/osal-rtos_git.bb |  2 --
 recipes-bsp/osal/osal-test_git.bb |  2 --
 recipes-bsp/osal/osal.inc         | 16 ++++------------
 recipes-bsp/osal/osal_git.bb      |  2 --
 4 files changed, 4 insertions(+), 18 deletions(-)

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
index b0b015c..2cfe27b 100644
--- a/recipes-bsp/osal/osal.inc
+++ b/recipes-bsp/osal/osal.inc
@@ -4,17 +4,9 @@ LIC_FILES_CHKSUM = "file://osal.h;beginline=1;endline=31;md5=6fbde6922f8bca1e6cd
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-OSAL_GIT_URI = "git://git.ti.com/keystone-rtos/osal.git"
-OSAL_GIT_PROTOCOL = "git"
-OSAL_GIT_BRANCH = "master"
-OSAL_GIT_DESTSUFFIX = "git/ti/osal"
+inherit ti-pdk-fetch
+PE = "1"
 
-# Below commit ID corresponding to "DEV.OSAL.01.00.00.16B"
-OSAL_SRCREV = "b78489d9d78d9366f1865aa847b743b1b29f6fd4"
-
-BRANCH = "${OSAL_GIT_BRANCH}"
-SRC_URI = "${OSAL_GIT_URI};destsuffix=${OSAL_GIT_DESTSUFFIX};protocol=${OSAL_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${OSAL_SRCREV}"
-PV = "01.00.00.16B"
 INC_PR = "r0"
+
+TI_PDK_COMP = "ti.osal"
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


