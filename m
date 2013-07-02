Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4658E01400
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 08:41:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7D94252990; Tue,  2 Jul 2013 15:41:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702154103.7D94252990@arago-project.org>
Date: Tue,  2 Jul 2013 15:41:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Siddharth Heroor : u-boot-glsdk: add GLSDK Staging tree
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
X-List-Received-Date: Tue, 02 Jul 2013 15:41:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 1e463c739577ede852d60ce2f9b2be5dbbd8c15a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1e463c739577ede852d60ce2f9b2be5dbbd8c15a

Author: Siddharth Heroor <heroor@ti.com>
Date:   Mon Jul  1 19:00:14 2013 +0530

u-boot-glsdk: add GLSDK Staging tree

* The GLSDK u-boot staging tree is based off the Core SDK 2013.04.02
  release. This tree will be used to stage patches and fixes on
  top of the Core SDK U-Boot. The GLSDK release will use this tree
  for product development.
* Includes fix to OMAP5 so that QSPI is not enabled.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
new file mode 100644
index 0000000..d60ef44
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-glsdk_2013.01.01.bb
@@ -0,0 +1,16 @@
+require u-boot-ti.inc
+
+DESCRIPTION = "u-boot bootloader for TI devices supported by the GLSDK product"
+
+PR = "r0+gitr${SRCPV}"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://git.ti.com/glsdk/glsdk-u-boot.git;protocol=git;branch=${BRANCH}"
+
+BRANCH ?= "master"
+
+SRCREV = "81836e8cc84bd6523d9a4e187965dcd1633c4bc9"
+
+SPL_BINARY = "MLO"
+SPL_UART_BINARY = "u-boot-spl.bin"


