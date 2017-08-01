Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E6A2E00CB4; Tue,  1 Aug 2017 16:58:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8AE8E00BF3
	for <meta-ti@yoctoproject.org>; Tue,  1 Aug 2017 16:58:44 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v71NwXNY028635
	for <meta-ti@yoctoproject.org>; Tue, 1 Aug 2017 18:58:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501631913;
	bh=CHzMTcfxu2iZEg3wBK0RgNAbYmFu/+/7nYJXe7yRLGo=;
	h=From:To:CC:Subject:Date;
	b=EJo/M8/nbjW37UwGJAwz86ubenjVKaRFsRKQePBHBBMe88GDUDshLZ54Wg78bFOmY
	NQXUX4nAKnEx7wlQOCbDJhNvocZrotPPQllJue3fUCIbXeeB9WRDo0Bdou8FirSjHt
	Sj/HmYpGEJefq/on3eW3bEsD3SHtHdz2xPitV9xY=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v71NwStO001371
	for <meta-ti@yoctoproject.org>; Tue, 1 Aug 2017 18:58:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Aug 2017 18:58:28 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v71NwSDm031274;	Tue, 1 Aug 2017 18:58:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Aug 2017 19:58:27 -0400
Message-ID: <1501631907-56325-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] ti-ipc: Update to GA version 3.46.02.04
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
X-List-Received-Date: Tue, 01 Aug 2017 23:58:45 -0000
Content-Type: text/plain

- Update ipcdev branch to 3.46 ( commit id remains same)
- Adds support for c66x platforms
- Updates for dra7xx platform
- Update to avoid stripping for IPC rtos example binaries

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-common.inc      |  4 +++-
 recipes-ti/ipc/ti-ipc-examples_git.bb |  1 +
 recipes-ti/ipc/ti-ipc-rtos.inc        | 17 +++++++++++++----
 recipes-ti/ipc/ti-ipc.inc             |  4 ++--
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
index d9956fc..f2df678 100644
--- a/recipes-ti/ipc/ti-ipc-common.inc
+++ b/recipes-ti/ipc/ti-ipc-common.inc
@@ -1,5 +1,5 @@
 PV = "3.46.02.04"
-INC_PR = "r0"
+INC_PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -11,5 +11,7 @@ PLATFORM_k2l-evm = "TCI6630"
 PLATFORM_k2e = "66AK2E"
 PLATFORM_k2g = "66AK2G"
 PLATFORM_omapl138 = "OMAPL138"
+PLATFORM_c667x-evm = "C6678"
+PLATFORM_c665x-evm = "C6678"
 
 ALT_PLATFORM_k2hk = "TCI6636"
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 40c3bc3..5717a83 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -93,3 +93,4 @@ do_install() {
 
 FILES_${PN} += "ipc_*"
 FILES_${PN}-linux += "${bindir}/*"
+INHIBIT_PACKAGE_STRIP_${PN} = "1"
diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index 7dc9602..19347a5 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -24,11 +24,11 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
 branch=${TI_IPC_METADATA_GIT_BRANCH};\
 name=${TI_IPC_METADATA_NAME}"
 
-# Corresponds to tag: 3.46.02.04_eng
+# Corresponds to tag: 3.46.02.04
 SRCREV_ipc-examples = "b833c759d620b4218ece6d64fae91e4777ef823a"
 
-# Corresponds to tag: 3.46.02.04_eng
-SRCREV_ipc-metadata = "bb07d3e00dcaf1074589e805be0a4ed2ada2d17c"
+# Corresponds to tag: 3.46.02.04
+SRCREV_ipc-metadata = "afdcf6855f05c97d2bb77867f4f150aed29c1b12"
 
 S_ipc-examples = "${WORKDIR}/git/ipc-examples"
 S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
@@ -36,7 +36,7 @@ S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
 RELEASE_TYPE = "ENG"
 RELEASE_SUFFIX = "_eng"
 
-PR = "${INC_PR}.r0"
+PR = "${INC_PR}.r1"
 
 DEPENDS_append_keystone = " ti-cgt6x-native \
                             gcc-arm-none-eabi-native \
@@ -47,6 +47,8 @@ DEPENDS_append_omap-a15 = " ti-cgt6x-native \
 "
 DEPENDS_append_omapl138 = " ti-cgt6x-native \
 "
+DEPENDS_append_c66x = " ti-cgt6x-native \
+"
 
 IPC_TARGETS = ""
 
@@ -66,6 +68,13 @@ IPC_TARGETS_keystone = " \
     ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
     ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
 "
+IPC_TARGETS_c66x = " \
+    ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+    ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
+"
+IPC_TARGETS_append_dra7xx-evm = " \
+    ti.targets.arp32.elf.ARP32_far="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-arp32/" \
+"
 
 EXTRA_OEMAKE = "\
     PLATFORM=${PLATFORM} \
diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 06c087a..c3742c1 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://${S}/ipc-linux.mak;beginline=1;endline=30;md5=7b327f9
 
 TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
 TI_IPC_GIT_PROTOCOL = "git"
-TI_IPC_GIT_BRANCH = "ipc-next"
+TI_IPC_GIT_BRANCH = "3.46"
 
-#Corresponds to 3.46.02.04_eng
+#Corresponds to 3.46.02.04
 TI_IPC_SRCREV = "bf355e7d0f5c3993f56a6ea778743b656ef6b536"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
-- 
1.9.1


