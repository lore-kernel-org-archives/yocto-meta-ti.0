Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 524FAE01549
	for <meta-ti@yoctoproject.org>; Mon, 26 Aug 2013 07:36:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CEBAD529C9; Mon, 26 Aug 2013 14:36:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130826143632.CEBAD529C9@arago-project.org>
Date: Mon, 26 Aug 2013 14:36:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti43x: add new SOC family for Sitara AM43xx Cortex-A9 processors
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
X-List-Received-Date: Mon, 26 Aug 2013 14:36:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e75aa7f0224d7bba3e45906dc6c203d7d2b768c3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e75aa7f0224d7bba3e45906dc6c203d7d2b768c3

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 23 15:47:55 2013 -0400

ti43x: add new SOC family for Sitara AM43xx Cortex-A9 processors

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 conf/machine/include/ti43x.inc |   37 +++++++++++++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
new file mode 100644
index 0000000..c9ce2bb
--- /dev/null
+++ b/conf/machine/include/ti43x.inc
@@ -0,0 +1,37 @@
+SOC_FAMILY = "ti43x"
+require conf/machine/include/soc-family.inc
+
+require conf/machine/include/tune-cortexa9.inc
+
+PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
+
+# For built-in LCD, add xf86-input-tslib
+XSERVER = "xserver-xorg \
+           xf86-input-evdev \
+           xf86-input-mouse \
+           xf86-video-fbdev \
+           xf86-input-keyboard"
+
+# Default to external video, change to smallscreen for built-in LCD
+GUI_MACHINE_CLASS = "bigscreen"
+
+# Increase this everytime you change something in the kernel
+MACHINE_KERNEL_PR = "r0"
+
+# Default providers, may need to override for specific machines
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
+
+KERNEL_IMAGETYPE = "uImage"
+
+UBOOT_ARCH = "arm"
+UBOOT_MACHINE = "am43xx_evm_config"
+
+UBOOT_ENTRYPOINT = "0x80008000"
+UBOOT_LOADADDRESS = "0x80008000"
+
+EXTRA_IMAGEDEPENDS += "u-boot"
+
+# List common SoC features, may need to add touchscreen for specific machines
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"


