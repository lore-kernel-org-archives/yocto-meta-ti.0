Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10663E00B81; Wed, 17 Oct 2018 22:49:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C230E00AB3
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 22:49:57 -0700 (PDT)
Received: by mail-pf1-f193.google.com with SMTP id f26-v6so14341840pfn.9
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SieX3/m3dsrrTB9PipMNif4Eeh7mexlIAmIzjn6u2rw=;
	b=d9U4wkyE1nLrUpUDNE9zcFRu3HbURC+g1hJt52H1OoAGS+UjPFPY2PQg0p1vzUy5z7
	INEHOWK7BKg5zVRBseaFBjhbGhuyCXmIJVGLxFt9EMlk8ogPJWB/oZBrDuzVGAQZw9gE
	9YlWWlV8eyz+X9YLpTKBH5/0e3aT0Tfw2V2I/lkvifP+Yh0d60ULJ4wkhIp9vf7M4Guo
	zMT2949h6c/45UdmeZw6BC8XK439DgW1BtCcpPe8Q8NEiBteFe72iYNCyZ7IY1sPweRY
	rwaW2DQZlFRYcB9mq5mweFUwcLcufcwIaVwL1QQvSub49rgzRVDSe2lOvrvPWxTZr45W
	1+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SieX3/m3dsrrTB9PipMNif4Eeh7mexlIAmIzjn6u2rw=;
	b=H90IBPdqcXUu3S/rpqmEgnLn/G4t60Ii+e0AUv5ax4LfvQJSC+iqYRYZYtPw6R/YL6
	wLEC2o03xJdXoV8ISKFXfHJBbXNJoflg4cxdRnBGV8VsgSd894vAbwjQMFAg8+dIJqX8
	a8fRriyTBmMuXlQIJx/7zFy5VPYea3znwqn7+OyADzlQi0Oe45XVFepoDhYNrhbslV7x
	8DBDPCAmKB4Rc3TnPT9qi84WFjvWxWVA5eIKZReRkGs66gTUgpfO9dybJhqNrV+1i7rU
	OuqmV7hgmpOZeYOjD7hsfnmOSadAOT60k8hsAh0Mw4WGPn4+OHsxGhgANF8xG+Cs/iHT
	xNdg==
X-Gm-Message-State: ABuFfog1mmVqg2ChpRAqvyAW0rdLeIjqjKKQrg/+dtNmZZgjNz0AYztm
	UryPR87Au3VfCT7ZrCkws/uH8bVrQ2o=
X-Google-Smtp-Source: ACcGV60zhqsNfXrQFPdC0WdvYzey/4/HrNRa/LRRYjSWMe0zZucZ+l/zJ3FfIQCgHPNbJxOISsmETA==
X-Received: by 2002:a63:2584:: with SMTP id
	l126-v6mr191619pgl.382.1539841796630; 
	Wed, 17 Oct 2018 22:49:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::b111])
	by smtp.gmail.com with ESMTPSA id
	o76-v6sm36088274pfi.162.2018.10.17.22.49.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 Oct 2018 22:49:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Oct 2018 22:49:46 -0700
Message-Id: <20181018054946.22407-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH] u-boot: Alawys build with disabled PIE
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
X-List-Received-Date: Thu, 18 Oct 2018 05:49:58 -0000
Content-Transfer-Encoding: 8bit

some OE distros can default to hardened toolchains which means PIE is
added implicitly to compiler cmdline, here this options makes sure that
whattever the default toolchain are, u-boot is not impacted

Fixes errors e.g.

| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Tom Rini <trini@konsulko.com>
Cc: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Always-build-with-fno-PIE.patch      | 35 +++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2018.01.bb       |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch

diff --git a/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
new file mode 100644
index 00000000..dfd99c66
--- /dev/null
+++ b/recipes-bsp/u-boot/files/0001-Always-build-with-fno-PIE.patch
@@ -0,0 +1,35 @@
+From ec81bbe3ea7e077512f4b9d2b4aa87e7f1494bcc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 17 Oct 2018 22:32:57 -0700
+Subject: [PATCH] Always build with -fno-PIE
+
+GNU Toolchains can be configured to generate PIE by default
+while PIE could be ok, it is known that u-boot/SPL on ARM starts to
+generate bigger code and starts to overflow the SRAM size, therefore
+disabling PIE explcitly insulates against toolchain intrinsic defaults
+
+Fixes errors like
+| arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not fit in region `.sram'
+| arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 bytes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Tom Rini <trini@konsulko.com>
+---
+ Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile b/Makefile
+index 45cd751ba3..9eb8ac564e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -592,6 +592,7 @@ KBUILD_CFLAGS	+= -O2
+ endif
+ 
+ KBUILD_CFLAGS += $(call cc-option,-fno-stack-protector)
++KBUILD_CFLAGS += $(call cc-option,-fno-PIE)
+ KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks)
+ 
+ KBUILD_CFLAGS	+= -g
+-- 
+2.19.1
+
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index cbb8857a..c9c97111 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -5,3 +5,5 @@ PR = "r24"
 BRANCH = "ti-u-boot-2018.01"
 
 SRCREV = "2cc52408bf1357f11b96548e78223a1df321c1ae"
+
+SRC_URI += "file://0001-Always-build-with-fno-PIE.patch"
-- 
2.19.1


