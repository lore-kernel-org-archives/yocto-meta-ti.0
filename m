Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54FDFE00AB5; Wed, 27 Jan 2016 12:57:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A954FE00B36
	for <meta-ti@yoctoproject.org>; Wed, 27 Jan 2016 12:57:15 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5C89B529C9; Wed, 27 Jan 2016 20:57:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160127205715.5C89B529C9@arago-project.org>
Date: Wed, 27 Jan 2016 20:57:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : netcp-sa-fw: add initial version 1.0.0
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
X-List-Received-Date: Wed, 27 Jan 2016 20:57:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 548f634c1c6a102561f0f60c7457f629a06fd74c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=548f634c1c6a102561f0f60c7457f629a06fd74c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jan 27 03:37:20 2016 +0000

netcp-sa-fw: add initial version 1.0.0

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb |   29 ++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
new file mode 100644
index 0000000..5f07b92
--- /dev/null
+++ b/recipes-bsp/netcp-sa-fw/netcp-sa-fw_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "NETCP SA firmware for Keystone"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
+
+PV = "1.0.0"
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "keystone"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "588f602a21c62f90b1f4318b881c80a1e711317a"
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = "sa_mci.fw"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware
+	install -m 0644 ${S}/ti-keystone/${TARGET} ${D}${base_libdir}/firmware/${TARGET}
+}
+
+FILES_${PN} = "${base_libdir}/firmware"


