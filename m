Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 67DD0E00843; Sun, 21 Sep 2014 00:02:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 410B1E0073E
	for <meta-ti@yoctoproject.org>; Sun, 21 Sep 2014 00:02:29 -0700 (PDT)
Received: by mail-pa0-f46.google.com with SMTP id kx10so2607938pab.33
	for <meta-ti@yoctoproject.org>; Sun, 21 Sep 2014 00:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=ig6KMNKP2KzmWdDh51a50rI8yXNw0U3HZq6gq+ZjL/4=;
	b=ZiD8Cbry1Rdo0LceyWSKlO+XrAgbeLwKG+QZpNG4YSPje6BqnApw8zlH3AFFZUPBZx
	gB02UY7E3Zcm+3xYPK1gRzbcs3Qr9uMFPF0vtE8J/KaA9NSviGLfy19+BXC/7yx3siJB
	U3xL69aokbsNxLlQsY1yEGk5PJoakYfXc3ZwPhN4rE0nOkPOkxYmawxkv5cRkHecEnyd
	4J2V6Iy7jXfiM7/lAaIDNbIY0Pu4V43+7wBENQHZnvSy09bOyZE5maRd6/OWTyJnv8j1
	Ty7fCF5KWgHux4Nx/ozWUZ75oVLCslWStGyO0y5TzcCDcmNfbehUHA98DoAZlw+9BQqj
	4xUA==
X-Received: by 10.66.221.163 with SMTP id qf3mr15459411pac.37.1411282949305;
	Sun, 21 Sep 2014 00:02:29 -0700 (PDT)
Received: from haswell.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218])
	by mx.google.com with ESMTPSA id ra8sm6118935pab.9.2014.09.21.00.02.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Sep 2014 00:02:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun, 21 Sep 2014 00:05:38 -0700
Message-Id: <1411283138-9267-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] am33x-cm3: Add TOOLCHAIN_OPTIONS to redefined CC
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
X-List-Received-Date: Sun, 21 Sep 2014 07:02:31 -0000

This error will show up when using sstate which was generated
using a different buiid time sysroot. Since we override CC we
still need to honor --sysroot which is specified via TOOLCHAIN_OPTIONS

Fixes

| DEBUG: Executing shell function do_compile
|      CC       src/sys_exec/sys_init.o
| In file included from src/sys_exec/rsc_table.h:13:0,
|                  from src/sys_exec/sys_init.c:19:
|
/home/ubuntu/work/angstrom/build/tmp-angstrom_next-glibc/sysroots/x86_64-linux/usr/lib/arm-angstrom-linux-gnueabi/gcc/arm-angstrom-linux-gnueabi/4.9.2/include/stdint.h:9:26:
fatal error: stdint.h: No such file or directory
|  # include_next <stdint.h>
|                           ^
| compilation terminated.
| make: *** [src/sys_exec/sys_init.o] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/am33x-cm3/am33x-cm3_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
index e5728ab..0b0a776 100644
--- a/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
+++ b/recipes-bsp/am33x-cm3/am33x-cm3_git.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
 
 do_compile() {
-	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}"
+	make CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS} ${FLOATABI}"
 }
 
 do_install() {
-- 
2.1.0


