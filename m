Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CADDAE00E13; Thu,  7 Nov 2019 10:10:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44979E00E1F
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:55 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9tG7070514
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150195;
	bh=LE+C1gPvp+HyU7aQrm4tn8V2xPSFWULDOT9jgB3DcuQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=XdJ0QsA064l66dIc1pAzZPMS4ypTYMnzTlMOwszScMZJWuQJC6DXRBCUE4mXioret
	nU29/3pagqyWEVc9mKhtDKstmvcgCMEWXTyr3aU9HmWZUvcDiprICa1DWyZBGZwIn7
	s8US/ji5rN4QLLDjggS+f2lx8Etxxoezk7s1QV+8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9teW071245
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:55 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:54 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:39 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIZ067418;
	Thu, 7 Nov 2019 12:09:54 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:24 -0500
Message-ID: <1573149037-762-30-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 29/42] sciclient: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:02 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index bfaa84a..18f93bb 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low level driver for SCICLIENT"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444815f1737bfcdfa892a"
@@ -8,18 +9,6 @@ LIC_FILES_CHKSUM = "file://sciclient.h;beginline=1;endline=31;md5=7224b2eeca1444
 COMPATIBLE_MACHINE = "k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
-SCICLIENT_GIT_PROTOCOL = "git"
-SCICLIENT_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.04"
-SCICLIENT_SRCREV = "287fe553ef548a60cce59e6a41d2e173ecbbc18a"
-
-BRANCH = "${SCICLIENT_GIT_BRANCH}"
-SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${SCICLIENT_SRCREV}"
-PV = "01.00.00.04"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
@@ -27,7 +16,7 @@ DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-SCICLIENT_PACKAGE_BASE   = "${S}/../sciclient_base"
+SCICLIENT_PACKAGE_BASE = "${WORKDIR}/sciclient_base"
 SCICLIENT_ROOTPATH = "${SCICLIENT_PACKAGE_BASE}/package/all/pdk_/packages/ti/drv/sciclient"
 
 export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
@@ -79,3 +68,4 @@ FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
 INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
 
 INSANE_SKIP_${PN}-dbg = "arch"
+TI_PDK_COMP = "ti.drv.sciclient"
-- 
2.7.4


