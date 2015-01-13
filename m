Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0D83E004F2; Tue, 13 Jan 2015 14:44:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AA85E002F9
	for <meta-ti@yoctoproject.org>; Tue, 13 Jan 2015 14:44:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0DMiJ7Y025353
	for <meta-ti@yoctoproject.org>; Tue, 13 Jan 2015 16:44:19 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0DMiJfi000379
	for <meta-ti@yoctoproject.org>; Tue, 13 Jan 2015 16:44:19 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 13 Jan 2015 16:44:18 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0DMiIcY008263;	Tue, 13 Jan 2015 16:44:18 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Jan 2015 17:44:17 -0500
Message-ID: <1421189057-5330-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] demo-image-proc: Add recipe for TI Image processing demo for keystone 2
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
X-List-Received-Date: Tue, 13 Jan 2015 22:44:33 -0000
Content-Type: text/plain

- Provides Binaries for Image processing demo
- Demo Plugs into Matrix gui

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/demo-image-proc/demo-image-proc_git.bb |   32 +++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 recipes-ti/demo-image-proc/demo-image-proc_git.bb

diff --git a/recipes-ti/demo-image-proc/demo-image-proc_git.bb b/recipes-ti/demo-image-proc/demo-image-proc_git.bb
new file mode 100644
index 0000000..60b5d17
--- /dev/null
+++ b/recipes-ti/demo-image-proc/demo-image-proc_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "TI Image Processing Demo for KeyStone 2"
+HOMEPAGE = "http://git.ti.com/cgit/cgit.cgi/keystone-demos/image-proc.git"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://Makefile;beginline=1;endline=29;md5=ada2acff673fad7c53cbfd2598525f2a"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+DEPENDS = "ti-ipc"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-demos/image-proc.git;protocol=git;branch=${BRANCH}"
+#Commit corresponds to DEV.DEMO_IMAGE_PROC-01.00.00.01
+SRCREV = "1745725128929f6d57a3e8e8ed0ca02fe4b28b51"
+PV = "1.0.0.1"
+
+S = "${WORKDIR}/git"
+
+MATRIX_BASE_DIR = "${datadir}/matrix-gui-2.0"
+MATRIX_WEB_DIR = "${MATRIX_BASE_DIR}"
+MATRIX_APP_DIR = "${MATRIX_WEB_DIR}/apps"
+MATRIX_IPD_DIR = "${MATRIX_APP_DIR}/demo_imageproc"
+MATRIX_CGI_DIR = "${MATRIX_IPD_DIR}/cgi-bin"
+
+FILES_${PN} = "${MATRIX_IPD_DIR}/demo_imageproc.html"
+FILES_${PN} += "${MATRIX_CGI_DIR}/image_processing_master.out"
+
+do_install() {
+	install -d ${D}${MATRIX_IPD_DIR}
+	install -d ${D}${MATRIX_CGI_DIR}
+	install -c -m 755 ${S}/ipc/master/image_processing_master.out ${D}${MATRIX_CGI_DIR}
+	install -c -m 755 ${S}/webpage/demo_imageproc.html ${D}${MATRIX_IPD_DIR}
+}
-- 
1.7.9.5


