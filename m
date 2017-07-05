Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4887E00ACF; Wed,  5 Jul 2017 15:16:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	WEIRD_QUOTING autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	*  0.0 WEIRD_QUOTING BODY: Weird repeated double-quotation marks
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DD81E00726
	for <meta-ti@yoctoproject.org>; Wed,  5 Jul 2017 15:16:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v65MGWMQ031941
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499292993;
	bh=bg9Z0v+ZLzihz6PO3HuczghT66tcjlrOASZjhhQEkSk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wM/mKBiixTpsx3yz09qAC0tCum/mwRmdPnSl/8Sa4YvuHhUyWHMQQyGbtMNv49vyQ
	d2UzVFl5MNG3NJguMegmrBtKsCM4rIRfJPqRTgrhwTpmrzUS2BwJcb/zlV3CyqmeZm
	TYJvi5sf9h8cbb6DjQd6YlzGHa8JCnEZaU3tTy78=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v65MGWXX014060
	for <meta-ti@yoctoproject.org>; Wed, 5 Jul 2017 17:16:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Jul 2017 17:16:32 -0500
Received: from uda0868762.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v65MGWMc007541	for <meta-ti@yoctoproject.org>;
	Wed, 5 Jul 2017 17:16:32 -0500
From: Ivan Pang <i-pang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Jul 2017 17:16:32 -0500
Message-ID: <1499292992-15234-6-git-send-email-i-pang@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1499292992-15234-1-git-send-email-i-pang@ti.com>
References: <1499292992-15234-1-git-send-email-i-pang@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/6] ti-pdk-makefile: added recipe for TI PDK makefile
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
X-List-Received-Date: Wed, 05 Jul 2017 22:16:40 -0000
Content-Type: text/plain

Signed-off-by: Ivan Pang <i-pang@ti.com>
---
 .../ti-pdk-makefile/ti-pdk-makefile/makefile       |  33 ++
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_aif2  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_asrc  |   6 +
 .../ti-pdk-makefile/makefile_audk2g                |   8 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_bcp   |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_board |  20 ++
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_cmb   |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_cppi  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_csl   |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_dfe   |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_emac  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_fatfs |   6 +
 .../ti-pdk-makefile/makefile_fault_mgmt            |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_fftc  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_gpio  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_gpmc  |   6 +
 .../ti-pdk-makefile/makefile_hyplnk                |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_i2c   |   6 +
 .../ti-pdk-makefile/makefile_icss-emac             |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_iqn2  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_mcasp |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_mcbsp |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_mmap  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_mmcsd |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_nimu  |   6 +
 .../ti-pdk-makefile/makefile_nimu-icss             |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_nwal  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_osal  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_pa    |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_pcie  |   6 +
 .../ti-pdk-makefile/makefile_pktlib                |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_pm    |   6 +
 .../ti-pdk-makefile/makefile_profiling             |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_pruss |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_qmss  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_rm    |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_sa    |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_sbl   |  33 ++
 .../ti-pdk-makefile/makefile_sbl_auto              |   9 +
 .../ti-pdk-makefile/makefile_serdes_diag           |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_spi   |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_srio  |   6 +
 .../ti-pdk-makefile/makefile_starterware           |  71 +++++
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_tcp3d |   6 +
 .../ti-pdk-makefile/makefile_traceframework        |   6 +
 .../ti-pdk-makefile/makefile_transportqmss         |   6 +
 .../ti-pdk-makefile/makefile_transportsrio         |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_tsip  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_uart  |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_usb   |   6 +
 .../ti-pdk-makefile/ti-pdk-makefile/makefile_vps   |   6 +
 .../ti-pdk-makefile/makefile_wdtimer               |   6 +
 recipes-ti/ti-pdk-makefile/ti-pdk-makefile_1.0.bb  | 346 +++++++++++++++++++++
 53 files changed, 796 insertions(+)
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_aif2
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_asrc
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_audk2g
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_bcp
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_board
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cmb
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cppi
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_csl
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_dfe
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_emac
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fatfs
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fault_mgmt
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fftc
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpio
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpmc
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_hyplnk
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_i2c
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_icss-emac
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_iqn2
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcasp
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcbsp
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmap
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmcsd
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu-icss
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nwal
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_osal
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pa
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pcie
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pktlib
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pm
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_profiling
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pruss
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_qmss
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_rm
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sa
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl_auto
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_serdes_diag
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_spi
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_srio
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_starterware
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tcp3d
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_traceframework
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportqmss
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportsrio
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tsip
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_uart
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_usb
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_vps
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_wdtimer
 create mode 100644 recipes-ti/ti-pdk-makefile/ti-pdk-makefile_1.0.bb

diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile
new file mode 100644
index 0000000..4846388
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile
@@ -0,0 +1,33 @@
+#*******************************************************************************
+#* FILE PURPOSE: Top level makefile for Creating Component Libraries and example 
+#*               binaries
+#*******************************************************************************
+#* FILE NAME: makefile
+#*
+#* DESCRIPTION: Defines Compiler tools paths, libraries , Build Options 
+#*
+#*
+#*******************************************************************************
+#*
+# (Mandatory) Specify where various tools are installed.
+
+include Rules.make
+
+ifndef MAKE
+export MAKE = make
+endif
+
+ifndef ECHO
+export ECHO = echo
+endif
+
+ifndef RM
+export RM = rm -f
+endif
+
+ifndef CP
+export CP = cp
+endif
+
+all: __PDK_ALL_TARGETS__
+clean: __PDK_CLEAN_TARGETS__
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_aif2 b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_aif2
new file mode 100644
index 0000000..0de6f28
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_aif2
@@ -0,0 +1,6 @@
+
+aif2:
+	$(MAKE) -C ./ti/drv/aif2 all
+
+aif2_clean:
+	$(MAKE) -C ./ti/drv/aif2 clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_asrc b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_asrc
new file mode 100644
index 0000000..cd282d4
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_asrc
@@ -0,0 +1,6 @@
+
+asrc:
+	$(MAKE) -C ./ti/drv/asrc all
+
+asrc_clean:
+	$(MAKE) -C ./ti/drv/asrc clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_audk2g b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_audk2g
new file mode 100644
index 0000000..988988d
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_audk2g
@@ -0,0 +1,8 @@
+AUDK2G_DEPS = __AUDK2G_DEPS__
+audk2g: $(AUDK2G_DEPS)
+	$(MAKE) -C ./ti/addon/audk2g all
+	$(MAKE) -C ./ti/addon/audk2g/test/analog/loopback/build/make all
+
+audk2g_clean:
+	$(MAKE) -C ./ti/addon/audk2g clean
+	$(MAKE) -C ./ti/addon/audk2g/test/analog/loopback/build/make clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_bcp b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_bcp
new file mode 100644
index 0000000..40372b0
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_bcp
@@ -0,0 +1,6 @@
+
+bcp:
+	$(MAKE) -C ./ti/drv/bcp all
+
+bcp_clean:
+	$(MAKE) -C ./ti/drv/bcp clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_board b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_board
new file mode 100644
index 0000000..f38abea
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_board
@@ -0,0 +1,20 @@
+
+board: board_lib board_diag
+
+diag: board_diag
+
+board_lib:
+	$(MAKE) -C ./ti/board all
+
+BOARD_DIAG_DEPS = __BOARD_DIAG_DEPS__
+ALL_BOARDS = __BOARD_ALL_BOARDS__
+board_diag: board_lib $(BOARD_DIAG_DEPS)
+	$(MAKE) -C ./ti/board/diag ALL_BOARDS="$(ALL_BOARDS)"
+
+board_clean: board_diag_clean board_lib_clean
+
+board_lib_clean:
+	$(MAKE) -C ./ti/board clean
+
+board_diag_clean:
+	$(MAKE) -C ./ti/board/diag clean ALL_BOARDS="$(ALL_BOARDS)"
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cmb b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cmb
new file mode 100644
index 0000000..43a0821
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cmb
@@ -0,0 +1,6 @@
+
+cmb:
+	$(MAKE) -C ./ti/addon/cmb all
+
+cmb_clean:
+	$(MAKE) -C ./ti/addon/cmb clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cppi b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cppi
new file mode 100644
index 0000000..c3aff73
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_cppi
@@ -0,0 +1,6 @@
+
+cppi:
+	$(MAKE) -C ./ti/drv/cppi all
+
+cppi_clean:
+	$(MAKE) -C ./ti/drv/cppi clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_csl b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_csl
new file mode 100644
index 0000000..30a5b03
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_csl
@@ -0,0 +1,6 @@
+
+csl: 
+	$(MAKE) -C ./ti/csl all
+
+csl_clean:
+	$(MAKE) -C ./ti/csl clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_dfe b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_dfe
new file mode 100644
index 0000000..911086e
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_dfe
@@ -0,0 +1,6 @@
+
+dfe:
+	$(MAKE) -C ./ti/drv/dfe all
+
+dfe_clean:
+	$(MAKE) -C ./ti/drv/dfe clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_emac b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_emac
new file mode 100644
index 0000000..f040b38
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_emac
@@ -0,0 +1,6 @@
+
+emac:
+	$(MAKE) -C ./ti/drv/emac all
+
+emac_clean:
+	$(MAKE) -C ./ti/drv/emac clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fatfs b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fatfs
new file mode 100644
index 0000000..4389c2e
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fatfs
@@ -0,0 +1,6 @@
+
+fatfs:
+	$(MAKE) -C ./ti/fs/fatfs all
+
+fatfs_clean:
+	$(MAKE) -C ./ti/fs/fatfs clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fault_mgmt b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fault_mgmt
new file mode 100644
index 0000000..8db4b94
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fault_mgmt
@@ -0,0 +1,6 @@
+
+fault_mgmt:
+	$(MAKE) -C ./ti/instrumentation/fault_mgmt all
+
+fault_mgmt_clean:
+	$(MAKE) -C ./ti/instrumentation/fault_mgmt clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fftc b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fftc
new file mode 100644
index 0000000..9454583
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_fftc
@@ -0,0 +1,6 @@
+
+fftc:
+	$(MAKE) -C ./ti/drv/fftc all
+
+fftc_clean:
+	$(MAKE) -C ./ti/drv/fftc clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpio b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpio
new file mode 100644
index 0000000..5a8b424
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpio
@@ -0,0 +1,6 @@
+
+gpio:
+	$(MAKE) -C ./ti/drv/gpio all
+
+gpio_clean:
+	$(MAKE) -C ./ti/drv/gpio clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpmc b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpmc
new file mode 100644
index 0000000..4a7a976
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_gpmc
@@ -0,0 +1,6 @@
+
+gpmc:
+	$(MAKE) -C ./ti/drv/gpmc all
+
+gpmc_clean:
+	$(MAKE) -C ./ti/drv/gpmc clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_hyplnk b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_hyplnk
new file mode 100644
index 0000000..1dd5779
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_hyplnk
@@ -0,0 +1,6 @@
+
+hyplnk:
+	$(MAKE) -C ./ti/drv/hyplnk all
+
+hyplnk_clean:
+	$(MAKE) -C ./ti/drv/hyplnk clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_i2c b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_i2c
new file mode 100644
index 0000000..ce60cc1
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_i2c
@@ -0,0 +1,6 @@
+
+i2c:
+	${MAKE} -C ./ti/drv/i2c all
+
+i2c_clean:
+	${MAKE} -C ./ti/drv/i2c clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_icss-emac b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_icss-emac
new file mode 100644
index 0000000..5f8ecdf
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_icss-emac
@@ -0,0 +1,6 @@
+
+icss-emac:
+	$(MAKE) -C ./ti/drv/icss_emac all
+
+icss-emac_clean:
+	$(MAKE) -C ./ti/drv/icss_emac clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_iqn2 b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_iqn2
new file mode 100644
index 0000000..e073cd2
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_iqn2
@@ -0,0 +1,6 @@
+
+iqn2:
+	$(MAKE) -C ./ti/drv/iqn2 all
+
+iqn2_clean:
+	$(MAKE) -C ./ti/drv/iqn2 clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcasp b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcasp
new file mode 100644
index 0000000..a42815f
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcasp
@@ -0,0 +1,6 @@
+
+mcasp:
+	$(MAKE) -C ./ti/drv/mcasp all
+
+mcasp_clean:
+	$(MAKE) -C ./ti/drv/mcasp clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcbsp b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcbsp
new file mode 100644
index 0000000..7d38d85
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mcbsp
@@ -0,0 +1,6 @@
+
+mcbsp:
+	$(MAKE) -C ./ti/drv/mcbsp all
+
+mcbsp_clean:
+	$(MAKE) -C ./ti/drv/mcbsp clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmap b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmap
new file mode 100644
index 0000000..69e8729
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmap
@@ -0,0 +1,6 @@
+
+mmap:
+	$(MAKE) -C ./ti/runtime/mmap all
+
+mmap_clean:
+	$(MAKE) -C ./ti/runtime/mmap clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmcsd b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmcsd
new file mode 100644
index 0000000..68410ad
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_mmcsd
@@ -0,0 +1,6 @@
+
+mmcsd:
+	$(MAKE) -C ./ti/drv/mmcsd all
+
+mmcsd_clean:
+	$(MAKE) -C ./ti/drv/mmcsd clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu
new file mode 100644
index 0000000..97d3370
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu
@@ -0,0 +1,6 @@
+
+nimu:
+	$(MAKE) -C ./ti/transport/ndk/nimu all
+
+nimu_clean:
+	$(MAKE) -C ./ti/transport/ndk/nimu clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu-icss b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu-icss
new file mode 100644
index 0000000..c2f2877
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nimu-icss
@@ -0,0 +1,6 @@
+
+nimu-icss:
+	$(MAKE) -C ./ti/transport/ndk/nimu_icss all
+
+nimu-icss_clean:
+	$(MAKE) -C ./ti/transport/ndk/nimu_icss clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nwal b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nwal
new file mode 100644
index 0000000..e793444
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_nwal
@@ -0,0 +1,6 @@
+
+nwal:
+	$(MAKE) -C ./ti/drv/nwal all
+
+nwal_clean:
+	$(MAKE) -C ./ti/drv/nwal clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_osal b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_osal
new file mode 100644
index 0000000..15a420b
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_osal
@@ -0,0 +1,6 @@
+
+osal:
+	$(MAKE) -C ./ti/osal all DISABLE_RECURSE_DEPS="yes"
+
+osal_clean:
+	$(MAKE) -C ./ti/osal clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pa b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pa
new file mode 100644
index 0000000..ed00ff6
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pa
@@ -0,0 +1,6 @@
+
+pa:
+	$(MAKE) -C ./ti/drv/pa all
+
+pa_clean:
+	$(MAKE) -C ./ti/drv/pa clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pcie b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pcie
new file mode 100644
index 0000000..12b3f5c2
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pcie
@@ -0,0 +1,6 @@
+
+pcie:
+	$(MAKE) -C ./ti/drv/pcie all
+
+pcie_clean:
+	$(MAKE) -C ./ti/drv/pcie clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pktlib b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pktlib
new file mode 100644
index 0000000..eef0d1f
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pktlib
@@ -0,0 +1,6 @@
+
+pktlib:
+	$(MAKE) -C ./ti/runtime/pktlib all
+
+pktlib_clean:
+	$(MAKE) -C ./ti/runtime/pktlib clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pm b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pm
new file mode 100644
index 0000000..c527326
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pm
@@ -0,0 +1,6 @@
+
+pm:
+	$(MAKE) -C ./ti/drv/pm all DISABLE_RECURSE_DEPS="yes"
+
+pm_clean:
+	$(MAKE) -C ./ti/drv/pm clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_profiling b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_profiling
new file mode 100644
index 0000000..a6e1025
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_profiling
@@ -0,0 +1,6 @@
+
+profiling:
+	$(MAKE) -C ./ti/utils/profiling all
+
+profiling_clean:
+	$(MAKE) -C ./ti/utils/profiling clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pruss b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pruss
new file mode 100644
index 0000000..c57fdc0
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_pruss
@@ -0,0 +1,6 @@
+
+pruss:
+	$(MAKE) -C ./ti/drv/pruss all
+
+pruss_clean:
+	$(MAKE) -C ./ti/drv/pruss clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_qmss b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_qmss
new file mode 100644
index 0000000..325933c
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_qmss
@@ -0,0 +1,6 @@
+
+qmss:
+	$(MAKE) -C ./ti/drv/qmss all
+
+qmss_clean:
+	$(MAKE) -C ./ti/drv/qmss clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_rm b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_rm
new file mode 100644
index 0000000..43ff8b9
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_rm
@@ -0,0 +1,6 @@
+
+rm:
+	$(MAKE) -C ./ti/drv/rm all
+
+rm_clean:
+	$(MAKE) -C ./ti/drv/rm clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sa b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sa
new file mode 100644
index 0000000..116374f
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sa
@@ -0,0 +1,6 @@
+
+sa:
+	$(MAKE) -C ./ti/drv/sa all
+
+sa_clean:
+	$(MAKE) -C ./ti/drv/sa clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl
new file mode 100644
index 0000000..15ec0f6
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl
@@ -0,0 +1,33 @@
+
+SBL_PLATFORM = __SBL_PLATFORM__
+
+sbl: board_lib uart spi mmcsd fatfs
+ifeq ($(SBL_PLATFORM), am57xx)
+	# am57xx
+	$(MAKE) -C ./ti/boot/sbl all BOARD=idkAM572x SOC=AM572x BOOTMODE=mmcsd
+	$(MAKE) -C ./ti/boot/sbl all BOARD=idkAM572x SOC=AM572x BOOTMODE=qspi
+	$(MAKE) -C ./ti/boot/sbl all BOARD=idkAM571x SOC=AM571x BOOTMODE=mmcsd
+	$(MAKE) -C ./ti/boot/sbl all BOARD=idkAM571x SOC=AM571x BOOTMODE=qspi
+	$(MAKE) -C ./ti/boot/sbl all BOARD=evmAM572x SOC=AM572x BOOTMODE=mmcsd
+	$(MAKE) -C ./ti/boot/sbl flashwriter BOARD=idkAM572x SOC=AM572x
+	$(MAKE) -C ./ti/boot/sbl flashwriter BOARD=idkAM571x SOC=AM571x
+else ifeq ($(SBL_PLATFORM), k2g)
+	# k2g
+	$(MAKE) -C ./ti/boot/sbl all BOARD=evmK2G SOC=K2G BOOTMODE=mmcsd
+	$(MAKE) -C ./ti/boot/sbl all BOARD=evmK2G SOC=K2G BOOTMODE=qspi
+	$(MAKE) -C ./ti/boot/sbl flashwriter BOARD=evmK2G SOC=K2G
+endif
+
+sbl_clean:
+ifeq ($(SBL_PLATFORM), am57xx)
+	# am57xx
+	$(MAKE) -C ./ti/boot/sbl clean BOARD=idkAM572x
+	$(MAKE) -C ./ti/boot/sbl clean BOARD=idkAM571x
+	$(MAKE) -C ./ti/boot/sbl clean BOARD=evmAM572x
+	$(MAKE) -C ./ti/boot/sbl flashwriter_clean BOARD=idkAM572x
+	$(MAKE) -C ./ti/boot/sbl flashwriter_clean BOARD=idkAM571x
+else ifeq ($(SBL_PLATFORM), k2g)
+	# k2g
+	$(MAKE) -C ./ti/boot/sbl clean BOARD=evmK2G
+	$(MAKE) -C ./ti/boot/sbl flashwriter_clean BOARD=evmK2G
+endif
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl_auto b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl_auto
new file mode 100644
index 0000000..f630df5
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_sbl_auto
@@ -0,0 +1,9 @@
+sbl_auto:
+	$(MAKE) -C ./ti/boot/sbl_auto sbl_all SOC=dra72x BOARD=evmDRA72x
+	$(MAKE) -C ./ti/boot/sbl_auto sbl_all SOC=dra75x BOARD=evmDRA75x
+	$(MAKE) -C ./ti/boot/sbl_auto sbl_all SOC=dra78x BOARD=evmDRA78x
+
+sbl_auto_clean:
+	$(MAKE) -C ./ti/boot/sbl_auto sbl_all_clean SOC=dra72x BOARD=evmDRA72x
+	$(MAKE) -C ./ti/boot/sbl_auto sbl_all_clean SOC=dra75x BOARD=evmDRA75x
+	$(MAKE) -C ./ti/boot/sbl_auto sbl_all_clean SOC=dra78x BOARD=evmDRA78x
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_serdes_diag b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_serdes_diag
new file mode 100644
index 0000000..2665dbc
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_serdes_diag
@@ -0,0 +1,6 @@
+
+serdes_diag:
+	$(MAKE) -C ./ti/diag/serdes_diag all
+
+serdes_diag_clean:
+	$(MAKE) -C ./ti/diag/serdes_diag clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_spi b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_spi
new file mode 100644
index 0000000..45f081d
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_spi
@@ -0,0 +1,6 @@
+
+spi:
+	$(MAKE) -C ./ti/drv/spi all
+
+spi_clean:
+	$(MAKE) -C ./ti/drv/spi clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_srio b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_srio
new file mode 100644
index 0000000..0f0f236
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_srio
@@ -0,0 +1,6 @@
+
+srio:
+	$(MAKE) -C ./ti/drv/srio all
+
+srio_clean:
+	$(MAKE) -C ./ti/drv/srio clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_starterware b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_starterware
new file mode 100644
index 0000000..4bc880a
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_starterware
@@ -0,0 +1,71 @@
+
+# Linux default build environment
+ifeq ($(OS), )
+    OS := linux
+endif
+
+ifeq ($(OS),Windows_NT)
+    # Object clean on Windows
+    CLEAN_RECURSIVE_OBJ=cmd /C del /s ti\\starterware\\*.o ti\\starterware\\*.a > NUL
+else
+    # Object clean on Linux
+    CLEAN_RECURSIVE_OBJ=find ti/starterware -name "*.[ao]" -delete
+endif
+
+STARTERWARE_PLATFORM = __STARTERWARE_PLATFORM__
+
+starterware: starterware_boot starterware_libs starterware_apps
+
+starterware_boot:
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=uart PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=debug -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=uart PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=release -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=mmcsd PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=debug -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=mmcsd PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=release -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=nand PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=debug -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=nand PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=release -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+ifeq ($(STARTERWARE_PLATFORM), am335x-evm)
+	# am335x-evm
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=mcspi PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=debug -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=mcspi PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=release -s KW_BUILD=no
+else ifeq ($(STARTERWARE_PLATFORM), am43xx-evm)
+	# am437x-evm
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=qspi PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=debug -s KW_BUILD=no
+	$(CLEAN_RECURSIVE_OBJ)
+	$(MAKE) -C ./ti/starterware bootloader BUILDCFG=boot BOOTMODE=qspi PLATFORM=$(STARTERWARE_PLATFORM) PROFILE=release -s KW_BUILD=no
+endif
+
+starterware_libs:
+	$(MAKE) -C ./ti/starterware PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+
+starterware_apps:
+ifeq ($(STARTERWARE_PLATFORM), am335x-evm)
+	# am335x-evm
+	$(MAKE) -C ./ti/starterware lcdc_app_raster PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware lcdc_app_raster PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware mcspi_app_flash PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware mcspi_app_flash PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+else ifeq ($(STARTERWARE_PLATFORM), am43xx-evm)
+	# am437x-evm
+	$(MAKE) -C ./ti/starterware vpfe_app_capture_display PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware vpfe_app_capture_display PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware cap_tsc_app PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware cap_tsc_app PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware dss_app_raster PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware dss_app_raster PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware qspi_app_flash_writer PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware qspi_app_flash_writer PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware qspi_app_read_write PROFILE=debug PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+	$(MAKE) -C ./ti/starterware qspi_app_read_write PROFILE=release PLATFORM=$(STARTERWARE_PLATFORM) -s KW_BUILD=no
+endif
+
+starterware_clean:
+	$(MAKE) -C ./ti/starterware clean PLATFORM=$(STARTERWARE_PLATFORM) KW_BUILD=no
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tcp3d b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tcp3d
new file mode 100644
index 0000000..2715bf9
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tcp3d
@@ -0,0 +1,6 @@
+
+tcp3d:
+	$(MAKE) -C ./ti/drv/tcp3d all
+
+tcp3d_clean:
+	$(MAKE) -C ./ti/drv/tcp3d clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_traceframework b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_traceframework
new file mode 100644
index 0000000..97cee05
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_traceframework
@@ -0,0 +1,6 @@
+
+traceframework:
+	$(MAKE) -C ./ti/instrumentation/traceframework all
+
+traceframework_clean:
+	$(MAKE) -C ./ti/instrumentation/traceframework clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportqmss b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportqmss
new file mode 100644
index 0000000..fdc3856
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportqmss
@@ -0,0 +1,6 @@
+
+transportqmss:
+	$(MAKE) -C ./ti/transport/ipc/c66/qmss all
+
+transportqmss_clean:
+	$(MAKE) -C ./ti/transport/ipc/c66/qmss clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportsrio b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportsrio
new file mode 100644
index 0000000..d3dd71d
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_transportsrio
@@ -0,0 +1,6 @@
+
+transportsrio:
+	$(MAKE) -C ./ti/transport/ipc/c66/srio all
+
+transportsrio_clean:
+	$(MAKE) -C ./ti/transport/ipc/c66/srio clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tsip b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tsip
new file mode 100644
index 0000000..51868e9
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_tsip
@@ -0,0 +1,6 @@
+
+tsip:
+	$(MAKE) -C ./ti/drv/tsip all
+
+tsip_clean:
+	$(MAKE) -C ./ti/drv/tsip clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_uart b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_uart
new file mode 100644
index 0000000..3807c96
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_uart
@@ -0,0 +1,6 @@
+
+uart:
+	$(MAKE) -C ./ti/drv/uart all
+
+uart_clean:
+	$(MAKE) -C ./ti/drv/uart clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_usb b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_usb
new file mode 100644
index 0000000..f60e666
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_usb
@@ -0,0 +1,6 @@
+
+usb:
+	$(MAKE) -C ./ti/drv/usb all
+
+usb_clean:
+	$(MAKE) -C ./ti/drv/usb clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_vps b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_vps
new file mode 100644
index 0000000..1706250
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_vps
@@ -0,0 +1,6 @@
+
+vps:
+	$(MAKE) -C ./ti/drv/vps all DISABLE_RECURSE_DEPS="yes"
+
+vps_clean:
+	$(MAKE) -C ./ti/drv/vps clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_wdtimer b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_wdtimer
new file mode 100644
index 0000000..688215e
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile/makefile_wdtimer
@@ -0,0 +1,6 @@
+
+wdtimer:
+	$(MAKE) -C ./ti/instrumentation/wdtimer all
+
+wdtimer_clean:
+	$(MAKE) -C ./ti/instrumentation/wdtimer clean
diff --git a/recipes-ti/ti-pdk-makefile/ti-pdk-makefile_1.0.bb b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile_1.0.bb
new file mode 100644
index 0000000..9e2a64d
--- /dev/null
+++ b/recipes-ti/ti-pdk-makefile/ti-pdk-makefile_1.0.bb
@@ -0,0 +1,346 @@
+DESCRIPTION = "Package containing Makefile for TI PDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+require recipes-ti/includes/ti-paths.inc
+
+# Build the list of component makefiles to put together to build the
+# Makefile that goes into the SDK.  For legacy devices the base Makefile
+# will be picked up and will contain everything.
+#
+# It is assumed that the component makefiles follow the naming
+# Makefile_$component.  All Makefiles will be part of the SRC_URI to be
+# fetched, but only the listed ones will be used to build the final Makefile
+
+SRC_URI = "\
+    file://makefile \
+    file://makefile_aif2 \
+    file://makefile_audk2g \
+    file://makefile_bcp \
+    file://makefile_board \
+    file://makefile_cmb \
+    file://makefile_cppi \
+    file://makefile_csl \
+    file://makefile_dfe \
+    file://makefile_emac \
+    file://makefile_fault_mgmt \
+    file://makefile_fatfs \
+    file://makefile_fftc \
+    file://makefile_gpio \
+    file://makefile_gpmc \
+    file://makefile_hyplnk \
+    file://makefile_i2c \
+    file://makefile_icss-emac \
+    file://makefile_iqn2 \
+    file://makefile_mcasp \
+    file://makefile_mcbsp \
+    file://makefile_mmap \
+    file://makefile_mmcsd \
+    file://makefile_nimu \
+    file://makefile_nimu-icss \
+    file://makefile_nwal \
+    file://makefile_osal \
+    file://makefile_pa \
+    file://makefile_pcie \
+    file://makefile_pktlib \
+    file://makefile_pm \
+    file://makefile_profiling \
+    file://makefile_pruss \
+    file://makefile_qmss \
+    file://makefile_rm \
+    file://makefile_sa \
+    file://makefile_sbl \
+    file://makefile_sbl_auto \
+    file://makefile_serdes_diag \
+    file://makefile_spi \
+    file://makefile_srio \
+    file://makefile_starterware \
+    file://makefile_tcp3d \
+    file://makefile_traceframework \
+    file://makefile_transportqmss \
+    file://makefile_transportsrio \
+    file://makefile_tsip \
+    file://makefile_uart \
+    file://makefile_usb \
+    file://makefile_wdtimer \
+    file://makefile_vps \
+"
+
+PR = "r0"
+
+MAKEFILES = ""
+
+MAKEFILES_append_ti33x = "\
+    csl \
+    profiling \
+    board \
+    emac \
+    fatfs \
+    gpio \
+    gpmc \
+    i2c \
+    icss-emac \
+    mcasp \
+    mmcsd \
+    nimu \
+    nimu-icss \
+    osal \
+    pm \
+    spi \
+    starterware \
+    uart \
+    pruss \
+"
+
+MAKEFILES_append_ti43x = "\
+    csl \
+    profiling \
+    board \
+    emac \
+    fatfs \
+    gpio \
+    gpmc \
+    i2c \
+    icss-emac \
+    mcasp \
+    mmcsd \
+    nimu \
+    nimu-icss \
+    osal \
+    pm \
+    spi \
+    starterware \
+    uart \
+    usb \
+    pruss \
+"
+
+MAKEFILES_append_omap-a15 = "\
+    csl \
+    profiling \
+    board \
+    emac \
+    fatfs \
+    gpio \
+    i2c \
+    mcasp \
+    mmcsd \
+    nimu \
+    osal \
+    pm \
+    spi \
+    uart \
+"
+
+MAKEFILES_append_am57xx-evm = "\
+    icss-emac \
+    nimu-icss \
+    pcie \
+    sbl \
+    usb \
+    vps \
+    pruss \
+"
+
+MAKEFILES_append_dra7xx-evm = "\
+    sbl_auto \
+"
+
+MAKEFILES_append_omapl1 = "\
+    csl \
+    board \
+    osal \
+    fatfs \
+    gpio \
+    i2c \
+    uart \
+    spi \
+    mmcsd \
+    mcasp \
+    emac \
+    nimu \
+"
+
+MAKEFILES_append_keystone = "\
+    board \
+    csl \
+    cppi \
+    i2c \
+    nimu \
+    osal \
+    pcie \
+    qmss \
+    rm \
+    spi \
+    uart \
+"
+
+MAKEFILES_append_k2hk-evm = "\
+    bcp \
+    fault_mgmt \
+    fftc \
+    hyplnk \
+    nwal \
+    pa \
+    pktlib \
+    sa \
+    srio \
+    tcp3d \
+    transportqmss \
+    transportsrio \
+    wdtimer \
+"
+
+MAKEFILES_append_k2e-evm = "\
+    fault_mgmt \
+    hyplnk \
+    nwal \
+    pa \
+    sa \
+    transportqmss \
+    tsip \
+    wdtimer \
+"
+
+MAKEFILES_append_k2l-evm = "\
+    bcp \
+    dfe \
+    fault_mgmt \
+    fftc \
+    iqn2 \
+    nwal \
+    pa \
+    sa \
+    tcp3d \
+    transportqmss \
+    wdtimer \
+"
+
+MAKEFILES_append_k2g = "\
+    audk2g \
+    profiling \
+    cmb \
+    emac \
+    fatfs \
+    gpio \
+    icss-emac \
+    mcasp \
+    mcbsp \
+    mmcsd \
+    nimu-icss \
+    pm \
+    pruss \
+    sa \
+    sbl \
+"
+
+MAKEFILES_append_c667x-evm = "\
+    bcp \
+    board \
+    cppi \
+    gpio \
+    hyplnk \
+    i2c \
+    nimu \
+    nwal \
+    pa \
+    pcie \
+    qmss \
+    sa \
+    spi \
+    srio \
+    tsip \
+    uart \
+"
+
+MAKEFILES_append_c665x-evm = "\
+    board \
+    cppi \
+    emac \
+    gpio \
+    hyplnk \
+    i2c \
+    mcbsp \
+    nimu \
+    pcie \
+    qmss \
+    spi \
+    srio \
+    tcp3d \
+    uart \
+"
+
+BOARD_DIAG_DEPS = ""
+BOARD_ALL_BOARDS = ""
+
+BOARD_DIAG_DEPS_am57xx-evm = "csl profiling fatfs gpio i2c icss-emac mmcsd spi uart osal pruss"
+BOARD_ALL_BOARDS_am57xx-evm = "idkAM571x idkAM572x evmAM572x"
+
+BOARD_DIAG_DEPS_dra7xx-evm = ""
+BOARD_ALL_BOARDS_dra7xx-evm = "evmDRA72x evmDRA75x evmDRA78x"
+
+BOARD_DIAG_DEPS_omapl1 = "csl gpio i2c uart osal"
+BOARD_ALL_BOARDS_omapl137-evm = "evmOMAPL137"
+BOARD_ALL_BOARDS_omapl138-lcdk = "lcdkOMAPL138"
+
+BOARD_DIAG_DEPS_k2g = "csl profiling fatfs gpio i2c icss-emac mmcsd spi uart osal pruss cppi qmss emac"
+BOARD_ALL_BOARDS_k2g = "evmK2G iceK2G"
+
+BOARD_DIAG_DEPS_ti43x = "csl profiling fatfs gpio i2c mmcsd spi uart osal"
+BOARD_ALL_BOARDS_ti43x = "evmAM437x skAM437x idkAM437x"
+
+BOARD_DIAG_DEPS_ti33x = "csl profiling fatfs gpio i2c mmcsd spi uart osal"
+BOARD_ALL_BOARDS_ti33x = "evmAM335x"
+
+AUDK2G_DEPS = ""
+AUDK2G_DEPS_k2g = "mcasp"
+
+SBL_PLATFORM = ""
+SBL_PLATFORM_am57xx-evm = "am57xx"
+SBL_PLATFORM_k2g = "k2g"
+
+STARTERWARE_PLATFORM = ""
+STARTERWARE_PLATFORM_ti33x = "am335x-evm"
+STARTERWARE_PLATFORM_ti43x = "am43xx-evm"
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+
+    install ${WORKDIR}/makefile ${D}${PDK_INSTALL_DIR_RECIPE}/packages
+
+    targets=""
+    clean_targets=""
+
+    for x in ${MAKEFILES}
+    do
+        cat ${WORKDIR}/makefile_${x} >> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+        targets="$targets""$x\ "
+        clean_targets="$clean_targets""$x""_clean\ "
+    done
+
+    if [ "$targets" != "" ]
+    then
+        sed -i -e "s|__PDK_ALL_TARGETS__|$targets|" ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+        sed -i -e "s|__PDK_CLEAN_TARGETS__|$clean_targets|" ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+    fi
+
+    sed -i -e "s|__BOARD_DIAG_DEPS__|${BOARD_DIAG_DEPS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+    sed -i -e "s|__BOARD_ALL_BOARDS__|${BOARD_ALL_BOARDS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+
+    sed -i -e "s|__SBL_PLATFORM__|${SBL_PLATFORM}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+
+    sed -i -e "s|__STARTERWARE_PLATFORM__|${STARTERWARE_PLATFORM}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+}
+
+do_install_append_k2g() {
+    sed -i -e "s|__AUDK2G_DEPS__|${AUDK2G_DEPS}|g" \
+        ${D}${PDK_INSTALL_DIR_RECIPE}/packages/makefile
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+FILES_${PN} = "${PDK_INSTALL_DIR_RECIPE}/packages/makefile"
-- 
1.9.1


