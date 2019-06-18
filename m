Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7185E00DA7; Tue, 18 Jun 2019 12:16:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37F08E00D4C
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 12:16:22 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGMVP055517
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560885382;
	bh=jRW5ujh0+KIzvfpTZIZJn4gTg4q14+Lu3Rf+hKmQtw0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KqOxtx1/BKaqo39Vg8867o9pkrYORqg+ZI+dH2gmmCy5uiTPPMlKcchDdsLPeaj2X
	6WsubpKQabsmsv4jjCFVI0g+pQ4Q77SB6vOWHyKnQXUsWoW+QJqxf78FhyEZhv3/Hq
	M8J3Vs6ANj8NK9cl6H1JS45PATv2Dz5bGDf0bJFA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IJGMLv019087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:22 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 14:16:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 14:16:22 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGKUc113016;
	Tue, 18 Jun 2019 14:16:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jun 2019 15:00:18 -0400
Message-ID: <1560884418-23216-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud][PATCH 5/5] prueth-fw-bin: remove prebuilt firmware recipe
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
X-List-Received-Date: Tue, 18 Jun 2019 19:16:24 -0000
Content-Type: text/plain

* The prueth-fw-am65xx provides the same firmware but built from
  sourecs.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb | 32 ------------------------------
 1 file changed, 32 deletions(-)
 delete mode 100644 recipes-bsp/prueth-fw/prueth-fw-bin_git.bb

diff --git a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb b/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
deleted file mode 100644
index 60dc087..0000000
--- a/recipes-bsp/prueth-fw/prueth-fw-bin_git.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "PRU Ethernet firmware for AM65xx"
-
-LICENSE = "TI-TFL"
-LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
-
-PV = "5.3.0.5"
-
-CLEANBROKEN = "1"
-
-COMPATIBLE_MACHINE = "am65xx-evm"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRCREV = "534ba03becfa9b39ccbd42b97e091abd94a207e7"
-BRANCH ?= "ti-linux-firmware"
-
-SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-TARGET = "am65x-pru0-prueth-fw.elf am65x-pru1-prueth-fw.elf am65x-rtu0-prueth-fw.elf am65x-rtu1-prueth-fw.elf"
-
-do_install() {
-	install -d ${D}${base_libdir}/firmware/ti-pruss
-	for f in ${TARGET}; do
-		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
-	done
-}
-
-FILES_${PN} = "${base_libdir}/firmware"
-
-INSANE_SKIP_${PN} = "arch"
-- 
2.7.4


