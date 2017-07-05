Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1EF9E009C2; Wed,  5 Jul 2017 15:16:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FBCBE00718
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 15:16:33 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65MGWos016491
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499292992;
	bh=TRfdQlrFirtNnyXvcqqWOyMlPvq35crxSj/aLP+T8KI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=gNEgBR12Ri/1hNwWLfP4Srkum5Y8mBslLYrmeYlwkRkObnwJ3jOERA971mT09C637
	KOaLPvMvm+S3zApGM6BBtwO6klatR1SEtLq+pIiIFCv2jCLDod9MnKuxR8SM8RDeQo
	wK/xZx4a156dpxKk0D4pUBHi/GsnAau9vw7IwTSk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65MGWt2005061
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 17:16:32 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v65MGWMa007541	for <meta-ti@yoctoproject.org>;
	Wed, 5 Jul 2017 17:16:32 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Jul 2017 17:16:30 -0500
Message-ID: <1499292992-15234-4-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1499292992-15234-1-git-send-email-i-pang@ti.com>
References: <1499292992-15234-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] ti-pdk-eclipse: added TI PDK eclipse plugin recipe
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
X-List-Received-Date: Wed, 05 Jul 2017 22:16:37 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse.bb        | 28 ++++++++++++++++++++++
 .../ti-pdk-eclipse/pdk_releasenotes.xml            |  1 +
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-csl.xml       |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-gpio.xml  |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-i2c.xml   |  3 +++
 .../ti-pdk-eclipse/ti-drv-icss_emac.xml            |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-mmcsd.xml |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pcie.xml  |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pruss.xml |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-spi.xml   |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-uart.xml  |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-usb.xml   |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-fs-fatfs.xml  |  3 +++
 .../ti-pdk-eclipse/ti-pdk-eclipse/ti-osal.xml      |  3 +++
 .../ti-pdk-eclipse/ti-utils-profiling.xml          |  3 +++
 15 files changed, 68 insertions(+)
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse.bb
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/pdk_releasenotes.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-csl.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-gpio.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-i2c.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-icss_emac.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-mmcsd.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pcie.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pruss.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-spi.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-uart.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-usb.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-fs-fatfs.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-osal.xml
 create mode 100644 recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-utils-profiling.xml

diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse.bb b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse.bb
new file mode 100644
index 0000000..420db35
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse.bb
@@ -0,0 +1,28 @@
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+
+inherit eclipse-plugin
+require recipes-ti/includes/ti-paths.inc
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+ECLIPSE_PLUGIN_DIR     = "${PDK_INSTALL_DIR_RECIPE}/eclipse"
+ECLIPSE_PLUGIN_MACHINE = "${@'${MACHINE}'.replace('-evm','')}"
+ECLIPSE_PLUGIN_NAME    = "${ECLIPSE_PLUGIN_MACHINE} PDK"
+ECLIPSE_PLUGIN_RTSC    = "com.ti.pdk.${ECLIPSE_PLUGIN_MACHINE}"
+ECLIPSE_PLUGIN_VERSION = "${PDK_VERSION}"
+ECLIPSE_PLUGIN_DESC    = "Platform Development Kit"
+
+ECLIPSE_PLUGIN_PROVIDER  = "Texas Instruments Inc."
+ECLIPSE_PLUGIN_DESC_URL  = "http://www.ti.com"
+ECLIPSE_PLUGIN_COPYRIGHT = "Copyright Texas Instruments 2017"
+
+ECLIPSE_PLUGIN_ROOT_MACRO = "TI_PDK_INSTALL_DIR"
+ECLIPSE_PLUGIN_ROOT       = "../../.."
+ECLIPSE_PLUGIN_REPO       = "${ECLIPSE_PLUGIN_ROOT}/packages"
+ECLIPSE_PLUGIN_DOCS       = "${ECLIPSE_PLUGIN_ROOT}/docs"
+ECLIPSE_FOLDER_PREFIX     = "pdk_${ECLIPSE_PLUGIN_MACHINE}"
+ECLIPSE_ROOT_MACRO        = "TI_PDK_INSTALL_DIR"
+
+# Don't create toc_top.xml or toc_cdoc.xml
+ECLIPSE_PLUGIN_CDOC = ""
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/pdk_releasenotes.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/pdk_releasenotes.xml
new file mode 100644
index 0000000..642b9e0
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/pdk_releasenotes.xml
@@ -0,0 +1 @@
+  <topic class="toc-id" label="PDK Release Notes" href="ReleaseNotes_PDK.pdf" title="PDK_Release_Notes"></topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-csl.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-csl.xml
new file mode 100644
index 0000000..09c3ef8
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-csl.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="CSL" title="CSL">
+    <topic class="toc-id" label="CSL-API" href="ti/csl/docs/doxygen/html/index.html" title="CSL_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-gpio.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-gpio.xml
new file mode 100644
index 0000000..113573c
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-gpio.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="GPIO" title="GPIO">
+    <topic class="toc-id" label="GPIO-API" href="ti/drv/gpio/docs/doxygen/html/index.html" title="GPIO_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-i2c.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-i2c.xml
new file mode 100644
index 0000000..788224d
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-i2c.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="I2C" title="I2C">
+    <topic class="toc-id" label="I2C-API" href="ti/drv/i2c/docs/doxygen/html/index.html" title="I2C_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-icss_emac.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-icss_emac.xml
new file mode 100644
index 0000000..7b563f7
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-icss_emac.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="ICSS_EMAC" title="ICSS_EMAC">
+    <topic class="toc-id" label="ICSS_EMAC-API" href="ti/drv/icss_emac/docs/doxygen/html/index.html" title="ICSS_EMAC_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-mmcsd.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-mmcsd.xml
new file mode 100644
index 0000000..e31876b
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-mmcsd.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="MMCSD" title="MMCSD">
+    <topic class="toc-id" label="MMCSD-API" href="ti/drv/mmcsd/docs/doxygen/html/index.html" title="MMCSD_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pcie.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pcie.xml
new file mode 100644
index 0000000..1b6ad81
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pcie.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="PCIE" title="PCIE">
+    <topic class="toc-id" label="PCIE-API" href="ti/drv/pcie/docs/doxygen/html/index.html" title="PCIE_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pruss.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pruss.xml
new file mode 100644
index 0000000..4846a29
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-pruss.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="PRUSS" title="PRUSS">
+    <topic class="toc-id" label="PRUSS-API" href="ti/drv/pruss/docs/doxygen/html/index.html" title="PRUSS_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-spi.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-spi.xml
new file mode 100644
index 0000000..1339d88
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-spi.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="SPI" title="SPI">
+    <topic class="toc-id" label="SPI-API" href="ti/drv/spi/docs/doxygen/html/index.html" title="SPI_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-uart.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-uart.xml
new file mode 100644
index 0000000..9a7f795
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-uart.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="UART" title="UART">
+    <topic class="toc-id" label="UART-API" href="ti/drv/uart/docs/doxygen/html/index.html" title="UART_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-usb.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-usb.xml
new file mode 100644
index 0000000..6fb8e18
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-drv-usb.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="USB" title="USB">
+    <topic class="toc-id" label="USB-API" href="ti/drv/usb/docs/doxygen/html/index.html" title="USB_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-fs-fatfs.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-fs-fatfs.xml
new file mode 100644
index 0000000..14c634e
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-fs-fatfs.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="FATFS" title="FATFS">
+    <topic class="toc-id" label="FATFS-API" href="ti/fs/fatfs/docs/doxygen/html/index.html" title="FATFS_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-osal.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-osal.xml
new file mode 100644
index 0000000..2b16d2d
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-osal.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="OSAL" title="OSAL">
+    <topic class="toc-id" label="OSAL-API" href="ti/osal/docs/doxygen/html/index.html" title="OSAL_API_Reference"></topic>
+  </topic>
diff --git a/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-utils-profiling.xml b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-utils-profiling.xml
new file mode 100644
index 0000000..b9adaea
--- /dev/null
+++ b/recipes-ti/ti-pdk-eclipse/ti-pdk-eclipse/ti-utils-profiling.xml
@@ -0,0 +1,3 @@
+  <topic class="toc-id" label="Profiling Utility" title="Profiling Utility">
+    <topic class="toc-id" label="Profiling-API" href="ti/utils/profiling/docs/doxygen/html/index.html" title="Profiling_API_Reference"></topic>
+  </topic>
-- 
1.9.1


