Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3314EE01458
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 08:44:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A3E4A52A4A; Tue,  7 May 2013 15:44:52 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130507154452.A3E4A52A4A@arago-project.org>
Date: Tue,  7 May 2013 15:44:52 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : am33x-cm3: Split init script into its own package
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
X-List-Received-Date: Tue, 07 May 2013 15:44:53 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dca9b52adc066da860c961fe704094687101d986
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dca9b52adc066da860c961fe704094687101d986

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon May  6 23:26:03 2013 -0500

am33x-cm3: Split init script into its own package

* 3.8+ kernels use an init script to load the cm3 firmware.
* 3.2 kernel require the cm3 firmware during compile time therefore no init
  script is needed.
* Separate the init script from the main package and place it in its own
  package.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/ti/am33x-cm3_git.bb              |    9 ++++++++-
 recipes-kernel/linux/linux-ti-staging_3.8.bb |    4 ++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti/am33x-cm3_git.bb b/recipes-bsp/ti/am33x-cm3_git.bb
index 4829b78..3549fcd 100644
--- a/recipes-bsp/ti/am33x-cm3_git.bb
+++ b/recipes-bsp/ti/am33x-cm3_git.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-BSD"
 LIC_FILES_CHKSUM = "file://License.txt;md5=858099c817e47ea63559fc6b67ae8d91"
 
 PV = "04.06.00.10"
-PR = "r2"
+PR = "r3"
 
 # SRCREV corresponds to tag "AM335xPSP_04.06.00.10-rc1"
 SRCREV = "27ca4643e422245a95723de1df0247a00eada45b"
@@ -15,6 +15,10 @@ INITSCRIPT_PARAMS = "defaults 96"
 
 inherit update-rc.d
 
+UPDATERCPN = "${PN}-initscript"
+
+RDEPENDS_${PN}-initscript = "am33x-cm3"
+
 SRC_URI = "git://arago-project.org/git/projects/am33x-cm3.git;protocol=git;branch=${BRANCH} \
            file://init-am33x-cm3 \
           "
@@ -34,5 +38,8 @@ do_install() {
 	install -m 0755 ${WORKDIR}/init-am33x-cm3 ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
 }
 
+PACKAGES =+ "${PN}-initscript"
+
 FILES_${PN} += "${base_libdir}/firmware"
 
+FILES_${PN}-initscript = "${sysconfdir}/*"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index 6e64fc5..4b93932 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_ti33x += "am33x-cm3"
+RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
 
 # Default is to package all dts files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -30,7 +30,7 @@ SRCREV = "23e7f725a6af4ca44660c06bc3569f6ce705d1d0"
 PV = "3.8.8"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


