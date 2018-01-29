Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 836D2E00DBA; Mon, 29 Jan 2018 10:45:54 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51195E00D17
	for <meta-ti@yoctoproject.org>; Mon, 29 Jan 2018 10:45:52 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0TIjqQO006626
	for <meta-ti@yoctoproject.org>; Mon, 29 Jan 2018 12:45:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517251552;
	bh=GXQA1se7PNxnaPXk/N4c7DOWU19qva+up8zy1Kw9iaI=;
	h=From:To:CC:Subject:Date;
	b=fYhRXqbjcgWI30q13xtXnZj5yXehwNzWjqrmQTFZbR+P7FfnyKHDxkragqQsmHw3T
	azBRAuUD7pJ7auAtIx+mwisptiiqlgfoia0tXMyGoYTWCiKy4fNfFdXmCs7nQG4vUL
	Ue0SO9rK/dAUw+rjAeLJeWLFaH+3yfDwfZWGiB9c=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0TIjq43015658
	for <meta-ti@yoctoproject.org>; Mon, 29 Jan 2018 12:45:52 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 29 Jan 2018 12:45:52 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 29 Jan 2018 12:45:52 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0TIjpbn023484;
	Mon, 29 Jan 2018 12:45:51 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Jan 2018 13:37:21 -0500
Message-ID: <1517251041-600-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Stephen Molfetta <sjmolfetta@ti.com>
Subject: [PATCH v2] dra7xx-evm.conf: removing am57xx SOCS from PDK
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
X-List-Received-Date: Mon, 29 Jan 2018 18:45:54 -0000
Content-Type: text/plain

From: Stephen Molfetta <sjmolfetta@ti.com>

opencl-monitor does not distinguish between dra7xx and am57xx devices,
treating both as the same and attempting to build for am57xx regardless.
However, this is dependent on common-csl-ip-rtos, a component of PDK,
which in general does handle these devices differently.  The definition
of am57xx SOCs in the PDK list from omap-15.conf gets inherited by
dra7xx-evm.conf, thereby creating a rule that all dra7xx PDK recipes
must build am57xx libraries. This results in a dra7xx image which is
much larger than necessary, and more severely, creates an artifical
dependency link between these two devices and introduces build failures
for various PDK recipes.

Instead, we now override the PDK SOC definition in dra7xx-evm.conf, and
only in the CSL RTOS recipe do we append the am57xx SOCS for dra7xx-evm
machine build.  This allows for opencl-monitor to build successfully for
dra7xx while preventing any other PDK recipes from attempting to build
libraries for am57xx devices.

This is a workaround that must stay in place until opencl build can
properly comprehend am57xx and dra7xx independently, and/or omap-a15
is not implied to be synonymous with am57xx in various recipes.

Signed-off-by: Stephen Molfetta <sjmolfetta@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes: move am57xx-evm TI_PDK_LIMIT_SOCS from omap-a15 family

 conf/machine/am57xx-evm.conf                        | 1 +
 conf/machine/dra7xx-evm.conf                        | 2 +-
 conf/machine/include/omap-a15.inc                   | 3 ---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 5 ++++-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index e4a4051..6f6fbf8 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -42,4 +42,5 @@ MKUBIFS_ARGS = "-F -m 2048 -e 126976 -c 8192"
 UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 # Set the list of device targets for ti-pdk class recipes
+TI_PDK_LIMIT_SOCS = "am571x am572x"
 TI_PDK_LIMIT_BOARDS = "evmAM571x evmAM572x idkAM571x idkAM572x"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 91afd85..7db9ff6 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -40,4 +40,4 @@ UBINIZE_ARGS = "-m 2048 -p 128KiB -s 512 -O 2048"
 
 # Set the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "evmDRA72x evmDRA75x evmDRA78x"
-TI_PDK_LIMIT_SOCS_append = " dra72x dra75x dra78x"
+TI_PDK_LIMIT_SOCS = "dra72x dra75x dra78x"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 11620a9..6dcff82 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -34,6 +34,3 @@ UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
 MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet sgx mmip dsp"
-
-# Set the list of device targets for ti-pdk class recipes
-TI_PDK_LIMIT_SOCS = "am571x am572x"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index f4496b9..100d2f4 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,5 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.6"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE_append = "|c66x"
@@ -16,3 +16,6 @@ export DEST_ROOT="${S}"
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
+
+# Workaround: dra7xx build requires am57xx CSL libraries for opencl-monitor
+TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x"
-- 
2.7.4


