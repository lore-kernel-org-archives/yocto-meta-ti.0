Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B208E00BDC; Wed, 17 Oct 2018 12:29:08 -0700 (PDT)
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
	*      [209.85.210.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E238DE00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
Received: by mail-pf1-f194.google.com with SMTP id c25-v6so13671625pfe.6
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cDdoQI61O+tIrdZnpIl4tDqvmhR2v39f8eSFqOsjdkI=;
	b=kJdMhqMN+Sh6EImstEKJvgY+f28bVDfWJYJ/KPcDWnt8kOP9MNvRwz4vZPBZ40GUno
	9LAHxVF30/3LQ73O3BN87sS5xM4OUQ+/xjs3b8JVzA+skIql9Ik0drmnPRVrMM9Xd6T1
	YbhElM0wP52+XZ8eOiHy2urGt9h/64PxZVaUL+n+1BQWUge8RzxsR4y0H4cCezfLv6IL
	4mV9fXzXj5YLcyOjwlLLhU+AGeNdChI3Di96nprZBLMNQyCAlA4Ny0dglcS/H0tlw7su
	bf4u6w17FDoNdqBOA8WppQI8hwAB2xA5NT/jTbkCGJU1q4hk4CKEMpe1KlB5nWtwLQ4+
	tVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=cDdoQI61O+tIrdZnpIl4tDqvmhR2v39f8eSFqOsjdkI=;
	b=I3h9Nae4Cv6jdoUKz4frFw0UOLxuHLNLkjSZY4hX3hgCR/eVBC0CUFXNEe1i3D+KGh
	VxqfyI6eg9stpqUnnUSDw2jEx4Q9i1pUohOKjFAUIpEQKIc8aNChv8LflNhpLVjxg74X
	qhBqEJcBsUWRVntbsN7UBn81Iacp2uvMH6raQ6qdEIgETur6nISQJkJaXYe5tf+hEi6s
	Jc7tQQM0Ri12ACP//HiW2vN9nLpc0lQ1DG7nudKDGcXUlQiZX70ec1+cTeHKCTPwuC/v
	BnVEJ7EH40xpOkw9wQnEs1+YqoeWdD3kOA5INM7Es9Pz4Nj1xZFxi8T063fN8g8dwNUz
	yqOA==
X-Gm-Message-State: ABuFfoh1UFNQNd6V8r6YqTsfFWMkuKkE97bGuC7cyM9ZS7RbhM5YPhL9
	1O0yrZMNfhyAVqc+v1tmPwkcnmMuDnc=
X-Google-Smtp-Source: ACcGV60vfPPcK68szSX8NA59rLyknvjbySfZd9mS9BGAqGr9h0eXvT7M0mtCcRCqJw0dZGiFDpOKlQ==
X-Received: by 2002:a63:745e:: with SMTP id
	e30-v6mr25727548pgn.446.1539804547023; 
	Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	j3-v6sm18044151pfn.175.2018.10.17.12.29.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 12:29:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 12:28:51 -0700
Message-Id: <20181017192853.42942-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181017192853.42942-1-raj.khem@gmail.com>
References: <20181017192853.42942-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH 3/5] u-boot: reduce the SPL `.rodata' size
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
X-List-Received-Date: Wed, 17 Oct 2018 19:29:08 -0000
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


