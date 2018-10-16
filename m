Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 27273E00B6C; Tue, 16 Oct 2018 00:47:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.210.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5FF71E00AC5
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
Received: by mail-pf1-f193.google.com with SMTP id p24-v6so11014720pff.10
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7JRChs/+s2sYDplALuy/M6Pn6eOuiSnETKfMXx7fdiA=;
	b=Yc1IX5SlbKUq06mrmIFBJebw8hinqm71Rw5DrzQkVmvcaNrQCNe6xdxugwE8paZeRj
	m56T9u9z04NDZM1nGgYWMK1PHWk7lNsGAk5MCm+Dc1OJMGvk8tAjGfvgP+b7MMfIDrOq
	1qeYLEvuXv2Y+sRBv85C9QOLn2h5CooAMlDiSbL1vSdukgS5rnyxTHIo1IujAr5sA94w
	glV3Q4BSZ9A0lQWnq1UEeD1uhdtdicQFTQWcyZUKReBgc6L3Y2f53KqOw/ZaV8zt0kV7
	uAgpmr/iz/1j5gaDmC2sJDVcPHOMdRxpstbOwJgrATeo3lSxGDdN15xauZ/P7Btau2Q9
	XfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7JRChs/+s2sYDplALuy/M6Pn6eOuiSnETKfMXx7fdiA=;
	b=nyk2oTsSg6ZyhWQZ8+v7X/uKRYfcxLUxTIxFcT3+v/Ux0pe3jFblt8Mx15dd7EgLfn
	bARsr87T99TqwmWFtF1b6nDaw/SIvD2m7eeSVPEqYEa4UZh8C4u4hGzEAGxvG4OGgJlg
	pbmyF7juRh/NCrn0eKx8nvAukFn1Qzvb3C5BbSbq96ef5goRXCdBXyACULBfFVHdVdO+
	cRsU1kwA7VaYRuZtBzRvvgasgAR+jJb9nW5saxsdZ8wK4ZfSVDLPT/6b1HHxV6h9XQ8S
	1k7ZxcteOog+fOmEAfHwe68okig/xHdcdxZRBAn0b2Up5z0xyWYcUTguyUM+QLQWA5c5
	fFKw==
X-Gm-Message-State: ABuFfohx6hQQTh+n9/sBrfa2rS/BAYOCojuPDX4alYcrYMGDoWrXTF57
	MwxFShgjxG8Vr4LSnHqzYTRWigcP
X-Google-Smtp-Source: ACcGV639xUxvuBSa2jryqAEM/CImV8xLT++4dMH21nkxFL1el2NSjHYWSNrSfdR+zfoanFIsOJbkJQ==
X-Received: by 2002:a62:104b:: with SMTP id
	y72-v6mr21109713pfi.113.1539676073209; 
	Tue, 16 Oct 2018 00:47:53 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	r65-v6sm17887282pfj.5.2018.10.16.00.47.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 00:47:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 16 Oct 2018 00:47:43 -0700
Message-Id: <20181016074745.39972-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH 1/3] u-boot: reduce the SPL `.rodata' size
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
X-List-Received-Date: Tue, 16 Oct 2018 07:47:55 -0000
Content-Transfer-Encoding: 8bit

Fixes errors e.g.

| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
fit in region `.sram'
| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 73 +++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 +
 2 files changed, 75 insertions(+)
 create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch

diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
new file mode 100644
index 00000000..47597b28
--- /dev/null
+++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
@@ -0,0 +1,73 @@
+From 56dce6462e60e2aa5b87c97c5a2c43a4d834e251 Mon Sep 17 00:00:00 2001
+From: "Kemal R. Shakir" <kemal@ti.com>
+Date: Wed, 3 Oct 2018 15:56:37 +0300
+Subject: [PATCH 1/1] am335x_evm_defconfig: Reduce SPL `.rodata' size
+
+---
+ configs/am335x_evm_defconfig | 54 ++++++++++++++++++++++++++++++++++++
+ 1 file changed, 54 insertions(+)
+
+diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
+index 4908099431..568a4f535e 100644
+--- a/configs/am335x_evm_defconfig
++++ b/configs/am335x_evm_defconfig
+@@ -63,3 +63,57 @@ CONFIG_DYNAMIC_CRC_TABLE=y
+ CONFIG_SPL_TINY_MEMSET=y
+ CONFIG_RSA=y
+ CONFIG_LZO=y
++
++#
++# SPL / TPL
++#
++CONFIG_SUPPORT_SPL=y
++CONFIG_SPL=y
++CONFIG_SPL_BOARD_INIT=y
++# CONFIG_SPL_BOOTROM_SUPPORT is not set
++CONFIG_SPL_RAW_IMAGE_SUPPORT=y
++CONFIG_SPL_LEGACY_IMAGE_SUPPORT=y
++CONFIG_SPL_SYS_MALLOC_SIMPLE=y
++# CONFIG_TPL_SYS_MALLOC_SIMPLE is not set
++CONFIG_SPL_STACK_R=y
++CONFIG_SPL_STACK_R_MALLOC_SIMPLE_LEN=0x100000
++CONFIG_SPL_SEPARATE_BSS=y
++# CONFIG_SPL_DISPLAY_PRINT is not set
++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_SECTOR=y
++CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR=0x300
++# CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_USE_PARTITION is not set
++# CONFIG_SPL_CRC32_SUPPORT is not set
++# CONFIG_SPL_MD5_SUPPORT is not set
++# CONFIG_SPL_SHA1_SUPPORT is not set
++# CONFIG_SPL_SHA256_SUPPORT is not set
++# CONFIG_SPL_FIT_IMAGE_TINY is not set
++# CONFIG_SPL_CPU_SUPPORT is not set
++# CONFIG_SPL_CRYPTO_SUPPORT is not set
++# CONFIG_SPL_HASH_SUPPORT is not set
++# CONFIG_SPL_DMA_SUPPORT is not set
++# CONFIG_SPL_ENV_SUPPORT is not set
++CONFIG_SPL_EXT_SUPPORT=y
++# CONFIG_SPL_FPGA_SUPPORT is not set
++CONFIG_SPL_I2C_SUPPORT=y
++# CONFIG_SPL_MMC_WRITE is not set
++# CONFIG_SPL_MPC8XXX_INIT_DDR_SUPPORT is not set
++CONFIG_SPL_MTD_SUPPORT=y
++CONFIG_SPL_MUSB_NEW_SUPPORT=y
++CONFIG_SPL_NET_SUPPORT=y
++CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
++# CONFIG_SPL_NO_CPU_SUPPORT is not set
++# CONFIG_SPL_NOR_SUPPORT is not set
++# CONFIG_SPL_XIP_SUPPORT is not set
++# CONFIG_SPL_ONENAND_SUPPORT is not set
++CONFIG_SPL_OS_BOOT=y
++# CONFIG_SPL_PCI_SUPPORT is not set
++# CONFIG_SPL_PCH_SUPPORT is not set
++# CONFIG_SPL_POST_MEM_SUPPORT is not set
++CONFIG_SPL_POWER_SUPPORT=y
++# CONFIG_SPL_RAM_SUPPORT is not set
++# CONFIG_SPL_RTC_SUPPORT is not set
++# CONFIG_SPL_SATA_SUPPORT is not set
++# CONFIG_SPL_THERMAL is not set
++# CONFIG_SPL_USB_HOST_SUPPORT is not set
++# CONFIG_SPL_USB_GADGET_SUPPORT is not set
++# CONFIG_SPL_YMODEM_SUPPORT is not set
+--
+2.17.1
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index cbb8857a..46a26480 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -5,3 +5,5 @@ PR = "r24"
 BRANCH = "ti-u-boot-2018.01"
 
 SRCREV = "2cc52408bf1357f11b96548e78223a1df321c1ae"
+
+SRC_URI += "file://0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch"
-- 
2.19.1


