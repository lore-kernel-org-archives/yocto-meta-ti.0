Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A17BBE00C58; Fri, 13 Apr 2018 10:12:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30375E00B65
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 10:12:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DHClai024291
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523639567;
	bh=WxJvnL8bKoIu+uTNPhljADBv5JpnIg+Ki0WtIdx5DOA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pskeNURW0pdbeagLBFjU6ffFB7b4qQg9AR5TZOmEN0OT0xIUapLcNiKKyfAYhk+r4
	HdEm9dihi/k8BciceG1869STyl9AycdGFs8ev92/MhJvBlJQCMjwKKuZYBIRHWlubN
	bGWw17Gf3ywNf9cr8bl8xed/udPSFfc8ujhJ7G/k=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHClLS012471
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:47 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 12:12:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 12:12:47 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfMK020225;
	Fri, 13 Apr 2018 12:12:47 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Apr 2018 13:02:18 -0400
Message-ID: <1523638939-28861-23-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 22/23] starterware:starterware-rtos: Udpate to version 02.01.01.06C & rtos updates
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
X-List-Received-Date: Fri, 13 Apr 2018 17:12:48 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

This also includes rtos receipes changes required as a part of update to
02.01.01.06C

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/starterware/starterware-rtos_git.bb | 7 +++++--
 recipes-bsp/starterware/starterware.inc         | 6 +++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/starterware/starterware-rtos_git.bb b/recipes-bsp/starterware/starterware-rtos_git.bb
index 88176bb..b846c04 100644
--- a/recipes-bsp/starterware/starterware-rtos_git.bb
+++ b/recipes-bsp/starterware/starterware-rtos_git.bb
@@ -1,6 +1,6 @@
 require starterware.inc
 
-DEPENDS = "gcc-arm-none-eabi-native"
+DEPENDS = "gcc-arm-none-eabi-native ti-pdk-build-rtos"
 
 require recipes-ti/includes/ti-paths.inc
 
@@ -11,6 +11,8 @@ PARTNO_ti43x = "am437x"
 
 export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
 export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
 
 do_compile() {
     cd build
@@ -27,4 +29,5 @@ FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_SYSROOT_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-INSANE_SKIP_${PN} = "arch staticdev"
+INSANE_SKIP_${PN} = "arch staticdev file-rdeps"
+
diff --git a/recipes-bsp/starterware/starterware.inc b/recipes-bsp/starterware/starterware.inc
index ba17ef2..7772c84 100644
--- a/recipes-bsp/starterware/starterware.inc
+++ b/recipes-bsp/starterware/starterware.inc
@@ -8,14 +8,14 @@ STARTERWARE_GIT_URI = "git://git.ti.com/keystone-rtos/starterware.git"
 STARTERWARE_GIT_PROTOCOL = "git"
 STARTERWARE_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.05"
-STARTERWARE_SRCREV = "58526af258ef9a10a9eec32d2a6e3a1c9e6f9e88"
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.06C"
+STARTERWARE_SRCREV = "c8bbba0b37303529307be608ecca5fee66099973"
 
 BRANCH = "${STARTERWARE_GIT_BRANCH}"
 SRC_URI = "${STARTERWARE_GIT_URI};protocol=${STARTERWARE_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${STARTERWARE_SRCREV}"
-PV = "02.01.01.05"
+PV = "02.01.01.06C"
 INC_PR = "r0"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


