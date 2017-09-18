Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4D873E00CCB; Mon, 18 Sep 2017 10:54:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AECBBE008D2
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 10:54:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IHsWMb016973
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 12:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505757272;
	bh=6aD/pRjD1LahD541BVArrccE/N0X55Y4DH+x9qf/4Vk=;
	h=From:To:CC:Subject:Date;
	b=MCF9kdkbNOvKKQfpzfgGL6aAXsidjz1abfsXjp2cRbIm3tDiZGpkVrXRnqcL6P56P
	l7RIQTJo3rtuHVsUg5sX0IX1/8+bFe0xKVs1cfwIbJ6NGgx+fM6fcMyO+N5sIKgOUm
	/OGo7aBa7R2hKmq9lk/TUrz8me5VKGF1djB2t/gs=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IHsWNA004322
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 12:54:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 12:54:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 12:54:32 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IHsWeb012844;
	Mon, 18 Sep 2017 12:54:32 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Sep 2017 13:54:28 -0400
Message-ID: <1505757268-4687-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4] pm-lld-rtos: Adding rtos recipe for pm-lld
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
X-List-Received-Date: Mon, 18 Sep 2017 17:54:34 -0000
Content-Type: text/plain

TI RTOS low level driver for Power Management module (PM)
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Modified to use ti-pdk.bbclass and addressed review comments
 v3 - Removed the intermediate tar-untar for install
 v2 - Added summary & merged in to a single recipe


 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
new file mode 100644
index 0000000..6fedc80
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -0,0 +1,56 @@
+SUMMARY = "TI RTOS driver for Power Management module (PM)"
+
+require recipes-ti/includes/ti-paths.inc
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+
+PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
+PM_LLD_GIT_PROTOCOL = "git"
+PM_LLD_GIT_BRANCH = "int_pm_am335x"
+PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
+PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"
+PM_LLD_SRCREV = "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"
+
+# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
+PM_LLD_SRCREV_dra7xx-evm = "46ea13503d2991f636197edb206a9f62cea398d4"
+
+BRANCH = "${PM_LLD_GIT_BRANCH}"
+SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${PM_LLD_SRCREV}"
+PV = "01.04.00.01"
+PR = "r0"
+
+S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append = " ti-sysbios \
+            osal-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+export PDK_PM_ROOT_PATH = "${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+do_compile_append() {
+    # Delete archive created by XDC release command since it does not contain all content
+    find -name "*.tar" -exec rm -f {} \;
+
+    # Archive from build/ to capture ti/drv/pm/ in archive
+    cd ${B}
+    tar -cf pm_lld.tar --exclude='*.tar' ./*
+}
+
+INSANE_SKIP_${PN} = "arch staticdev"
-- 
1.9.1


