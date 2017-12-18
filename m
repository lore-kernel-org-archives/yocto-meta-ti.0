Return-Path: <gaurav@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CBBA1E00DB1; Mon, 18 Dec 2017 14:13:59 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB0DEE00D8C
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 14:13:48 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBIMDmDq013787
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 16:13:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513635228;
	bh=6S3IgA6aMDoLe3kPdluWN5Vh0ff3ZP/M5+jPUkF4JOM=;
	h=From:To:CC:Subject:Date;
	b=KrR79iIFJI7uHk3Cm+ucBo1VYcffJEVuLIFN/dhse9GZGm3AeRDb5sA4aJa0dBAqu
	hjCFvV5h5q28Z4QWolq36hGCp90DISwkTm0qB/PdyUQ7mHYWCffxEFklTidVcen88w
	XAon3KeJSWhWLjMhZRnGI0P0cZcwqt8Jr7A9FtJ8=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIMDmY2002844
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 16:13:48 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 18 Dec 2017 16:13:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 18 Dec 2017 16:13:47 -0600
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIMDlqt018385;
	Mon, 18 Dec 2017 16:13:47 -0600
From: Gaurav Mitra <gaurav@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Dec 2017 16:13:33 -0600
Message-ID: <20171218221333.56296-1-gaurav@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] Enable OpenMP RTOS eclipse plugin signature
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
X-List-Received-Date: Mon, 18 Dec 2017 22:13:59 -0000
Content-Type: text/plain

- Integrate hotfix to remove legacy eclipse plugin generation from OpenMP RTOS

Signed-off-by: Gaurav Mitra <gaurav@ti.com>
---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/recipes-ti/openmp-rtos/openmp-rtos_git.bb b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
index f5bf4765..b562e2f2 100644
--- a/recipes-ti/openmp-rtos/openmp-rtos_git.bb
+++ b/recipes-ti/openmp-rtos/openmp-rtos_git.bb
@@ -2,20 +2,41 @@ DESCRIPTION = "TI OpenMP RTOS"
 HOMEPAGE = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
 LICENSE = "BSD"
 
-require recipes-ti/includes/ti-paths.inc
+inherit eclipse-plugin
+require recipes-ti/includes/ti-paths-append.inc
 
-PV = "2_06_02_00"
+PV = "2_06_02_01"
+ECLIPSE_PLUGIN_VERSION = "2.06.02.01"
 PR = "r0"
 
+ECLIPSE_PLUGIN_DIR     = "${OMP_INSTALL_DIR_RECIPE}/eclipse"
+ECLIPSE_PLUGIN_MACHINE = "${@'${MACHINE}'.replace('-evm','')}"
+ECLIPSE_PLUGIN_NAME    = "${ECLIPSE_PLUGIN_MACHINE} OpenMP"
+ECLIPSE_PLUGIN_RTSC    = "com.ti.rtsc.openmp"
+ECLIPSE_PLUGIN_DESC    = "TI OpenMP RTOS"
+
+ECLIPSE_PLUGIN_PROVIDER  = "Texas Instruments Inc."
+ECLIPSE_PLUGIN_DESC_URL  = "http://www.ti.com"
+ECLIPSE_PLUGIN_COPYRIGHT = "Copyright Texas Instruments 2017"
+
+ECLIPSE_PLUGIN_ROOT_MACRO = "OMP_INSTALL_DIR"
+ECLIPSE_PLUGIN_ROOT       = "../../.."
+ECLIPSE_PLUGIN_REPO       = "${ECLIPSE_PLUGIN_ROOT}/packages"
+ECLIPSE_PLUGIN_DOCS       = "${ECLIPSE_PLUGIN_ROOT}/docs"
+ECLIPSE_FOLDER_PREFIX     = "openmp"
+ECLIPSE_ROOT_MACRO        = "OMP_INSTALL_DIR"
+
+# Don't create toc_top.xml or toc_cdoc.xml
+ECLIPSE_PLUGIN_CDOC = ""
+
 OPENMP_RTOS_GIT_URI = "git://git.ti.com/openmp/ti-openmp-dsp-runtime.git"
 OPENMP_RTOS_GIT_PROTOCOL = "git"
 OPENMP_RTOS_GIT_BRANCH = "master"
 
 BRANCH = "${OPENMP_RTOS_GIT_BRANCH}"
-SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH} \
-"
+SRC_URI = "${OPENMP_RTOS_GIT_URI};protocol=${OPENMP_RTOS_GIT_PROTOCOL};branch=${BRANCH}"
 
-SRCREV = "a2a518dcc9154a372b38bd5be8a483359123823c"
+SRCREV = "69af0caf19c2713e21b25e77acf103074be129f2"
 
 LIC_FILES_CHKSUM = "file://docs/license/omp_manifest_template.html;md5=61a6972303c0447b7c056195d7ebafee"
 
-- 
2.14.1


