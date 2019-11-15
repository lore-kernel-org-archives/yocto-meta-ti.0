Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10D4AE00EAD; Fri, 15 Nov 2019 07:34:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E47FCE00E7B
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:14 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYEcV067921
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832054;
	bh=N2blscIr+dGryXMcz7NhgrXEsqV4OhZ2wZaCCYKsfgg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Zap1mc8u9IaiPlKwE/HdSHETHo+1atfmkcH7g3aLrwvSUZZxU+/gcsIbs8cELxVEI
	nIjqGp1FxjdzOAjXfdIW25GQzXLotI4bEoGX9hjhuPO77lv4+5JFnr63CIOdHC1Kcx
	UvzBzsXntpk8Qse9mtZsDJK5/D2Zu+F+1T/XPQN0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYEGe095060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:14 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:14 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfU041975;
	Fri, 15 Nov 2019 09:34:13 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:28 -0500
Message-ID: <1573830902-17409-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 08/42] fatfs-rtos: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
index a08e046..20d8ba8 100644
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -1,6 +1,10 @@
 SUMMARY = "TI RTOS driver for FAT filesystem"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.fs.fatfs"
+
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://FATFS.h;beginline=1;endline=32;md5=6619832755598d1cc2b01f2e6a1801d6"
@@ -8,18 +12,6 @@ LIC_FILES_CHKSUM = "file://FATFS.h;beginline=1;endline=32;md5=6619832755598d1cc2
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FATFS_GIT_URI = "git://git.ti.com/keystone-rtos/fatfs.git"
-FATFS_GIT_PROTOCOL = "git"
-FATFS_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.15"
-FATFS_SRCREV = "d30f2c1492b2226a7ce31e43a72df29df5db9986"
-
-BRANCH = "${FATFS_GIT_BRANCH}"
-SRC_URI = "${FATFS_GIT_URI};protocol=${FATFS_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${FATFS_SRCREV}"
-PV = "01.00.00.15"
 PR = "r0"
 
 DEPENDS_append = " mmcsd-lld-rtos \
-- 
2.7.4


