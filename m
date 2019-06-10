Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80FCCE00D68; Mon, 10 Jun 2019 16:22:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8CDDE00D53
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 16:22:26 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ANMQta027878
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 18:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560208946;
	bh=KvJdeaaALtlw2fqv6f5Q6VY2wi7sP87SB09cIc9BnaA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Rm+B8lbLLpzwBUAA5uNInsOct5b9sBV6Ce3jrlEh/vva8SdjDcOjSnSSSaIUNOW7o
	IXDxeFNTWIKHoh6EaKOt5RzkqlYjlEmUkhqulgaTAF2mfverjcggcHx6yaCBRUCDpW
	jBeBox+rfaAbgR8CeWOlaPbrhHDpmQ6iOE73w+mU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ANMQ6J111390
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 10 Jun 2019 18:22:26 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 10 Jun 2019 18:22:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 10 Jun 2019 18:22:25 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ANMPBs015621;
	Mon, 10 Jun 2019 18:22:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 10 Jun 2019 23:10:03 +0000
Message-ID: <20190610231006.29913-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610231006.29913-1-denys@ti.com>
References: <20190610231006.29913-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 1/4] j7-evm: add config for J7 (J721e) machine
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
X-List-Received-Date: Mon, 10 Jun 2019 23:22:27 -0000
Content-Type: text/plain

The J721E SoC belongs to the K3 Multicore SoC architecture platform,
providing advanced system integration to enable lower system costs
of automotive applications such as infotainment, cluster, premium
Audio, Gateway, industrial and a range of broad market applications.
This SoC is designed around reducing the system cost by eliminating
the need of an external system MCU and is targeted towards ASIL-B/C
certification/requirements in addition to allowing complex software
and system use-cases.

Some highlights of this SoC are:
* Dual Cortex-A72s in a single cluster, three clusters of lockstep
  capable dual Cortex-R5F MCUs, Deep-learning Matrix Multiply Accelerator(MMA),
  C7x floating point Vector DSP, Two C66x floating point DSPs.
* 3D GPU PowerVR Rogue 8XE GE8430
* Vision Processing Accelerator (VPAC) with image signal processor and Depth
  and Motion Processing Accelerator (DMPAC)
* Two Gigabit Industrial Communication Subsystems (ICSSG), each with dual
  PRUs and dual RTUs
* Two CSI2.0 4L RX plus one CSI2.0 4L TX, one eDP/DP, One DSI Tx, and
  up to two DPI interfaces.
* Integrated Ethernet switch supporting up to a total of 8 external ports in
  addition to legacy Ethernet switch of up to 2 ports.
* System MMU (SMMU) Version 3.0 and advanced virtualisation
  capabilities.
* Upto 4 PCIe-GEN3 controllers, 2 USB3.0 Dual-role device subsystems,
  16 MCANs, 12 McASP, eMMC and SD, UFS, OSPI/HyperBus memory controller, QSPI,
  I3C and I2C, eCAP/eQEP, eHRPWM, MLB among other peripherals.
* Two hardware accelerator block containing AES/DES/SHA/MD5 called SA2UL
  management.
* Configurable L3 Cache and IO-coherent architecture with high data throughput
  capable distributed DMA architecture under NAVSS
* Centralized System Controller for Security, Power, and Resource
  Management (DMSC)

See J721E Technical Reference Manual (SPRUIL1, May 2019)
for further details: http://www.ti.com/lit/pdf/spruil1

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/j7-evm.conf | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 conf/machine/j7-evm.conf

diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
new file mode 100644
index 00000000..a8bb71bc
--- /dev/null
+++ b/conf/machine/j7-evm.conf
@@ -0,0 +1,28 @@
+#@TYPE: Machine
+#@NAME: J7 EVM
+#@DESCRIPTION: Machine configuration for the TI J7 EVM
+
+require conf/machine/include/k3.inc
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
+
+SERIAL_CONSOLES = "115200;ttyS2"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-j721e-common-proc-board.dtb \
+"
+
+UBOOT_MACHINE = "j721e_evm_a72_config"
+
+OPTEEMACHINE = "k3"
+OPTEEFLAVOR = "j7"
+OPTEEOUTPUTMACHINE = "k3"
+
+# Please note that booting J7 platform also requires
+# tiboot3.bin and sysfw.itb, which are provided by meta-arago
+# u-boot-k3-r5 and ti-sci-fw recipes
+IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+WKS_FILE = "sdimage-bootpart.wks"
+
+do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot u-boot:do_deploy"
-- 
2.17.1


