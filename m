Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3EDBE00D48; Thu, 14 Dec 2017 10:00:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F283E00D1C
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 10:00:24 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEI0NbZ023196
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 12:00:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513274423;
	bh=pc8EIxxAEdLW48BaRbI6HtIrkiW6Ntjy73ch6xFbP1s=;
	h=From:To:Subject:Date;
	b=I9MRQfruIjJIuRcfjGXz5gL6Ol0FwduRTJeGjTExsOu/6mDzf0O2S1SGL9YMSNYMR
	ezXJTqSzwGC8FAiHTl63THURQVMyfjl4aUFLKwR8840GWgdVr/brraky9/7Elggdb8
	2Ty2/L7Aojs21CeIH2vId75LeTfTrlulIMc6ozak=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEI0N3q014329
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 12:00:23 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 12:00:23 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 12:00:23 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEI0MR9015776
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 12:00:23 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Dec 2017 13:00:18 -0500
Message-ID: <1513274418-35844-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH ] emac-lld: Update to version 2.12.05.30B and rtos updates
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
X-List-Received-Date: Thu, 14 Dec 2017 18:00:25 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 29 +++++++++++++++++++++++++++++
 recipes-bsp/edma3-lld/edma3-lld.inc         |  6 +++---
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index f524478..08ab4ec 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -50,6 +50,33 @@ TARGETLIST_keystone = " \
         a15 \
 "
 
+PLATFORMLIST_append_dra7xx-evm = " \
+        tda3xx-evm \
+"
+
+TARGETLIST_c66x = " \
+        66 \
+"
+
+PLATFORMLIST_c665x-evm = " \
+        c6657-evm \
+"
+
+PLATFORMLIST_c667x-evm = " \
+        c6678-evm \
+"
+
+PLATFORMLIST_omapl1 = " \
+        omapl137-evm \
+        omapl138-evm \
+"
+
+TARGETLIST_omapl1 = " \
+        arm9 \
+        674 \
+"
+
+EXTRA_OEMAKE_remove = "TARGET=66"
 FORMAT="ELF"
 
 S = "${WORKDIR}/git"
@@ -73,6 +100,8 @@ export CROSSAR="${TARGET_PREFIX}ar"
 export CROSSLNK="${TARGET_PREFIX}gcc"
 
 do_configure () {
+    rm -rf ${S}/examples/edma3_driver/evmTCI6614
+    rm -rf ${S}/examples/edma3_driver/evmTCI6614BE
     sed -i -e "s|_config.bld|config.bld|g" ${S}/makerules/env.mk
     sed -i -e "s|^edma3_lld_PATH =.*$|edma3_lld_PATH = ${S}|g" ${S}/makerules/env.mk
     sed -i -e "s|^CODEGEN_PATH_M3 =.*$|CODEGEN_PATH_M3 = ${M4_TOOLCHAIN_INSTALL_DIR}|g" ${S}/makerules/env.mk
diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index d0bc0b9..e0e9752 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,12 +6,12 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to version 2.12.05.30
-EDMA3_LLD_SRCREV = "30cce115bda9001bc40c68e3788bbd1b3741569e"
+# Below commit ID corresponds to version 2.12.05.30B
+EDMA3_LLD_SRCREV = "f0179381d5b18a1aea2c13ec29e9d45e419153d6"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${EDMA3_LLD_SRCREV}"
 
-PV = "2.12.05.30"
+PV = "2.12.05.30B"
 INC_PR = "r0"
-- 
1.9.1


