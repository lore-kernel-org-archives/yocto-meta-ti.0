Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF137E01363
	for <meta-ti@yoctoproject.org>; Mon,  7 May 2012 09:01:18 -0700 (PDT)
Received: by mail-we0-f176.google.com with SMTP id c1so1802793wer.35
	for <meta-ti@yoctoproject.org>; Mon, 07 May 2012 09:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=vkk8S3Fk/YSiUuv29VHZzHvG0t82/+kjG/IFblob1iw=;
	b=gsVY8oVesfD77Rp9qdK+2ZN8QB/A1UuPDyaqYlV16ClJNwoRscPCNXSeVJKt9852N3
	ZulyqDM3CB27nqldA65mebl2sbYkYUW3OneloQ8solW8idg6lRPZGgpI4BGX9yVv8m0T
	jAwCRC72ifUHM3oOTyhZnUI1e3ooCqurR5n9o/fym+uP0po0gcsPaGD4QcElMSRbgFpC
	V/ZX6hveRgWIx288IyEMm9Y5xiEpEFkEPQFy6CPrzIyWvnqQa+PjBm9DNPeFbb0pw2HK
	p04EvszIHSGxizmaDugRs9nJHzJjQF3IALpa3b9j1ZHCEqsyERPHTkk1Q4SoF/qX64s7
	gYqw==
Received: by 10.180.101.230 with SMTP id fj6mr36651957wib.13.1336406477643;
	Mon, 07 May 2012 09:01:17 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bn9sm5448476wib.5.2012.05.07.09.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 09:01:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  7 May 2012 18:00:51 +0200
Message-Id: <1336406451-5345-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336406451-5345-1-git-send-email-koen@dominion.thruhere.net>
References: <1336406451-5345-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn5jbVHcVNhfEpXXZP+XaHRUV7496O/oaUp3VjzvS6T168IVll8Hlz2S1OFTjTd/0RlhXwh
Cc: denys@ti.com
Subject: [PATCH v2 6/6] linux-ti335x-psp 3.2: switch to userspace governor for beaglebone, ondemand seems to cause problems on a small percentage of boards
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
X-List-Received-Date: Mon, 07 May 2012 16:01:19 -0000

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


