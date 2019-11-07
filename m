Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5E351E00E11; Thu,  7 Nov 2019 10:09:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 863B3E00E22
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:54 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9siE020123
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150194;
	bh=MxAHtCaN4NThNIsPDheAost+40x8qkd0O+3FrZfxWJM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=A3y+8EuvHSOVikNsEwQ2Kuog8oQG13xK6bV5/bRM2GqZFcgdq2gUwbYr3HEjVmYUQ
	nnVjiQJrVrDGWK1uH711lpog6dwBdGkAwSHCx2rhaDQQgrnO9NTYTCYEEHR1TUInE5
	N6QdyMO8SecRt8O2d9VDzHMmN5LqZC8oAE9PYEug=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9rMo004201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:53 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:38 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:38 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIV067418;
	Thu, 7 Nov 2019 12:09:53 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:20 -0500
Message-ID: <1573149037-762-26-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 25/42] prueth-fw: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb | 6 ++++--
 recipes-bsp/prueth-fw/prueth-fw_git.bb       | 7 ++++---
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
index 08ef7f0..430e2a4 100644
--- a/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw-am65x_git.bb
@@ -4,11 +4,13 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-bsp/emac-lld/emac-lld.inc
 
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://src/makefile;beginline=6;endline=53;md5=3f9129d208f240940749757214bdc191"
+LIC_FILES_CHKSUM = "file://icss_dualmac/src/makefile;beginline=6;endline=53;md5=3f9129d208f240940749757214bdc191"
 
 PR = "r0"
 
-S = "${WORKDIR}/git/firmware/icss_dualmac"
+TI_PDK_COMP = "ti.drv.emac.firmware"
+
+B = "${S}/icss_dualmac"
 
 COMPATIBLE_MACHINE = "am65xx"
 
diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index 573a428..14518e1 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -4,12 +4,13 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-bsp/icss-emac-lld/icss-emac-lld.inc
 
 LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
+LIC_FILES_CHKSUM = "file://icss_dualemac/src/firmware_version.h;beginline=6;endline=53;md5=1f0a640a261059cdcbbcf01e6a739ff3"
 
-PV = "${PV_DUALEMAC_FW}"
 PR = "${INC_PR}.0"
 
-S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}/firmware/icss_dualemac"
+TI_PDK_COMP = "ti.drv.icss_emac.firmware"
+
+B = "${S}/icss_dualemac"
 
 COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm|k2g"
 
-- 
2.7.4


