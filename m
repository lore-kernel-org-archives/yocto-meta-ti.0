Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 702BBE00D77; Wed, 26 Jun 2019 09:06:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA66FE00D74
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 09:06:40 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QG6eCe000722
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 11:06:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561565200;
	bh=ZasL5uNAcAsQXLCyyQ9M2b3SS2QWvX8AuZTX2QWvT7Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qK11M8kutNhfPhl1oaTpzrd/dzBhL39aqXLILuOFLnNRjnURqn3cNFBWyARG4iDYa
	H1nHdx59bJ/fTTEG34eyY/sEMphmyvOe/Du8ozeRUmdpsar3xlbuSE1Kz1cICTEbsn
	+ejkzffwy5yOLRLemSzkrNhMKEKKO6dFoSXIjM4Q=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QG6eDH014982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 11:06:40 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 11:06:40 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 11:06:39 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QG6cPf042136;
	Wed, 26 Jun 2019 11:06:39 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 26 Jun 2019 11:49:50 -0400
Message-ID: <1561564193-15418-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561564193-15418-1-git-send-email-j-stiffler@ti.com>
References: <1561564193-15418-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud/ti2019.01][PATCH v3 2/5] emac-lld: separate SRC_URI in inc file
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
X-List-Received-Date: Wed, 26 Jun 2019 16:06:41 -0000
Content-Type: text/plain

* The emac-lld also contains sources for the prueth-fw on am65xx.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v3 changes:
* Drop FW version as the tag version will be embedded in the firmware
  binary.

 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 18 ++++--------------
 recipes-bsp/emac-lld/emac-lld.inc         | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 14 deletions(-)
 create mode 100644 recipes-bsp/emac-lld/emac-lld.inc

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
index 1232482..2af38b9 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -2,26 +2,16 @@ SUMMARY = "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral"
 
 inherit ti-pdk
 
+require emac-lld.inc
+
+PR = "r0"
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
-EMAC_LLD_GIT_PROTOCOL = "git"
-EMAC_LLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16"
-EMAC_LLD_SRCREV = "f90f832dc63b60b234c3f5ae2ff4d774728e83bf"
-
-BRANCH ="${EMAC_LLD_GIT_BRANCH}"
-SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${EMAC_LLD_SRCREV}"
-PV = "01.00.03.16"
-PR = "r0"
-
 DEPENDS_append = " board-rtos osal-rtos"
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
new file mode 100644
index 0000000..5fd24bc
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld.inc
@@ -0,0 +1,14 @@
+EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
+EMAC_LLD_GIT_PROTOCOL = "git"
+EMAC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.16"
+EMAC_LLD_SRCREV = "f90f832dc63b60b234c3f5ae2ff4d774728e83bf"
+
+BRANCH ="${EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${EMAC_LLD_SRCREV}"
+
+# The LLD version
+PV = "01.00.03.16+git${SRCPV}"
-- 
2.7.4


