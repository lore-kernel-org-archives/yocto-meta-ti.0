Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD728E00C82; Mon, 18 Sep 2017 13:49:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96C7BE00BB1
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:49:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKn98A013842
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:49:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505767749;
	bh=DGiubRRXl4NUVzfOaj0W8ojFSa1OM3y0uIpeQidtLf8=;
	h=From:To:CC:Subject:Date;
	b=qAoVIjYru4inYryS773h4cC2+PNvo3/CiEuo2L++yrtVOkGqfAtH+ASfVQwPm8SJG
	0KcM7I+8e6EMuPP3JgkBVByJLvTrjI5K4138fiuidSIEqkR3nZf9Ef9xQhlDVb/TbP
	N1U8Q+w0syja64wPZMjnzeTihlBUHV2OUVyP3EhA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKn9lP030604
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:49:09 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 18 Sep 2017 15:49:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 18 Sep 2017 15:49:09 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKn9xd016994;
	Mon, 18 Sep 2017 15:49:09 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Sep 2017 16:49:08 -0400
Message-ID: <1505767748-7003-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v4] cmb-addon-rtos: Adding CMB rtos recipe
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
X-List-Received-Date: Mon, 18 Sep 2017 20:49:13 -0000
Content-Type: text/plain

Circular Microphone array board (CMB) RTOS software
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Modified the recipe to ti-pdk.bbclass
 v3 - Removed redundant code in do_compile & do_install
 v2 - Added summary

 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
new file mode 100644
index 0000000..4d69863
--- /dev/null
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -0,0 +1,41 @@
+SUMMARY = "TI RTOS software supporting circular microphone array board"
+require recipes-ti/includes/ti-paths.inc
+inherit ti-pdk
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://cmbaddonver.h;beginline=8;endline=47;md5=d0cb159bf210cfafed63042da01c83e0"
+
+COMPATIBLE_MACHINE = "k2g|omapl137-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+CMB_ADDON_GIT_URI = "git://git.ti.com/processor-sdk/circmicarray-addon.git"
+CMB_ADDON_GIT_PROTOCOL = "git"
+CMB_ADDON_GIT_BRANCH = "master"
+CMB_ADDON_GIT_DESTSUFFIX = "git/ti/addon"
+
+# Below commit ID corresponds to "DEV.CMB.01.01.00.00"
+CMB_ADDON_SRCREV = "29c05572b82251bac73cd685afcffdb8549eaaaf"
+
+SRCREV = "${CMB_ADDON_SRCREV}"
+PV = "01.01.00.00"
+PR = "r0"
+
+BRANCH = "${CMB_ADDON_GIT_BRANCH}"
+SRC_URI = "${CMB_ADDON_GIT_URI};destsuffix=${CMB_ADDON_GIT_DESTSUFFIX};protocol=${CMB_ADDON_GIT_PROTOCOL};branch=${BRANCH}"
+
+
+S = "${WORKDIR}/git/ti/addon/cmb"
+
+DEPENDS_append = " ti-sysbios \
+            gpio-lld-rtos \
+            i2c-lld-rtos \
+            mcasp-lld-rtos \
+            board-rtos \
+"
+
+export PDK_CMB_ROOT_PATH = "${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
-- 
1.9.1


