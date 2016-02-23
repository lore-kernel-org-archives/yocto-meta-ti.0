Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95041E00D47; Tue, 23 Feb 2016 13:27:22 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF913E00D47
	for <meta-ti@yoctoproject.org>; Tue, 23 Feb 2016 13:27:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 60C7152AD5; Tue, 23 Feb 2016 21:27:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160223212718.60C7152AD5@arago-project.org>
Date: Tue, 23 Feb 2016 21:27:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : prueth-fw: add firmware images for PRU Ethernet on AM57xx
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
X-List-Received-Date: Tue, 23 Feb 2016 21:27:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c0e9d9f4ca3e3dc78c4bbfd9720dc37342ef3307
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c0e9d9f4ca3e3dc78c4bbfd9720dc37342ef3307

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 23 04:25:32 2016 +0000

prueth-fw: add firmware images for PRU Ethernet on AM57xx

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/prueth-fw/prueth-fw_git.bb |   33 ++++++++++++++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
new file mode 100644
index 0000000..3b760ac
--- /dev/null
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "PRU Ethernet firmware for AM57xx"
+
+LICENSE = "TI-TFL"
+LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
+
+PV = "1.0.0"
+PR = "r0"
+
+CLEANBROKEN = "1"
+
+COMPATIBLE_MACHINE = "am57xx-evm"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+SRCREV = "4ead3b8c189f217ee2c01ea3c56ef08d6a517f28"
+BRANCH ?= "ti-linux-firmware-4.1.y"
+
+SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+TARGET = "am57xx-pru0-prueth-fw.elf am57xx-pru1-prueth-fw.elf"
+
+do_install() {
+	install -d ${D}${base_libdir}/firmware/ti-pruss
+	for f in ${TARGET}; do
+		install -m 0644 ${S}/ti-pruss/$f ${D}${base_libdir}/firmware/ti-pruss/$f
+	done
+}
+
+FILES_${PN} = "${base_libdir}/firmware"
+
+INSANE_SKIP_${PN} = "arch"


