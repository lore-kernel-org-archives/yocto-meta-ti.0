Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57F43E00AF8; Tue, 25 Apr 2017 04:26:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [198.47.19.16 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06863E00AF2
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 04:26:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3PBQE9u009931
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493119574;
	bh=WKaCLWXSbewdJaBHIA6cCg8NKYxwxxThPYvDMyLthrE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PFoA+kp0qtoGnBBozDkLUfwzKxzs27Rsy1ECcBThaG9km9LO/WXhOtWEUHdV1NUEt
	8GzC3oNsYSRMy93PqMck5XnRFI5R82qf0i32tUd6F7chXwGn6yfd3ytMf4tywJZtNu
	M17hWQ6xJ1jUdH+KeVInK0PbvwKpF/sFl6jd6Crs=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBQ9nj005522
	for <meta-ti@yoctoproject.org>; Tue, 25 Apr 2017 06:26:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Apr 2017 06:26:08 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3PBQ6dJ023407;
	Tue, 25 Apr 2017 06:26:08 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 25 Apr 2017 16:56:03 +0530
Message-ID: <1493119564-36769-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493119564-36769-1-git-send-email-a0393906@ti.com>
References: <1493119564-36769-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [morty v3 2/3] Remove CCS dependencies for all components
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
X-List-Received-Date: Tue, 25 Apr 2017 11:26:26 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 classes/ti-pdk.bbclass                      | 2 +-
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb        | 2 +-
 recipes-ti/ipc/ti-ipc-rtos.inc              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index fd7c3e7..eca3652 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -5,7 +5,7 @@ inherit perlnative
 
 DEPENDS = "ti-xdctools ti-cg-xml-native ti-sysbios common-csl-ip-rtos libxml-simple-perl-native gcc-arm-none-eabi-native ti-cgt6x-native ti-pdk-build-rtos"
 
-DEPENDS_append_omap-a15 = " ti-ccsv6-native"
+DEPENDS_append_omap-a15 = " ti-cgt-arm-native"
 DEPENDS_remove_ti33x = "ti-cgt6x-native"
 DEPENDS_remove_ti43x = "ti-cgt6x-native"
 
diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 6a01d0b..ce9ef85 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -4,7 +4,7 @@ require recipes-ti/includes/ti-staging.inc
 
 PR = "${INC_PR}.0"
 
-DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"
+DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 1a5d285..1291e69 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -29,7 +29,7 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ccsv6-native ti-ipc-rtos"
+DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
 
 export HWVERSION="ES10"
 export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 0d7e0e6..2a6cac0 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -43,7 +43,7 @@ DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
 "
 DEPENDS_append_omap-a15 = " ti-cgt6x-native \
-                            ti-ccsv6-native \
+                            ti-cgt-arm-native \
                             gcc-arm-none-eabi-native \
 "
 DEPENDS_append_omapl138 = " ti-cgt6x-native \
-- 
1.9.1


