Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FCB4E00901; Tue, 16 May 2017 12:17:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F115E0059A
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 12:17:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4GJHDvR004587
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 14:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494962234;
	bh=0ZHtsJ9E6DZ2B6Kbeq3Ih3lmGsslQy7bS/3GvNyFgEk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IlPceb0e+Rlokc9RUypuFCtyOdIRPxUCHUOKimcq8c8e13UGMjh8qPi1qv34QMC7A
	uFCefJ77/FiVi7v1qB7h6aMy8Dj2uPDKtG28YQaXtSoqxXW+JwZR0iOrtjrc9BcAWc
	FXn2OkzDX3fHqjkssXuz3aHFRLnzaMhCw1xz7n3k=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4GJHD82003621
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 14:17:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 May 2017 14:17:13 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4GJHC7I013647;	Tue, 16 May 2017 14:17:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 16 May 2017 15:11:38 -0400
Message-ID: <1494961900-8068-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494961900-8068-1-git-send-email-j-stiffler@ti.com>
References: <1494961900-8068-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] machines: add ti-pdk class variables
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
X-List-Received-Date: Tue, 16 May 2017 19:17:15 -0000
Content-Type: text/plain

* Set the ti-pdk class variables which sets the list of devices and
  boards supported.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 conf/machine/am57xx-evm.conf   | 4 ++++
 conf/machine/beaglebone.conf   | 3 +++
 conf/machine/dra7xx-evm.conf   | 4 ++++
 conf/machine/include/k2e.inc   | 4 ++++
 conf/machine/include/k2g.inc   | 4 ++++
 conf/machine/include/k2hk.inc  | 4 ++++
 conf/machine/include/ti33x.inc | 4 ++++
 conf/machine/include/ti43x.inc | 4 ++++
 conf/machine/k2l-evm.conf      | 4 ++++
 9 files changed, 35 insertions(+)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 7ebf809..a0637c7 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -38,3 +38,7 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am571x am572x"
+TI_PDK_LIMIT_BOARDS = "evmAM571x evmAM572x idkAM571x idkAM572x"
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index d1ed0e1..715d2f2 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -19,3 +19,6 @@ SERIAL_CONSOLE = "115200 ttyS0"
 UBOOT_MACHINE = "am335x_boneblack_config"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+# Refine the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_BOARDS = "bbbAM335x"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ed37770..1e76e22 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -37,3 +37,7 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 # UBI: sub-page size:              512
 # UBI: VID header offset:          2048 (aligned 2048)
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "dra72x dra75x dra78x"
+TI_PDK_LIMIT_BOARDS = "evmDRA72x evmDRA75x evmDRA78x"
diff --git a/conf/machine/include/k2e.inc b/conf/machine/include/k2e.inc
index ce3d9c8..6797fb2 100644
--- a/conf/machine/include/k2e.inc
+++ b/conf/machine/include/k2e.inc
@@ -1,2 +1,6 @@
 require conf/machine/include/keystone.inc
 SOC_FAMILY_append = ":k2e"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "k2e"
+TI_PDK_LIMIT_BOARDS = "evmK2E"
diff --git a/conf/machine/include/k2g.inc b/conf/machine/include/k2g.inc
index 3cd540d..7bcc412 100644
--- a/conf/machine/include/k2g.inc
+++ b/conf/machine/include/k2g.inc
@@ -1,2 +1,6 @@
 require conf/machine/include/keystone.inc
 SOC_FAMILY_append = ":k2g"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "k2g"
+TI_PDK_LIMIT_BOARDS = "evmK2G iceK2G"
diff --git a/conf/machine/include/k2hk.inc b/conf/machine/include/k2hk.inc
index 4f30847..2d2dd6a 100644
--- a/conf/machine/include/k2hk.inc
+++ b/conf/machine/include/k2hk.inc
@@ -1,2 +1,6 @@
 require conf/machine/include/keystone.inc
 SOC_FAMILY_append = ":k2hk"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "k2h k2k"
+TI_PDK_LIMIT_BOARDS = "evmK2H evmK2K"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 73d9aa4..e1f5bbd 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -42,3 +42,7 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am335x"
+TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 2a2fd8d..8830800 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -42,3 +42,7 @@ EXTRA_IMAGEDEPENDS += "u-boot"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am437x"
+TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index bddcd3c..3cf1dab 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -30,3 +30,7 @@ MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 2000"
 # UBI: physical eraseblock size:   256 KiB
 # UBI: sub-page size:              4096
 UBINIZE_ARGS = "-m 4096 -p 256KiB -s 4096 -O 4096"
+
+# Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "k2l"
+TI_PDK_LIMIT_BOARDS = "evmK2L"
-- 
2.7.4


