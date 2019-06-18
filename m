Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7A528E00D9D; Tue, 18 Jun 2019 12:16:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E7266E00D6B
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 12:16:21 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGL7n055510
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560885381;
	bh=+ChreP+JB4cEZ/5d6IotdjkzZbfskZYn2yzfX0nXRM0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zWtCvwV6F80Afe7MJk1xXo6uCG85RZ8zaaGwO0zlK0W1ki3B+FujGc8CJ6FtS5xKG
	e1tYskdJDqWBktnpA7OPWMufZvzDcJmQcpUbfLDP2MMrtQRSmVDtxdyShOxXt9nHih
	nDQzu02aEBr/kcfnpuOrq0LWfjOi/KQ/vafWhKj4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5IJGLv8019052
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 18 Jun 2019 14:16:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 14:16:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 14:16:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5IJGKUZ113016;
	Tue, 18 Jun 2019 14:16:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jun 2019 15:00:15 -0400
Message-ID: <1560884418-23216-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
References: <1560884418-23216-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: rogerq@ti.com
Subject: [master/thud][PATCH 2/5] emac-lld: separate SRC_URI in inc file
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
X-List-Received-Date: Tue, 18 Jun 2019 19:16:23 -0000
Content-Type: text/plain

* The emac-lld also contains sources for the prueth-fw on am65xx.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 18 ++++--------------
 recipes-bsp/emac-lld/emac-lld.inc         | 17 +++++++++++++++++
 2 files changed, 21 insertions(+), 14 deletions(-)
 create mode 100644 recipes-bsp/emac-lld/emac-lld.inc

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
index e451b75..2af38b9 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -2,26 +2,16 @@ SUMMARY = "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral"
 
 inherit ti-pdk
 
+require emac-lld.inc
+
+PR = "r0"
+
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
-EMAC_LLD_GIT_PROTOCOL = "git"
-EMAC_LLD_GIT_BRANCH = "master"
-
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.15"
-EMAC_LLD_SRCREV = "6838a58d68ebc72e9225663b3529a096baa2d1eb"
-
-BRANCH ="${EMAC_LLD_GIT_BRANCH}"
-SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${EMAC_LLD_SRCREV}"
-PV = "01.00.03.15"
-PR = "r0"
-
 DEPENDS_append = " board-rtos osal-rtos"
 DEPENDS_append_ti33x = " starterware-rtos"
 DEPENDS_append_ti43x = " starterware-rtos"
diff --git a/recipes-bsp/emac-lld/emac-lld.inc b/recipes-bsp/emac-lld/emac-lld.inc
new file mode 100644
index 0000000..0a22061
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld.inc
@@ -0,0 +1,17 @@
+EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
+EMAC_LLD_GIT_PROTOCOL = "git"
+EMAC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.15"
+EMAC_LLD_SRCREV = "6838a58d68ebc72e9225663b3529a096baa2d1eb"
+
+BRANCH ="${EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${EMAC_LLD_SRCREV}"
+
+# The LLD version
+PV = "01.00.03.15+git${SRCPV}"
+
+# The FW version(s)
+PV_DUALEMAC_FW = "5.3.0.5+git${SRCPV}"
-- 
2.7.4


