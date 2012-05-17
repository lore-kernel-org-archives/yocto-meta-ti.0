Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 82A39E01420
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 03:07:21 -0700 (PDT)
Received: by wibhm6 with SMTP id hm6so1457826wib.11
	for <meta-ti@yoctoproject.org>; Thu, 17 May 2012 03:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=K2CrwWLirHrtzWi5BGc7Y1tPvvKXSRNGQouLuSiJM30=;
	b=Z41VFOgQ4vrd3gL0n7VaVtC5u4c0puHYtc9ekVzYWUvBoiBCOy9EYYRVPJp2DU/Irl
	2aKT8271eFislqnr9lh6WZ6oSH3qP38FDrh3fQA6gwPnOtgLX7xtK0M6kkxlYdgDUluB
	mT7Racr/GbXbjJ9iDszrR8hmYOTzmYKsUb8rpLKgKFZQE4g6wnmyOh9f6OVLPz0jw7oX
	88SAogaeEVWrKLnszVBzK9EuWnhdqUpV2zqeY3eK1SpRScf/PhfwR7VBawijf3MgZZwL
	l5nOprhKMMTNZez1isbrNsVWbZDNXXtrnpOdObYmRzkSjmsu6eWeQGTw89PNncjOYeSY
	v/mQ==
Received: by 10.180.107.104 with SMTP id hb8mr16729703wib.8.1337249240640;
	Thu, 17 May 2012 03:07:20 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id r2sm19445036wif.7.2012.05.17.03.07.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 03:07:19 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 17 May 2012 12:07:07 +0200
Message-Id: <1337249227-9151-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
References: <1337249227-9151-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQng07/k1yoS2wVUnSTQV20ASEZp3SYsc387owaig7BewXuJrBOCeXW0gritgNoRZb1neKDS
Cc: denys@ti.com
Subject: [PATCH 2/2] linux-ti33x-psp 3.2: correct PV for non-tipsp distros
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
X-List-Received-Date: Thu, 17 May 2012 10:07:21 -0000

The patchset updates the kernel to 3.2.x, so make PV match.
This doesn't need PR or MACHINE_KERNEL_PR bumps since the both the kernel ABI and file locations remain the same.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 0fe3d4f..efc5adb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -10,6 +10,10 @@ S = "${WORKDIR}/git"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
 
+# the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
+PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.16", d)}"
+FILESPATH =. "${FILE_DIRNAME}/${PN}-3.2:${FILE_DIRNAME}/${PN}-3.2/${MACHINE}:"
+
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
 MACHINE_KERNEL_PR_append = "l+gitr${SRCREV}"
-- 
1.7.10


