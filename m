Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 811F7E00B9F; Fri, 12 Oct 2018 18:57:31 -0700 (PDT)
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
	*      [209.85.210.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79C52E00B93
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 18:57:30 -0700 (PDT)
Received: by mail-pf1-f196.google.com with SMTP id l17-v6so7033504pff.2
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 18:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Ym3oLCz6TkOdy1PoYdi7NAWtyHXTVJZ8+oESxAAINCk=;
	b=LORKn+8JPZCiwIZvDQBL9TqqMg7IOCti27bHeWv0qX9jhAJNPTChTBVwYzHOP/yRYq
	sGccAWfQ/bKvn5mSXxskZhXit9QOApC7ADNMcnaw54IkUYyYCSHV/hnlwy4fE5n3aOUq
	hIoKBZWZqdpdL/ilGzuzu8yWRQxA1FjCxAPZ+fMLIwLD7B0XLxd3m5QxTEqgzVeJWYpN
	GiQmUt6Nkp06GUfAp52zQMWQNBi7chnKLfq65gYJuhCi7SqQ536isCLgE50JN9hkRgXd
	uHus31jTKk595gmw8OR3RoEfOGcKr/876m1Gk85KXddx7a8dtdjTOoT+mEV4t/Alaj1x
	fmlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Ym3oLCz6TkOdy1PoYdi7NAWtyHXTVJZ8+oESxAAINCk=;
	b=laPrdzLxhMWTCp2Ku9kuJSLD5ZaTwqdMWy9k3DnJxlXWtgEDmM1SB9nn0Ecj62AH4l
	A4F0T7x3Bl0PSSmwORvloPZpwxqqhmmhgN3qPZvVAh29b0p4jZ++TdS/6RV6JAwsQSXC
	Rs43xSI3GMkMriztINJAwMUXd3PMYEjDoweaDoyBsW4ZTfxsRFdvIifUZYbI0xePUKjj
	sBZLR/U0y1wkRVTXmS4JZaZLNutv6Tj2+3faUFhaLE3RJU1Cop/VoeCccK0K3+nmF2lr
	Sw7MKrwkOyGmboocy5gx4pJBagf/oqKtChQBZAlaIKLGTHoq3v7GOnOqr6g6xfl0E84H
	DN4A==
X-Gm-Message-State: ABuFfohCcWs6/cUos/mBj6t6HjY4rDAXRz0J9/qBkmATBSSjKiUdOheu
	1nqWdo6HEmZD3o5Co1iVSKM+ZJ7u
X-Google-Smtp-Source: ACcGV61c5sb+oTUPgQKp+gFPjpb96RrgOfnunqoXajTZK5OREGJcrs5nZxtduA654vnyFiNDR1XtVg==
X-Received: by 2002:a62:5547:: with SMTP id
	j68-v6mr8453728pfb.166.1539395849641; 
	Fri, 12 Oct 2018 18:57:29 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::939f])
	by smtp.gmail.com with ESMTPSA id
	i5-v6sm3456319pfo.107.2018.10.12.18.57.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Oct 2018 18:57:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2018 18:57:21 -0700
Message-Id: <20181013015721.33162-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181013015721.33162-1-raj.khem@gmail.com>
References: <20181013015721.33162-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] beaglebone.conf: Switch u-boot provider to mainline from oe-core
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
X-List-Received-Date: Sat, 13 Oct 2018 01:57:31 -0000
Content-Transfer-Encoding: 8bit

use beaglebone specific wic template

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/beaglebone.conf | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 49edfd61..25b9998a 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@NAME: BeagleBone machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
+#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
 require conf/machine/include/ti33x.inc
 
@@ -11,15 +11,25 @@ KERNEL_DEVICETREE = "am335x-bone.dtb am335x-boneblue.dtb \
 # Only has DVI connector for external screen
 MACHINE_GUI_CLASS = "bigscreen"
 
-SERIAL_CONSOLE = "115200 ttyS0"
+SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
 
 UBOOT_MACHINE = "am335x_boneblack_config"
 
-WKS_FILE = "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
+WKS_FILE = "beaglebone.wks"
 
-do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO zImage am335x-bone.dtb am335x-boneblack.dtb am335x-bonegreen.dtb"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
 
 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "bbbAM335x"
+
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
+IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
+do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_u-boot = "u-boot"
+
-- 
2.19.1


