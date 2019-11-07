Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DA3F9E00E02; Thu,  7 Nov 2019 10:09:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E421E00E00
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:50 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9oig070489
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150190;
	bh=mT7WRsWGE/gIX9k+pdBCmwttl7CcTzPnE8le+c70jUI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jfWqZ10wrvP/OKYLfHXH/zKqahVzbh5iydH+VXtSy0UeOxL7YJvCkFc1mQS/o5JOA
	xzyE9uRa/jFgsTkpolXcVCGkZ9+CMKGMXW9B05e3PvgC5WNyUdz+mxgvZAg2ZBpolR
	V4M6NpTKVjtCTG9gdkqwNndnNr44z0ftyOlOJlQY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9nJi071043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:49 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIG067418;
	Thu, 7 Nov 2019 12:09:48 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:05 -0500
Message-ID: <1573149037-762-11-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 10/42] gpio-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:54 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
index 93f97d0..4de064a 100644
--- a/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
+++ b/recipes-bsp/gpio-lld/gpio-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS driver for General Purpose IO (GPIO)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://GPIO.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
@@ -8,22 +9,8 @@ LIC_FILES_CHKSUM = "file://GPIO.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d135
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c667x-evm|c665x-evm|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-GPIO_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpio-lld.git"
-GPIO_LLD_GIT_PROTOCOL = "git"
-GPIO_LLD_GIT_BRANCH = "master"
-GPIO_LLD_GIT_DESTSUFFIX = "git/ti/drv/gpio"
-
-# Below commit ID corresponds to "DEV.GPIO_LLD.01.00.00.16B"
-GPIO_LLD_SRCREV = "14e59e948fb949e244edcc3161f21ec4228fb15c"
-
-BRANCH = "${GPIO_LLD_GIT_BRANCH}"
-SRC_URI = "${GPIO_LLD_GIT_URI};destsuffix=${GPIO_LLD_GIT_DESTSUFFIX};protocol=${GPIO_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${GPIO_LLD_SRCREV}"
-PV = "01.00.00.16B"
 PR = "r0"
 
-S = "${WORKDIR}/${GPIO_LLD_GIT_DESTSUFFIX}"
 
 DEPENDS_append = " osal-rtos \
 "
@@ -42,3 +29,4 @@ export DEST_ROOT="${S}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "GPIO LLD"
+TI_PDK_COMP = "ti.drv.gpio"
-- 
2.7.4


