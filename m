Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C85FE00BBF; Tue, 16 Oct 2018 17:21:28 -0700 (PDT)
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
	*      [209.85.214.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B584CE0095C
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 17:21:27 -0700 (PDT)
Received: by mail-pl1-f194.google.com with SMTP id y11-v6so11779913plt.3
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cDdoQI61O+tIrdZnpIl4tDqvmhR2v39f8eSFqOsjdkI=;
	b=rCglghIj9V9jP+h5KmU/U9J93ce14g6f/sC7fTexTQs1kwf6AjSGoKIZXq9X3O9fX1
	pyfxvHKE1mtG7Cky3cBKuFpDh5rrIVRFjShXKCGKr5K24i3BzwQ3ct+gNSXigO5ith1o
	gp3tBcYxi/Ne9/57sdu0D0Ew9+dCSEfRhmUEGLv6WHdaywB4XQ/KBb3vc3Xw+mrvOl4d
	Hd1uytQFMH0Lr3sJMxK3qiDZZ/zpuF4z0Dc0nnQvmEyy+CLIUXPTyvWLe9r4Lx+evvtq
	MOLweTb/OQTkStX+OTpcadU7Bd7ewg9gkHsLL550Btqbq+3K4fbR5ijk5WwqXlYnMopj
	5y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cDdoQI61O+tIrdZnpIl4tDqvmhR2v39f8eSFqOsjdkI=;
	b=DYrx7InaF9Q73IYiwBHFCzt9iHTfSggy6jt49mfpMHTBjywwRFWaNylUfdjUOXprvC
	n2fLtqzQCfoKas4XsYDBPRE4U6to3fd2kQpDit6U3Cwnq0X0JfXPYOz2PwI7Sg8qsO6e
	eatEYGXwX61ROOs1b2vmMce+5uHI3BaEGwt9qnH/svDVL/Eq+w2oZYai7//IPqC1/A0P
	RW3E5DkpgnZLcqmm0KyJOAVz4zi+DtMdnWmyGIzozuRvEa3iwcrFshqr24nPm4L1kSeG
	yE4TJ1fp6Mx2i9DwXJDbXvXeSKBg0kONTQv5d5NlE5ogmj1ukgsxf+ia9eXhP2obSZgY
	B6kA==
X-Gm-Message-State: ABuFfojqkTaw+1thT7mp4SeGQL3D+RU6fdZ43cEcKZ+VsSxNX1Sna8KX
	h0ZnOuQBlk0OAVndjbUdXM1OQrDf/MA=
X-Google-Smtp-Source: ACcGV60vbCCgkfKFdL2pXOLeReAaWOFNiXp9mniii/F8n8ErNX/H37FDAvv5iyZAt8Xgnwg7cWG7Ww==
X-Received: by 2002:a17:902:8502:: with SMTP id
	bj2-v6mr23389984plb.295.1539735686751; 
	Tue, 16 Oct 2018 17:21:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	e19-v6sm21764612pfb.153.2018.10.16.17.21.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 17:21:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 16 Oct 2018 17:21:10 -0700
Message-Id: <20181017002110.8438-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH V2] u-boot: reduce the SPL `.rodata' size
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
X-List-Received-Date: Wed, 17 Oct 2018 00:21:28 -0000
Content-Transfer-Encoding: 8bit

Fixes errors e.g.

| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Denys Dmytriyenko <trini@konsulko.com>
---
 ...vm_defconfig-Reduce-SPL-.rodata-size.patch | 36 +++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
 2 files changed, 38 insertions(+)
 create mode 100644 recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch

diff --git a/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
new file mode 100644
index 00000000..6244a56a
--- /dev/null
+++ b/recipes-bsp/u-boot/files/0001-am335x_evm_defconfig-Reduce-SPL-.rodata-size.patch
@@ -0,0 +1,36 @@
+From 45ead566ebf63999f07e966fa4962bb9bbe3ed4a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 Oct 2018 17:11:13 -0700
+Subject: [PATCH] Disable usb-gadget usb-eth support in SPL
+
+This helps in shedding some size to fit in into SRAM
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configs/am335x_evm_defconfig | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/configs/am335x_evm_defconfig b/configs/am335x_evm_defconfig
+index 4908099431..8342089dee 100644
+--- a/configs/am335x_evm_defconfig
++++ b/configs/am335x_evm_defconfig
+@@ -12,14 +12,13 @@ CONFIG_SYS_CONSOLE_INFO_QUIET=y
+ CONFIG_VERSION_VARIABLE=y
+ CONFIG_ARCH_MISC_INIT=y
+ CONFIG_SPL=y
+-CONFIG_SPL_ETH_SUPPORT=y
++# CONFIG_SPL_ENV_SUPPORT is not set
+ CONFIG_SPL_MTD_SUPPORT=y
+ CONFIG_SPL_MUSB_NEW_SUPPORT=y
+ CONFIG_SPL_NET_SUPPORT=y
+ CONFIG_SPL_NET_VCI_STRING="AM335x U-Boot SPL"
+ CONFIG_SPL_OS_BOOT=y
+-CONFIG_SPL_USB_GADGET_SUPPORT=y
+-CONFIG_SPL_USBETH_SUPPORT=y
++# CONFIG_SPL_YMODEM_SUPPORT is not set
+ CONFIG_FASTBOOT=y
+ CONFIG_CMD_SPL=y
+ CONFIG_CMD_SPL_NAND_OFS=0x00080000
+-- 
+2.19.1
+
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


