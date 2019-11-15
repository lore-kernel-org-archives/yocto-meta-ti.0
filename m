Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABDF0E00D99; Fri, 15 Nov 2019 07:34:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33EE9E00C5C
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:22 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYL5U038860
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832061;
	bh=YEO3hgT9YLjEKFOpDNEmsMeWGyTlVM/RYBYN1YRMuQg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vQCoAIR2x4uUbwkvV0Cc22GuILO99vQfsTrwUuC2GRxdqkWLYpaxmaMQr2jKtWf5u
	fJzIXJUth8l5/9nl1PPYSuyuwbdFHXtL6M32xMUYiDPYB+z13TIeE2LUXfiLhPB/M3
	LV3zVoKMALWgcIZCkYXY3UEG+GnpdE30edlICM7s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYLto010636
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:21 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:21 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBft041975;
	Fri, 15 Nov 2019 09:34:21 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:53 -0500
Message-ID: <1573830902-17409-34-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 33/42] transport-rtos: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:22 -0000
Content-Type: text/plain

* Add new recipe for timesync-rtos

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  |  4 +--
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb |  4 +--
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      |  4 +--
 recipes-bsp/transport-rtos/timesync-rtos_git.bb  | 32 ++++++++++++++++++++++++
 recipes-bsp/transport-rtos/transport.inc         | 12 +++------
 5 files changed, 38 insertions(+), 18 deletions(-)
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
index 0000000..e776c66
--- /dev/null
+++ b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "RTOS driver for timesync driver"
+
+inherit ti-pdk
+require recipes-ti/includes/ti-paths.inc
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
index 345cd6d..866d7a3 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -2,16 +2,10 @@ LICENSE = "BSD-3-Clause"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
-TRANSPORT_GIT_PROTOCOL = "git"
-TRANSPORT_GIT_BRANCH = "master"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.17A"
-TRANSPORT_SRCREV = "9ed171c476a5606777d2dcb4e831c279a5160245"
+TI_PDK_COMP = "ti.transport"
 
-BRANCH = "${TRANSPORT_GIT_BRANCH}"
-SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
+PE = "1"
 
-SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.17A"
 INC_PR = "r0"
-- 
2.7.4


