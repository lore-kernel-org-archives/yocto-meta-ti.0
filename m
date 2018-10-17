Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4EED4E00C37; Wed, 17 Oct 2018 12:29:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.210.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88D4AE00BE8
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:09 -0700 (PDT)
Received: by mail-pf1-f194.google.com with SMTP id j23-v6so13668329pfi.4
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nfIxzvH8Fm90dXMfVHUw+aGqOulLB2h9PIDnqDKGL+A=;
	b=KyxBcwmxamrMZ0Z6xl06Mq5x8eEv8ykrELQRVudX0ofcX0gp0ANELn2FyhbZh4HIGp
	Zb7eh6HoCS0l6bY/JEyE+dM9EnRZIodO5ktqd44+ad99HLE6zvxtFQfZULxxshmTaFjh
	5lEeKYHhU0B2BSCfkIwiP654mcEa8s98SJ2/ZTsZ+yU3IrV78DsXfW+Z83/fHA8oFhvW
	z5tzxMzLkH7onP7Yy0wIJGj3o7tG8f4M5XlsELNj4cv7V27PR2bOSEL3WoZTWMAA466c
	p9dkiHkYhK2RShnQrgA8PQfq8QJSdkmws+D+92h6MvW4L6Ce2ErFGn6fD7RgqF2BkOnu
	6SGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nfIxzvH8Fm90dXMfVHUw+aGqOulLB2h9PIDnqDKGL+A=;
	b=O4vF/n0hMOFxM9wQprB3URFpgk0sofr7SSsM7XxQH7zaMzg/vTGkXwHUsXxIMUq4Xs
	DVgaLfAUkDVysq5HrMK2fE9qyRBJTybj/It0/BBOMrQQqhHmxbhbUeg4KyBsQsJw++wW
	TLsyGXJIOf65tUk0g68svAz0HC48Q8yoJm6IkShJ+6LP8yFB32CfK7oKFZa8DYXMyXUh
	Oq42juFieq6opxNUfsEURyaUk/LKsCXE8w/Ev7UDDCu5S54xz9JJkGhmU997P7jCierG
	6KkG97h1oymxIVqjIlz3Kdo/FvKbYjRNkoP05Tl2QYIq9SvB00ImZax9JC0yhVGeZmJI
	AlQA==
X-Gm-Message-State: ABuFfogUGn5l/eZ2xxGW5bqdcjnVhZcuDCcNCyGHOnw9THldirBaHpZn
	/mQfMNT+MtU7I830OCMuTvOdXzbNN2k=
X-Google-Smtp-Source: ACcGV60ZZwrNeMZnNSQk1yuf2ZF9egcqlZh9DF4a4RDfTN3xtckiCoxMLgThsuD37JL6QpgxzrkZyQ==
X-Received: by 2002:a62:1c06:: with SMTP id
	c6-v6mr28018152pfc.41.1539804548806; 
	Wed, 17 Oct 2018 12:29:08 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	j3-v6sm18044151pfn.175.2018.10.17.12.29.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 12:29:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 12:28:52 -0700
Message-Id: <20181017192853.42942-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181017192853.42942-1-raj.khem@gmail.com>
References: <20181017192853.42942-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] beaglebone.conf: Package kernel and devicetree
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
X-List-Received-Date: Wed, 17 Oct 2018 19:29:17 -0000
Content-Transfer-Encoding: 8bit

Use variables from upstream u-boot, makes it easy to switch to
mainline u-boot from oe-core if someone wants to

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/beaglebone.conf | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 25147926..9b656d01 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@NAME: BeagleBone machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
+#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
 require conf/machine/include/ti33x.inc
 
@@ -17,10 +17,16 @@ SERIAL_CONSOLE = "115200 ttyS0"
 #UBOOT_MACHINE = "am335x_boneblack_config"
 
 WKS_FILE = "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} MLO"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
 
 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "bbbAM335x"
+
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
+IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
-- 
2.19.1


