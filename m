Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EEE5E017F9
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 20:53:34 -0800 (PST)
Received: by mail-pa0-f45.google.com with SMTP id kp14so40411pab.32
	for <meta-ti@yoctoproject.org>; Wed, 06 Nov 2013 20:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=MYRKDmhK3MjaU8I+El30V/oeVzlTUh4pRGTvbfsa3y8=;
	b=Y6ccw6AbEFrp/1pNxb2W3SiGcoHyMBF44x37/t13grgKk7N8yfBhwkdDq5Pu73nBGG
	dqksIY+LPXNQOGIeVwNDRFyAZIevYhcnITkKQdMd49JTSXsIsGIxAETPXc11MRjjEatP
	ng9cBJQTQTTz7dqh3R63H78RNzmZzoX3D6owEhWMoLYJBEbNGuqre+0J2OxR4iBwoNOp
	plcFnJxmyZFO+upXy0LmRb/B4A9j3kSFlYAz0nZgroGmPM7yn3lIeWcgR8HaDl8vO2LJ
	5X7VzUbRbQjoZvJJqfQfGVw5ZpEc6nPQitSUlBwp2jSc1ED29ZA6K0ksbwxyyf2eT4lk
	tZhw==
X-Received: by 10.66.152.11 with SMTP id uu11mr7619629pab.124.1383800014455;
	Wed, 06 Nov 2013 20:53:34 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	sy10sm2866299pac.15.2013.11.06.20.53.33 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 20:53:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Nov 2013 20:52:48 -0800
Message-Id: <1383799968-18869-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] omap3-sgx-modules: Enable is only for relevant machines
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
X-List-Received-Date: Thu, 07 Nov 2013 04:53:37 -0000

When layers is parsed in multi-bsp layer distros and
a non-omap/non-arm machine is used this causes parse
failures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 31c7d4e..79b73cb 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -10,6 +10,13 @@ BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
 
 inherit module
 
+COMPATIBLE_HOST_omap3 = ".*"
+COMPATIBLE_HOST_omap4 = ".*"
+COMPATIBLE_HOST_ti814x = ".*"
+COMPATIBLE_HOST_ti816x = ".*"
+COMPATIBLE_HOST_ti33x = ".*"
+COMPATIBLE_HOST ?= "(none)"
+
 MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-- 
1.8.3.2


