Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66FE2E00E13; Thu,  7 Nov 2019 10:10:02 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 479D1E00D77
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:56 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9uIr039683
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150196;
	bh=eGdd21ohan0rFJXMEGGsYdSez4jI0SGkBqdJFBv+9ic=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Jn49vvyy/CVvsL1039DIfA5wC8YG9147wVvOhs7LaVzeIZcKz5ZtOhewGCHxsXEof
	fH+j2KLasQTq/eI9H7Im3oJCROZIB0fI9ux47vjE/Mzh1tjAnmUSdRpAJtmMHItjby
	6IJUTKLCQ/0lTPFVR6G6hathyucDobk5mS6v3nX8=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9uN7121348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:56 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:40 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jId067418;
	Thu, 7 Nov 2019 12:09:55 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:28 -0500
Message-ID: <1573149037-762-34-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 33/42] transport-rtos: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  |  4 +--
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb |  4 +--
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      |  4 +--
 recipes-bsp/transport-rtos/timesync-rtos_git.bb  | 32 ++++++++++++++++++++++++
 recipes-bsp/transport-rtos/transport.inc         | 14 +++--------
 5 files changed, 38 insertions(+), 20 deletions(-)
 create mode 100644 recipes-bsp/transport-rtos/timesync-rtos_git.bb

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
index 137476e..f14161f 100644
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
@@ -13,9 +13,7 @@ DEPENDS_append = " qmss-lld-rtos \
                    cppi-lld-rtos \
 "
 
-BMET_ETH_DESTSUFFIX = "git/bmet_eth"
-
-S = "${WORKDIR}/${BMET_ETH_DESTSUFFIX}"
+TI_PDK_COMP = "ti.transport.bmet_eth"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "Baremetal Ethernet Transport"
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
index 4750e04..02ddc47 100644
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
@@ -17,13 +17,11 @@ DEPENDS_append_c665x-evm = " emac-lld-rtos"
 DEPENDS_append_c667x-evm = " pa-lld-rtos"
 DEPENDS_append_omapl1 = " emac-lld-rtos"
 
-NIMU_ICSS_DESTSUFFIX = "git/ndk/nimu_icss"
+TI_PDK_COMP = "ti.transport.ndk.nimu_icss"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-S = "${WORKDIR}/${NIMU_ICSS_DESTSUFFIX}"
-
 export PDK_NIMU_ICSS_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
 
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
index 1e3bc18..4389b1e 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -9,9 +9,7 @@ LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
 
-NIMU_DESTSUFFIX = "git/ndk/nimu"
-
-S = "${WORKDIR}/${NIMU_DESTSUFFIX}"
+TI_PDK_COMP = "ti.transport.ndk.nimu"
 
 DEPENDS_append = " ti-ndk osal-rtos"
 DEPENDS_append_ti33x = " starterware-rtos emac-lld-rtos"
diff --git a/recipes-bsp/transport-rtos/timesync-rtos_git.bb b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
new file mode 100644
index 0000000..e39096a
--- /dev/null
+++ b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "RTOS driver for timesync driver"
+
+inherit ti-pdk
+require recipes-ti/includes/ti-paths-append.inc
+require recipes-bsp/transport-rtos/transport.inc
+
+PR = "${INC_PR}.0"
+
+LIC_FILES_CHKSUM = "file://timeSync_ver.h;beginline=23;endline=45;md5=4bd873035e47065aaa811e53622992e9"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+
+DEPENDS_append = " ti-ndk \
+                   osal-rtos \
+                   pruss-lld-rtos \
+                   icss-emac-lld-rtos \
+                   nimu-icss-rtos \
+                   edma3-lld-rtos \
+"
+
+TI_PDK_COMP = "ti.transport.timeSync"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_TIMESYNC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+export NDK_INSTALL_PATH = "${NDK_INSTALL_DIR}"
+export EDMA3LLD_BIOS6_INSTALLDIR = "${EDMA3_LLD_INSTALL_DIR}"
+
+XDCPATH_append = ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
index 345cd6d..2d6c8d6 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -2,16 +2,8 @@ LICENSE = "BSD-3-Clause"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
-TRANSPORT_GIT_PROTOCOL = "git"
-TRANSPORT_GIT_BRANCH = "master"
+inherit ti-pdk-fetch
+PE = "1"
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.17A"
-TRANSPORT_SRCREV = "9ed171c476a5606777d2dcb4e831c279a5160245"
-
-BRANCH = "${TRANSPORT_GIT_BRANCH}"
-SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.17A"
 INC_PR = "r0"
+TI_PDK_COMP = "ti.transport"
-- 
2.7.4


