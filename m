Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 116A0E0141F
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:13 -0700 (PDT)
Received: by mail-wi0-f182.google.com with SMTP id hm4so182590wib.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=vkk8S3Fk/YSiUuv29VHZzHvG0t82/+kjG/IFblob1iw=;
	b=cjHwhBDx/25u7YfGSE9i1yXwqtL1Muc273dwf+cDjpB2WLmdx9brz/BKKV5BldBRfY
	FM4aA6Bl5kXW1TlO+os7cg1Ee0NZJpFHuZfek7YHkrei4D2UhU0VTVJ1Z2UAZlWFSYgq
	saPDzVXM+sGKotF4DP98oaBfOj+0pY6LBm/s24Ex2u3ekmAOZgdd7UZ8xF7V86euD7rX
	3lrKq1XSra+q33hHbVupVbMGLmQmicuDCI/0JtjFKpXSCWjn/YLThE/+R3qWwm7mPo7u
	jP6+GDuQaxSp46EUsg51J1b3UfdK/mUvt6jdPdSKhOrhNbQOOPLduXjWd+qWGRmEvbeR
	LQEw==
Received: by 10.180.101.103 with SMTP id ff7mr7600504wib.6.1336640413759;
	Thu, 10 May 2012 02:00:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id b3sm1955846wib.4.2012.05.10.02.00.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 02:00:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:32 +0200
Message-Id: <1336640375-20418-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm8AVU1IbK5xdr7gcVEda3JtsRvVCNqbW+J7G0VOLA0WVY12TuMufAzluPaHM0nxOPeMYUM
Cc: denys@ti.com
Subject: [PATCH v3 10/13] linux-ti335x-psp 3.2: switch to userspace governor for beaglebone, ondemand seems to cause problems on a small percentage of boards
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 10 May 2012 09:00:14 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    4 ++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb                   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c5e447f..315b658 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -481,8 +481,8 @@ CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_STAT_DETAILS=y
 # CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
-# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
-CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
+CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
+# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
 # CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
 CONFIG_CPU_FREQ_GOV_POWERSAVE=y
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index de3129d..458248e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.10


