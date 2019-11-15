Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 299D2E00D8B; Fri, 15 Nov 2019 07:34:19 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E92CAE00EAC
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:17 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYHmV057554
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832057;
	bh=+gxq+G+JUJhKPzUs71k4VWupWWPI7vDxxfbtbtvP0fo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cbW68pLqWzT3hIjBheG8QjGjKvkG19JbIsEa9LYyv6uQSG94DBh69e8ejegYDhSsS
	2NxijhsNOJC+QlaWK7A4Z7dWYrkvvtrxe0pP/UAi5PCI+l5HC8Li5YVmxuWLwlbSqW
	Ipbvz+tGzLBcDdPIhw1CsyPOZeb6VJE6IAAKz4KQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYHH6050777
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:17 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:17 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBff041975;
	Fri, 15 Nov 2019 09:34:17 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:39 -0500
Message-ID: <1573830902-17409-20-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 19/42] mmcsd-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:19 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
index e94d8c8..8c027cd 100644
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -1,6 +1,10 @@
 SUMMARY = "TI Multimedia card(MMC)/Secure Digital(SD) low level driver for RTOS "
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.mmcsd"
+
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://MMCSD.h;beginline=1;endline=32;md5=f74069541d4d165a000a66b4043cb065"
@@ -8,22 +12,9 @@ LIC_FILES_CHKSUM = "file://MMCSD.h;beginline=1;endline=32;md5=f74069541d4d165a00
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-MMCSD_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sd-mmc.git"
-MMCSD_LLD_GIT_PROTOCOL = "git"
-MMCSD_LLD_GIT_BRANCH = "master"
-MMCSD_LLD_GIT_DESTSUFFIX = "git/ti/drv/mmcsd"
-
-# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.17D"
-MMCSD_LLD_SRCREV = "d723e336b917989b08bef590c3e125010c0d3461"
-
-BRANCH = "${MMCSD_LLD_GIT_BRANCH}"
-SRC_URI = "${MMCSD_LLD_GIT_URI};destsuffix=${MMCSD_LLD_GIT_DESTSUFFIX};protocol=${MMCSD_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
-SRCREV = "${MMCSD_LLD_SRCREV}"
-PV = "01.00.00.17D"
 PR = "r0"
 
-S = "${WORKDIR}/${MMCSD_LLD_GIT_DESTSUFFIX}"
 
 DEPENDS_append = " edma3-lld-rtos \
                    osal-rtos \
-- 
2.7.4


