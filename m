Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4C41E00E2F; Thu,  7 Nov 2019 10:09:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D120E00E28
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:55 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9tHC070518
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150195;
	bh=U0vc9nscOjUxQftIT5WKKMA0bRGdztVCi3rSxD+h63U=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UI/oKRQOHXzb6Shpl4PcLAvOq9D9owoE1f5FyVkZMhryxiahHP0VbUTlhClkv4QV+
	NhmhQsXSyJ0uLlUUaVchOJUZiWEqZrCqSnAMjJXtMbZFeWV5EXCE6B5oIrm9/EcNpl
	GaG/jVHetC/1MrJJXRIqZckMNQjy1BvUwsdDuqpk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9tDb004217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:55 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:39 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:39 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIa067418;
	Thu, 7 Nov 2019 12:09:55 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:25 -0500
Message-ID: <1573149037-762-31-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 30/42] spi-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:10:00 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bb | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
index 1dab251..6264ef5 100644
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS low level driver for Serial Peripheral Interface (SPI)"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://SPI.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d13518cf18a0122b8"
@@ -8,18 +9,6 @@ LIC_FILES_CHKSUM = "file://SPI.h;beginline=1;endline=31;md5=8580f9c5c0de8d5d1351
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SPI_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/spi-lld.git"
-SPI_LLD_GIT_PROTOCOL = "git"
-SPI_LLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.16A"
-SPI_LLD_SRCREV = "4319424ca55676d25758f3e05797fac707b0b1f8"
-
-BRANCH = "${SPI_LLD_GIT_BRANCH}"
-SRC_URI = "${SPI_LLD_GIT_URI};protocol=${SPI_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${SPI_LLD_SRCREV}"
-PV = "01.00.00.16A"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
@@ -43,3 +32,4 @@ XDCPATH_append = ";${EDMA3_LLD_INSTALL_DIR}/packages"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "SPI LLD"
+TI_PDK_COMP = "ti.drv.spi"
-- 
2.7.4


