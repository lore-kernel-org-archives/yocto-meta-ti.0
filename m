Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2F506E00E13; Thu,  7 Nov 2019 10:09:55 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28C2CE00E13
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:52 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9pUF070499
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150191;
	bh=8sQi1m394G+7/nzrDk68OQiPpIjLq6SX3/QEFrzVB2Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=FNTsrprI0Cdy5ZAdk2y8Nck6tU4t+5Y/vlejEoOhlLHPwm4QPepssWTzk6STqV+aC
	iX34HV/ctYsC+HATAtvYZa1rc6OHZ8eCKsjSHhtzvEo11rVscgTMpiHdAyCcngmGFa
	2mvfRanr28UC3V+eYj2E0TGJiFxaiXxysEebrAEg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9pjb125206
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:51 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:36 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIO067418;
	Thu, 7 Nov 2019 12:09:51 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:13 -0500
Message-ID: <1573149037-762-19-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 18/42] mcbsp-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:56 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
index 10c782e..6427aea 100644
--- a/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
+++ b/recipes-bsp/mcbsp-lld/mcbsp-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low level driver for Multi-channel Buffered Serial Port (McBSP)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://mcbspver.h;beginline=1;endline=47;md5=a8a39efd13fa6fe66da5461b898d620e"
@@ -8,22 +9,8 @@ LIC_FILES_CHKSUM = "file://mcbspver.h;beginline=1;endline=47;md5=a8a39efd13fa6fe
 COMPATIBLE_MACHINE = "k2g|c665x-evm|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-MCBSP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcbsp-lld.git"
-MCBSP_LLD_GIT_PROTOCOL = "git"
-MCBSP_LLD_GIT_BRANCH = "master"
-MCBSP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcbsp"
-
-# Below commit ID corresponds to "DEV.MCBSP_LLD.01.00.00.12"
-MCBSP_LLD_SRCREV = "cd201419a8b4e4aefee6b9323d9a84f4ea467d6a"
-
-BRANCH = "${MCBSP_LLD_GIT_BRANCH}"
-SRC_URI = "${MCBSP_LLD_GIT_URI};destsuffix=${MCBSP_LLD_GIT_DESTSUFFIX};protocol=${MCBSP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${MCBSP_LLD_SRCREV}"
-PV = "01.00.00.12"
 PR = "r0"
 
-S = "${WORKDIR}/${MCBSP_LLD_GIT_DESTSUFFIX}"
 
 DEPENDS_append = " edma3-lld-rtos \
 "
@@ -38,3 +25,4 @@ export DEST_ROOT = "${S}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "MCBSP LLD"
+TI_PDK_COMP = "ti.drv.mcbsp"
-- 
2.7.4


