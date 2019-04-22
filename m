Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 375F2E00D2A; Mon, 22 Apr 2019 11:58:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C7E2BE00CEA
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2019 11:58:46 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3MIwkjE039797
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2019 13:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1555959526;
	bh=SPKWhF6jA0Drp3eZZJlL6Mt9TO4v8VZYlCzDGGwMizA=;
	h=From:To:CC:Subject:Date;
	b=pTcnPCVLoLA1nn1c85Y7bMii0ZP+m0loEnPQhfdGyfHDDTNU93TRHb1AuEtGf/nvt
	GSiObMSpuBwXnO6eCwzdeQUl7XjH+jrBJCqGxGkn2n/spaRMIqxJPtDR4RUtvhOokN
	80Qo+QM6tyhoYhsOAzy1fRNgVXFhHX5/95CLHTgQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3MIwkKS115348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2019 13:58:46 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 22 Apr 2019 13:58:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 22 Apr 2019 13:58:45 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3MIwjJk105729;
	Mon, 22 Apr 2019 13:58:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 22 Apr 2019 14:46:36 -0400
Message-ID: <1555958796-28517-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: a-kramer@ti.com
Subject: [master/thud][PATCH v2] prueth-fw: use icss-emac-lld sources
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
X-List-Received-Date: Mon, 22 Apr 2019 18:58:55 -0000
Content-Type: text/plain

* prueth-fw and icss-emac-lld shared the same source repo, so make
  them share the same inc file which specifies the sources.
* Add the FW versions to the icss-emac-lld.inc so that there can be
  a single location for updates.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
Move LIC_FILES_CHKSUM after including common file so that it is valid.

 recipes-bsp/icss-emac-lld/icss-emac-lld.inc |  6 ++++++
 recipes-bsp/prueth-fw/prueth-fw_git.bb      | 21 +++++----------------
 2 files changed, 11 insertions(+), 16 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index ebe66af..9c93b75 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -16,7 +16,13 @@ BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
+
+# The LLD version
 PV = "01.00.00.15A"
+
+# The FW version(s)
+PV_DUALEMAC_FW = "5.2.7"
+
 INC_PR = "r0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index ddcb9ec..573a428 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -1,24 +1,13 @@
 DESCRIPTION = "PRU Ethernet firmware for AM57xx, AM437x, AM335x and K2G"
 
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
-
 require recipes-ti/includes/ti-paths.inc
+require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
 
-ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
-ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
-ICSS_EMAC_LLD_GIT_BRANCH = "master"
-ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
-
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.14"
-ICSS_EMAC_LLD_SRCREV = "7541d801b2f1be93fd02511cdf2143b0a200cc36"
-
-BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
-SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
 
-SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-PV = "5.2.0"
-PR = "r0"
+PV = "${PV_DUALEMAC_FW}"
+PR = "${INC_PR}.0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}/firmware/icss_dualemac"
 
-- 
2.7.4


