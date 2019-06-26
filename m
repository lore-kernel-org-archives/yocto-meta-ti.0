Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8224DE00D86; Wed, 26 Jun 2019 09:06:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1750BE00D85
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 09:06:43 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QG6gWr048900
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 11:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561565202;
	bh=jRW5ujh0+KIzvfpTZIZJn4gTg4q14+Lu3Rf+hKmQtw0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eFeJJ1CsnveunecRbz11OC4Erkh9SLe9+HjBJvqff7BE2BlxwzAHnlu/iXtsO0h8n
	WGtjaknLwsrDH7QL7fHwCXjpZHGLVsZNE9dohu9IzNSJNzaVJ7HbGRj1KAraC8y95x
	RgIMfxKUUt+7zr8s08z2uvJtBBX/RVWf9t8rgnOY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QG6gck084197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 11:06:42 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 11:06:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 11:06:42 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QG6cPi042136;
	Wed, 26 Jun 2019 11:06:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 26 Jun 2019 11:49:53 -0400
Message-ID: <1561564193-15418-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561564193-15418-1-git-send-email-j-stiffler@ti.com>
References: <1561564193-15418-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud/ti2019.01][PATCH v3 5/5] prueth-fw-bin: remove prebuilt firmware recipe
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
X-List-Received-Date: Wed, 26 Jun 2019 16:06:43 -0000
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


