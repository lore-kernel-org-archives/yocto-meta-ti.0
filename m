Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 968BBE013BB
	for <meta-ti@yoctoproject.org>; Wed,  6 Jun 2012 08:07:42 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id b16so2156657eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 06 Jun 2012 08:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OLle7evWDW0hExcK9f6xzWX6HHNRD1Qc0nZsc6InD40=;
	b=IdN9m+HLOK3wd1ZQkx/rhlHSUAayoD6LFLGQbNYZhRtlPZ2Al0WdRsYZ73IBNN4JS/
	7g27L++9huK9IVUZTTAF4CyhKHoKtj4HMNf9ZWyLOm+GMD1lJ//YswWJA3Cc0sht2vjr
	lMSre4sLQYMEYlVEALx58fxzWdN03ipSlj01gy53mynXqoWrhG6ZQEzRb0kNwEMr7+am
	FFVzQGUOjUS7EH92DPwDKCdgPgzXaEZEno+Ktv4lehF3bc+u9Iv9dyD8HL+yae9g29Gj
	e8+UVjOgI4eco9H4DB8joOeGQM9q6cgpzTUbgPnzc/E2fqCgSXWbqvePOA48cOrsZmru
	FuIA==
Received: by 10.14.188.139 with SMTP id a11mr9567833een.139.1338995262134;
	Wed, 06 Jun 2012 08:07:42 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t3sm282384eeb.15.2012.06.06.08.07.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jun 2012 08:07:41 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Jun 2012 17:07:26 +0200
Message-Id: <1338995250-10721-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
References: <1338995250-10721-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmarLw6CiZXTeDXzSDWX4ViysGrrIY9Zz47hIAxybNrcumWgd1qkRrFuCfzMaHDG7SqasoJ
Cc: denys@ti.com
Subject: [PATCH 2/6] linux-ti33x-psp: enable TSL2550 driver for beaglebone weatherstation cape
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
X-List-Received-Date: Wed, 06 Jun 2012 15:07:43 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index c9316db..f88be14 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -1012,7 +1012,7 @@ CONFIG_MISC_DEVICES=y
 # CONFIG_APDS9802ALS is not set
 # CONFIG_ISL29003 is not set
 # CONFIG_ISL29020 is not set
-# CONFIG_SENSORS_TSL2550 is not set
+CONFIG_SENSORS_TSL2550=m
 # CONFIG_SENSORS_BH1780 is not set
 # CONFIG_SENSORS_BH1770 is not set
 # CONFIG_SENSORS_APDS990X is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 46a6277..e3a427b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.10


