Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1ED0DE00B45; Tue, 16 Oct 2018 00:47:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.214.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 703A8E00AC5
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:47:55 -0700 (PDT)
Received: by mail-pl1-f195.google.com with SMTP id f8-v6so10609418plb.2
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 00:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nzQyaRjTPkn65BvKEhHqtW6OzhAnBwCgAZRcFTKgX5M=;
	b=GDRovDM2MiYv7CScsw+jA0XLL2eM15KoGNxxBqUWfVAEmCTxMVVx2EYXjVRIQJC6LE
	x/WWUCWLHw0asV/DSajxsUs7VQ/C175G8QrsBhK5/fS08RSEg8Goly0DLhXXosD2y7bp
	MwmV9t3IKsLQDKWSzvi08qBcCM4fME3RmRhLuHwdsi5TzB7UGw25DGMWi1/y4+/PftiJ
	s0Dr8qyGq6HJofxnQZJeojPyeD+6x4DbTyEPQnjiNnCQJ7nEXVFX7EsdzT44HiySdU2K
	Cjg8yuQQOLU9lUg3X+WMbrLaSdMC/eT7h2xEV4ijE3f/84g0MBccgTivfjmp5BueSxY9
	RK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=nzQyaRjTPkn65BvKEhHqtW6OzhAnBwCgAZRcFTKgX5M=;
	b=CzSaZBR6f5vXSNSI2F5tie7HtL+lT3KgfyP3pHglN52L5nR73TsHa6fw+1CX3hDbip
	JSuvRl7ephU9aTKJdCwYTWkVu5k7McamxQ9VIbCMvSiVTg6AZecpryQc7trpXsiV3kB1
	05ceuwfVx6wcWWRAR+clREQEH6VsunDKsLNZajAq3wTAItOr8Wn0iwLvFQrdM2RNWkIM
	MMpU0zxSWVVYISxwYZ2z18XqDT8JUyyk8T/B7WWNk0govjWSnRDZwr2/8xruO2q36G+r
	aDXRlB5uFAVceODjODe5qIqLtSeNFf4GOHgxBlY/HR9m/pzzDN3fcS+Qg/pkQgzlDiQv
	N2Bg==
X-Gm-Message-State: ABuFfogNbRXoTCCJgVvM39stpP3raghLvzZ1eAztpbbFDUHcORfwygUj
	E6ULglqEQ6SEtcbZ36wae54/UkYw
X-Google-Smtp-Source: ACcGV62fEWIpAkSQuHVhZGCDOc0fYqKMmjD6uJXoDKyb+h96dlTBXQJSZyeEOkAFEmC1SWXdec/lWQ==
X-Received: by 2002:a17:902:2:: with SMTP id
	2-v6mr20839228pla.178.1539676074729; 
	Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	r65-v6sm17887282pfj.5.2018.10.16.00.47.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 00:47:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 16 Oct 2018 00:47:45 -0700
Message-Id: <20181016074745.39972-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181016074745.39972-1-raj.khem@gmail.com>
References: <20181016074745.39972-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] beaglebone.conf: Use beaglebone sample wic template
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
X-List-Received-Date: Tue, 16 Oct 2018 07:47:56 -0000
Content-Transfer-Encoding: 8bit

Add kernel and devicetree files to image install

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/machine/beaglebone.conf | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 25147926..a9383c5a 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@NAME: BeagleBone machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
+#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
 require conf/machine/include/ti33x.inc
 
@@ -16,11 +16,17 @@ SERIAL_CONSOLE = "115200 ttyS0"
 # fall back on generic am335x_evm_config for now
 #UBOOT_MACHINE = "am335x_boneblack_config"
 
-WKS_FILE = "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
+WKS_FILE = "beaglebone.wks"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
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
-- 
2.19.1


