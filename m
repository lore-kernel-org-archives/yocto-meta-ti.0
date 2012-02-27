Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1E2AE013A6
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:41:00 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so3288741wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:41:00 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.131.29 as permitted sender)
	client-ip=10.216.131.29; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.131.29 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.131.29])
	by 10.216.131.29 with SMTP id l29mr7071333wei.48.1330350060729
	(num_hops = 1); Mon, 27 Feb 2012 05:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=mime-version:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=1FZFrjaszyeRzkVHDUSFZsGdC7iJKmGYMN3T5TRhcwE=;
	b=jUumbAKFqSZRD1m7UQBc8w3HFZluqov3mp20T/bMGUzHR5xVW9WWNIrpcY8xrtHacf
	EUVKQ1Yo4E4K3B2pMc9stWxYQWYcZbVTP+w79m9pKsHAZpdr0c3Lazw7g1GXaBCyA79f
	Uula4TXzEOrxeg+NrREASk5j1jgwxbmMvks5o=
MIME-Version: 1.0
Received: by 10.216.131.29 with SMTP id l29mr5630723wei.48.1330350060611;
	Mon, 27 Feb 2012 05:41:00 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm55309672wib.4.2012.02.27.05.40.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:29 +0100
Message-Id: <1330350029-29100-11-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn5iEuceFtI6GZ/l04Td7bDcqBlkk6iOuo/IA748KzHmlZeX0ChcLd8LzIh/kQhzWomSrji
Subject: [BeagleBone][PATCH v3 11/11] linux-ti33x-psp 3.2: enable PRU support for beaglebone
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
X-List-Received-Date: Mon, 27 Feb 2012 13:41:01 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    7 +++++--
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index 07b9987..c5b80d1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1,6 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Linux/arm 3.2.0 Kernel Configuration
+# Linux/arm 3.2.6 Kernel Configuration
 #
 CONFIG_ARM=y
 CONFIG_HAVE_PWM=y
@@ -2894,7 +2894,10 @@ CONFIG_RTC_DRV_TWL4030=y
 CONFIG_RTC_DRV_OMAP=y
 # CONFIG_DMADEVICES is not set
 # CONFIG_AUXDISPLAY is not set
-# CONFIG_UIO is not set
+CONFIG_UIO=m
+CONFIG_UIO_PDRV=m
+CONFIG_UIO_PDRV_GENIRQ=m
+CONFIG_UIO_PRUSS=m
 CONFIG_VIRTIO=m
 CONFIG_VIRTIO_RING=m
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 42a606d..36df3e6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


