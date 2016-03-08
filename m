Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1EBCAE008E1; Tue,  8 Mar 2016 15:44:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 847F5E00928
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C28C852AB6; Tue,  8 Mar 2016 23:44:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234429.C28C852AB6@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-ipc-rtos: preserve FW dir structure, use update-alternatives for test_omx*
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 4234479e12ac0136f91c9003f080c5986bcb3519
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4234479e12ac0136f91c9003f080c5986bcb3519

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Mar  9 04:37:43 2016 +0000

ti-ipc-rtos: preserve FW dir structure, use update-alternatives for test_omx*

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc-rtos_git.bb |   23 +++++++++++++++++++----
 1 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
index eff1001..4c0fc74 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,7 +2,7 @@ require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 require ti-ipc.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 DEPENDS = "ti-xdctools ti-sysbios"
 DEPENDS_append_keystone = " ti-cgt6x-native \
@@ -55,7 +55,22 @@ do_install() {
     install -d ${D}${IPC_INSTALL_DIR_RECIPE}
     cp -pPrf ${S}/* ${D}${IPC_INSTALL_DIR_RECIPE}
 
-    install -d ${D}${base_libdir}/firmware
-    find . -name "*.xe66" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
-    find . -name "*.xem4" -type f | xargs -I {} install -m 0644 {} ${D}${base_libdir}/firmware/
+    install -d ${D}${base_libdir}/firmware/ipc
+    cp -pPrf ${S}/packages/ti/ipc/tests/bin/* ${D}${base_libdir}/firmware/ipc
+}
+
+ALTERNATIVE_PRIORITY = "5"
+
+pkg_postinst_${PN}-fw_omap-a15 () {
+	update-alternatives --install /lib/firmware/dra7-dsp1-fw.xe66 dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66 ${ALTERNATIVE_PRIORITY}
+	update-alternatives --install /lib/firmware/dra7-dsp2-fw.xe66 dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66 ${ALTERNATIVE_PRIORITY}
+	update-alternatives --install /lib/firmware/dra7-ipu1-fw.xem4 dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${ALTERNATIVE_PRIORITY}
+	update-alternatives --install /lib/firmware/dra7-ipu2-fw.xem4 dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4 ${ALTERNATIVE_PRIORITY}
+}
+
+pkg_postrm_${PN}-fw_omap-a15 () {
+	update-alternatives --remove dra7-dsp1-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp1/test_omx_dsp1_vayu.xe66
+	update-alternatives --remove dra7-dsp2-fw.xe66 ipc/ti_platforms_evmDRA7XX_dsp2/test_omx_dsp2_vayu.xe66
+	update-alternatives --remove dra7-ipu1-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4
+	update-alternatives --remove dra7-ipu2-fw.xem4 ipc/ti_platforms_evmDRA7XX_ipu2/test_omx_ipu2_vayu.xem4
 }


