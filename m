Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1709EE00A4F; Mon,  8 Oct 2018 18:25:15 -0700 (PDT)
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
	*      [209.85.210.179 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C568E0097C
	for <meta-ti@yoctoproject.org>; Mon,  8 Oct 2018 18:25:14 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id l17-v6so4806814pff.2
	for <meta-ti@yoctoproject.org>; Mon, 08 Oct 2018 18:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HO76LQbO45D6MkNBAjhiW8FJECjYz62tjVuQkQajj70=;
	b=bpiYAalmpbXX2TYdbpcaCAHadOj4KopX8fHBfYFsljgrhW3id38/L+JQaQ8dvulZAs
	A0Q5f4nZ3s+RQIB05KlWf5MQCaHFNOR9WF6N7jEIHrC1csqgtc+cBl+aOMWxecul85eV
	Iw8TXzUsgb2FCbRg0/dXb5/n0arJI5eyF8dBg3loWrWSB+8LtdHrkZD6Xrb8cGeHdor2
	RtzNYWloOxXQUDJpc9cKM6F8sAUdFAeOQBx+Oiqhuhqpvu4ceRyndA8hOWcZHs+JUpF1
	N9ZkEfaSDw/ECEqFe8URgPe2x1YEZ2FAc6RPKBYBrdxFXh92Qzd/0H/Y6gS0BpNdfVN3
	mdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HO76LQbO45D6MkNBAjhiW8FJECjYz62tjVuQkQajj70=;
	b=U6qSMQL8qQq+SwobC2YN2YHpxEc/u5yrABtUGGJGHiHBd7t7c8tIaG5KDfyMO52Llo
	/xKCX++eeMo/Jl8HBZhwvH3THJtTtP5juRAt6Z/lOeGy7zOf64g9qmGldp2wSmLEFovA
	Y2NLmpNkeTjRuoNpdCgZ8rGHIAVQK7FbjOWv+SMAYyq5GilbHxWWSEE0VUD7fHGUyYg7
	s+KWR7iEEnr7a0sTMN8zGPtACw1GitLNVPrASLHUNAbQFXJeyGT8QM4ZZUsiibCHcqGC
	yprqwuaQBYVGpuX9vKmaY0zk7tW5HiPPDjLvdSmIZjKerjVDyx0ACwEQCGymJKz/vVp0
	7Q6g==
X-Gm-Message-State: ABuFfohVfSqhgV0aSHbgcUmCR+JC5dl9QwUOxrZ6rGVcst10xeC6oiKr
	fKb9M9gWE8vGKLafAdDsN/mmKwCx
X-Google-Smtp-Source: ACcGV602w9gjCUE1E567pb1W3dqWXuol5GjUxGiyKtuZlYHOtdAEh63EjtpZ+hZeTRqb+mfm5b6xaw==
X-Received: by 2002:a63:a612:: with SMTP id
	t18-v6mr18302629pge.338.1539048313217; 
	Mon, 08 Oct 2018 18:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	q25-v6sm31451369pfk.154.2018.10.08.18.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Oct 2018 18:25:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  8 Oct 2018 18:25:04 -0700
Message-Id: <20181009012504.22166-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCH] cm3-pm-firmware: Use ffreestanding in cflags
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
X-List-Received-Date: Tue, 09 Oct 2018 01:25:15 -0000
Content-Transfer-Encoding: 8bit

This helps it compile when we use hard-float ABI for linux
and want to build this standlone app using same toolchain for
cortex-m3 ( which does not have FPU )

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb   |  8 ++--
 .../files/0001-Use-ffreestanding.patch        | 39 +++++++++++++++++++
 2 files changed, 43 insertions(+), 4 deletions(-)
 create mode 100644 recipes-bsp/cm3-pm-firmware/files/0001-Use-ffreestanding.patch

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 1dcc021c..3572638d 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -9,14 +9,14 @@ PR = "r0"
 SRCREV = "7eb9c0856a9e8b3b42bf64f761da135852b8eea7"
 BRANCH ?= "ti-v4.1.y"
 
-SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/processor-firmware/ti-amx3-cm3-pm-firmware.git;protocol=git;branch=${BRANCH} \
+           file://0001-Use-ffreestanding.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-FLOATABI = "${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
-
 do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI} ${SECURITY_NOPIE_CFLAGS}"
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${SECURITY_NOPIE_CFLAGS}"
 }
 
 do_install() {
diff --git a/recipes-bsp/cm3-pm-firmware/files/0001-Use-ffreestanding.patch b/recipes-bsp/cm3-pm-firmware/files/0001-Use-ffreestanding.patch
new file mode 100644
index 00000000..701d2956
--- /dev/null
+++ b/recipes-bsp/cm3-pm-firmware/files/0001-Use-ffreestanding.patch
@@ -0,0 +1,39 @@
+From 8f19f63a6fa65ce0fc4de2162d6aaeb6a92fedd9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Oct 2018 18:15:13 -0700
+Subject: [PATCH] Use -ffreestanding
+
+When compiled using hosted toolchains e.g. default Linux targetted
+toolchains from OpenEmbedded, we need to ensure that none of hosted
+nature of toolchain is manifested and its compiled as a standalone
+baremetal application. In addition to using -nostdlib we also need to
+specify -ffreestanding so it does not include linux specific compiler
+headers etc.
+
+This means that the floating point config defaults of toolchain is not
+looking for platform specific headers e.g. gnu/stubs-soft.h or
+gnu/stubs-hard.h, since OE make it free choice to use hard-fp calling
+convention ABI choice, this change ensures it does not affect compiling
+this baremetal application
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f1c10ae..3fd9f23 100644
+--- a/Makefile
++++ b/Makefile
+@@ -13,7 +13,7 @@ SRCDIR = src
+ BINDIR = bin
+ 
+ INCLUDES = $(SRCDIR)/include
+-CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -Wall -Wundef \
++CFLAGS =-mcpu=cortex-m3 -mthumb -nostdlib -ffreestanding -Wall -Wundef \
+ 	-Werror-implicit-function-declaration -Wstrict-prototypes \
+ 	-Wdeclaration-after-statement -fno-delete-null-pointer-checks \
+ 	-Wempty-body -fno-strict-overflow  -g -I$(INCLUDES) -O2	-MD
+-- 
+2.19.1
+
-- 
2.19.1


