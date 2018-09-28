Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 83FF3E00AB9; Fri, 28 Sep 2018 09:26:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7290E00B47
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQaCL105052
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151996;
	bh=i/PLChOLVWIPynUm7/xcM3dJSLpilZ+pMU4v7exshcI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Sz9ue1/b3aV9OkM36lAcMIAys0Bbo0weBpGnsHXP0mtAldPe6D0NxMVJ94OSNrFZR
	CTPmuKc8v81aqZU/EEIQTTsY8SLkxgIn9tuZ5Xz3QoeWZKFJVb9VwulajNyN9TNWIv
	oDCZXi4OJllyC4d0gDn8EbqUJAXtG5G1q4vQHJDE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQa4a000731
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:36 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMS011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:17 -0400
Message-ID: <1538151990-44823-17-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 16/29] pm-lld-rtos: Update to version 01.08.00.19 and k3 support
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:39 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 3e4e4f7..4dc43f6 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -5,30 +5,34 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 
 PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
 PM_LLD_GIT_PROTOCOL = "git"
-PM_LLD_GIT_BRANCH = "int_pm_am335x"
-PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
-PM_LLD_GIT_BRANCH_am57xx-evm = "master"
-PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05A"
-PM_LLD_SRCREV = "a5f12b8210ccea4b2e8848e54b4e178534771843"
+PM_LLD_GIT_BRANCH = "master"
+
+PM_LLD_GIT_BRANCH_ti33x = "int_pm_am335x"
+PM_LLD_GIT_BRANCH_ti43x = "int_pm_am335x"
+PM_LLD_GIT_BRANCH_k2g = "int_pm_am335x"
+
+PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
 
-# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.18"
-PM_LLD_SRCREV_dra7xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
-PM_LLD_SRCREV_am57xx-evm = "c1924e4cb882c5500ae012ad2d7d76d1fbe97037"
+# Below commit ID corresponds to "DEV.PM_LLD.01.08.00.19"
+PM_LLD_SRCREV = "9095c9d1b479d6d1ad483b8b0cf4568c83e599ec"
 
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.05B"
+PM_LLD_SRCREV_ti33x = "bac16125842f08d05156dccabec74947756d831b"
+PM_LLD_SRCREV_ti43x = "bac16125842f08d05156dccabec74947756d831b"
+PM_LLD_SRCREV_k2g = "bac16125842f08d05156dccabec74947756d831b"
 
 BRANCH = "${PM_LLD_GIT_BRANCH}"
 SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PM_LLD_SRCREV}"
-PV = "01.04.00.05A"
+PV = "01.08.00.19"
 PR = "r0"
 
 S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
@@ -40,6 +44,10 @@ DEPENDS_append_ti33x = " starterware-rtos \
 "
 DEPENDS_append_ti43x = " starterware-rtos \
 "
+
+DEPENDS_append_k3 = " sciclient-rtos \
+"
+
 export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
 export DEST_ROOT="${S}"
 
-- 
1.9.1


