Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7438E00D2A; Thu, 26 Oct 2017 10:20:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA155E00D19
	for <meta-ti@yoctoproject.org>; Thu, 26 Oct 2017 10:20:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9QHK3kO023297
	for <meta-ti@yoctoproject.org>; Thu, 26 Oct 2017 12:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509038403;
	bh=2lt5ojMLCIK4TfUTd8pEBTHTNTsb8SAGOQnMYedvcaM=;
	h=From:To:CC:Subject:Date;
	b=PVzG7kIwobtxPP9VEJ8UvJGT3ImrBBV9k0BGHu14HqH6TujTxAY/5XnjKmw8GEWDq
	g5L20NHEEwaq3B/SC3ZM0llFeV2FWIFyfLDTWIESbwlIsc6SHxPsvCEj7jTMxuzS/D
	+1elwYZGvgRaa4O/RtwQU1hSi4IdgeO+pzk/T9aU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9QHJwNV030202
	for <meta-ti@yoctoproject.org>; Thu, 26 Oct 2017 12:19:58 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 26 Oct 2017 12:19:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 26 Oct 2017 12:19:58 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9QHJwqe030214;
	Thu, 26 Oct 2017 12:19:58 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 26 Oct 2017 13:19:54 -0400
Message-ID: <1509038394-60281-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3] emac-lld-rtos: Added emac-lld-rtos recipe
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
X-List-Received-Date: Thu, 26 Oct 2017 17:20:16 -0000
Content-Type: text/plain

RTOS low level driver for Ethernet MAC
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v3 - Updated to version 1.00.03.07
 v2 - Added summary and merged in to a single recipe 

 recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bb

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bb b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
new file mode 100644
index 0000000..551ffed
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bb
@@ -0,0 +1,31 @@
+SUMMARY = "TI RTOS low level driver for Ethernet MAC (EMAC) peripheral"
+
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://emacver.h;beginline=1;endline=47;md5=f66bb3695972ca2a85d990a390f45d88"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|c665x-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/emac-lld.git"
+EMAC_LLD_GIT_PROTOCOL = "git"
+EMAC_LLD_GIT_BRANCH = "master"
+
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.07"
+EMAC_LLD_SRCREV = "70bb4d2ed677d428f055c2178e95766511e14383"
+
+BRANCH ="${EMAC_LLD_GIT_BRANCH}"
+SRC_URI = "${EMAC_LLD_GIT_URI};protocol=${EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${EMAC_LLD_SRCREV}"
+PV = "01.00.03.07"
+PR = "r0"
+
+DEPENDS_append = " board-rtos osal-rtos"
+DEPENDS_append_ti33x = " starterware-rtos"
+DEPENDS_append_ti43x = " starterware-rtos"
+DEPENDS_append_k2g  = " cppi-lld-rtos qmss-lld-rtos"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT = "EMAC LLD"
-- 
1.9.1


