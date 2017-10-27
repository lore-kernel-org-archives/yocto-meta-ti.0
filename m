Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25930E00D48; Fri, 27 Oct 2017 09:00:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E49D5E00C01
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 09:00:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9RG0MaV031896
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 11:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509120022;
	bh=hosIMM1sgS9vRsOJP1w6gugh2/23Ifh3XRdFLYai1Ko=;
	h=From:To:CC:Subject:Date;
	b=kSxjesXDVOFDe3avohjQRQDl6mgMr9Mwt8MpTpDP9tUd9sT1/tgctQMsL16esrkhT
	j/lDJA8IW5uvashBT/rZCm318MTNETfl9PDo/eZ3NOjDuwWL50K0tchGLrIPD8Kzw4
	qVIpC05Jfp/hX/w/8Edxmi5xdJGdpFMZ41T54dhQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9RG0MPR009252
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 11:00:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 27 Oct 2017 11:00:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 27 Oct 2017 11:00:21 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9RG0JP9022034;
	Fri, 27 Oct 2017 11:00:20 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 27 Oct 2017 21:30:18 +0530
Message-ID: <1509120018-67109-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] Remove CCS dependencies for all components
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
X-List-Received-Date: Fri, 27 Oct 2017 16:00:24 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

from meta-ti/morty ead9802 

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
index 1ec9896..2765ef5 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -29,7 +29,7 @@ require recipes-ti/includes/ti-staging.inc
 
 inherit update-alternatives
 
-DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ccsv6-native ti-ipc-rtos"
+DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-cgt-arm-native ti-ipc-rtos"
 
 export HWVERSION="ES10"
 export BIOSTOOLSROOT="${STAGING_DIR_TARGET}/usr/share/ti"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index b29e984..696a897 100644
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
 IPC_TARGETS = ""
-- 
1.9.1


