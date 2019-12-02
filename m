Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.5941.1575313529536205423
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Dec 2019 11:05:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vadDi/Wz;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: j-stiffler@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 686DCE01101; Mon,  2 Dec 2019 11:05:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF772E0107F
	for <meta-ti@yoctoproject.org>; Mon,  2 Dec 2019 11:05:27 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB2J5RIM039496
	for <meta-ti@yoctoproject.org>; Mon, 2 Dec 2019 13:05:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575313527;
	bh=CS75XwwEJfyKpvQrYBz+q7Upq2gF/Qd03tu5eFx1PTk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vadDi/WzFACx7ZEHyMH7+GZaezVeoB4ipwEPMesOhhxTDiAxeGPVgotBzbTAWm36V
	 MZctyABaFCVUu7mMr+XWmhu8m3ecNwEfJb2pTYsTkN6HCnljy1+TXOyE8s2xrL7K62
	 8+siTYUPXk8YHyUskW8kLDOYqJ+u+2J9x2Q5A7qk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB2J5Rel007395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 2 Dec 2019 13:05:27 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 2 Dec
 2019 13:05:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 2 Dec 2019 13:05:26 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB2J4rlg070019;
	Mon, 2 Dec 2019 13:05:25 -0600
From: "Jacob Stiffler" <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <m-radhakrishnan2@ti.com>, Jacob Stiffler <j-stiffler@ti.com>
Subject: [master/thud][PATCH v2 33/42] transport-rtos: migrate to ti-pdk-fetch.bbclass
Date: Mon, 2 Dec 2019 13:45:37 -0500
Message-ID: <1575312346-16973-33-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575312346-16973-1-git-send-email-j-stiffler@ti.com>
References: <1575312346-16973-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

* Add new recipe for timesync-rtos

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* timesync: Remove inclusion of ti-path as this is already handled by
  ti-pdk.bbclass.

 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  |  4 +--
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb |  4 +--
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      |  4 +--
 recipes-bsp/transport-rtos/timesync-rtos_git.bb  | 31 ++++++++++++++++++++++++
 recipes-bsp/transport-rtos/transport.inc         | 12 +++------
 5 files changed, 37 insertions(+), 18 deletions(-)
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
index 0000000..556c128
--- /dev/null
+++ b/recipes-bsp/transport-rtos/timesync-rtos_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "RTOS driver for timesync driver"
+
+inherit ti-pdk
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

