Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BE3C8E01405
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 88EC852A93; Wed, 18 Apr 2012 17:20:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172029.88EC852A93@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : am33x-cm3: add firmware for am33x suspend/resume
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 17:20:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 62e713b1b309e9e38e2de288da8470f10c61fbc3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=62e713b1b309e9e38e2de288da8470f10c61fbc3

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:43 2012 +0200

am33x-cm3: add firmware for am33x suspend/resume

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
new file mode 100644
index 0000000..247ba4d
--- /dev/null
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Cortex-M3 binary blob for suspend-resume"
+
+LICENSE = "TI-BSD"
+LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
+
+PV = "04.06.00.07"
+SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
+
+SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	make CC="${TARGET_CC}" CROSS_COMPILE="${TARGET_PREFIX}"
+}
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 bin/am335x-pm-firmware.bin ${D}${base_libdir}/firmware/
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+


