Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A726E00C1D; Thu, 27 Sep 2018 13:43:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18CCFE00C3D
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:43:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKhcGb097788
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081018;
	bh=orfjcTKFQWjvAzBhJcuYD24pdlugN2U08Yf6K4o69zI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=w7c46kHKmv8YhjqQx/R5cdJnDRNsjA/+iJnzOnDUKFeAKjc1/kWdqNDa5z8QzqExu
	YfxEI2I65qh35+dM5bGmS8gk0BByrewDwK1+sXv8OcnyeFFjmmCBV3RmQpI5EYbVPr
	5cgaQobROOo0BpIL0zHArHAhUDt+MD0ck8TeNzq8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhcHG025536
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:38 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:43:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:43:38 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhbi6003847
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:38 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 16:43:04 -0400
Message-ID: <1538081009-52859-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 05/30] uart-lld-rtos: Update to version 01.00.00.12
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
X-List-Received-Date: Thu, 27 Sep 2018 20:43:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
index 8e11539..8c84270 100644
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -6,21 +6,21 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://UART.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
 UART_LLD_GIT_PROTOCOL = "git"
 UART_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.11"
-UART_LLD_SRCREV = "cf52e52665a018fbc4e4acbe0e8685473c6b678c"
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.12"
+UART_LLD_SRCREV = "224f9d87ed06ca4392744d394d0adaad6d2c392c"
 
 BRANCH = "${UART_LLD_GIT_BRANCH}"
 SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UART_LLD_SRCREV}"
-PV = "01.00.00.11"
+PV = "01.00.00.12"
 PR = "r0"
 
 DEPENDS_append = " edma3-lld-rtos \
@@ -29,6 +29,9 @@ DEPENDS_append = " edma3-lld-rtos \
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
 
+DEPENDS_remove_k3 = "edma3-lld-rtos "
+DEPENDS_append_k3 = " udma-lld-rtos "
+
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-- 
1.9.1


