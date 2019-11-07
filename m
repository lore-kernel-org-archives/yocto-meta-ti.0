Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80E20E00E1A; Thu,  7 Nov 2019 10:09:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70247E00E04
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:50 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9nRP020101
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150190;
	bh=BTHVrQ/uY5+JOQTzvShqotl9mrnMeHoq7YAxjgZo4oY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JCEgkjqxVTEsmYQDuepuWneizCxvvg2POcRkRwiU08ic446k78NgEZ18uqf6GjwS6
	zGloCfj0faA6lEKZY0zZA8s9TahPTVnZjScXZyGij+m2Ev6ysQV6U90pcqvHk0JCpG
	Yf3YALTSccYruwarFWseBdJbKfRf9eiQD+t6VDzE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9nnZ071040
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:49 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:33 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:33 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIH067418;
	Thu, 7 Nov 2019 12:09:49 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:06 -0500
Message-ID: <1573149037-762-12-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 11/42] gpmc-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
index b9f0088..844e9dd 100644
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
+++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low level driver for General Purpose Memory Controller (GPMC)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://GPMC.h;beginline=1;endline=31;md5=485ec97c36f809bf92323fde3e988c72"
@@ -8,18 +9,7 @@ LIC_FILES_CHKSUM = "file://GPMC.h;beginline=1;endline=31;md5=485ec97c36f809bf923
 COMPATIBLE_MACHINE = "ti33x|ti43x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GPMC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpmc-lld.git"
-GPMC_LLD_GIT_PROTOCOL = "git"
-GPMC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.03A"
-GPMC_LLD_SRCREV = "9169c04d80fae0a50734527e54ec4f4f53c3a1ef"
-
-BRANCH = "${GPMC_LLD_GIT_BRANCH}"
-SRC_URI = "${GPMC_LLD_GIT_URI};protocol=${GPMC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${GPMC_LLD_SRCREV}"
-PV = "01.00.00.03A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
@@ -37,3 +27,4 @@ PDK_COMP_LINK_TEXT = "GPMC LLD"
 
 export PDK_GPMC_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
+TI_PDK_COMP = "ti.drv.gpmc"
-- 
2.7.4


