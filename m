Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 070BBE01436
	for <meta-ti@yoctoproject.org>; Thu,  7 Jun 2012 08:41:08 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id b45so313432eek.35
	for <meta-ti@yoctoproject.org>; Thu, 07 Jun 2012 08:41:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=PmebZ3ovRXigWJBB+JmB8dIOwhRhrWcGpTSWR417H4c=;
	b=pZ/r8uOETeBSXoezCmvUMoSU6C8dtndFs1g6n9g4EBxl49fZnp3a+EyW4/l7JyeyB3
	BOKskAGOalwsJyeO4/HezVya06RMbOqshiDCzoX9nRvb/pW5H0WnCRv6E0LfpwuiACdx
	VkJgQxxLTX4jvQ6VR/SfmOFvlvUfautGxQ0lwVmUIVhu3ybFQZBiDmiYWuH6FXqYW30e
	ph0AIxSATgl8/XZU8DZRB+hyk7lRkFQuLuJU/d5F19eK9aXct+JDkhUjklo0I5nbCAtF
	WjhApzu/hkQrnamBfUqIsKTxGUSq/QZ5v+wmGQ2BOPGa92CTJaEfi4zQMSdfYzhQgwjN
	07iQ==
Received: by 10.14.127.10 with SMTP id c10mr1491345eei.12.1339083668418;
	Thu, 07 Jun 2012 08:41:08 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id g51sm12138590eea.14.2012.06.07.08.41.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Jun 2012 08:41:07 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu,  7 Jun 2012 17:40:45 +0200
Message-Id: <1339083645-18356-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
References: <1339083645-18356-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkNB35jM6/UMClbCkrGTdIfW90fYf6/KWBrugTsDKDyT80hGQYqx7r5PBU6NEbgJRr1uP0p
Cc: denys@ti.com
Subject: [PATCHv2 7/7] linux-ti33x-psp 3.2: turn on CONFIG_USB_SUSPEND to fix usb mass storage
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
X-List-Received-Date: Thu, 07 Jun 2012 15:41:09 -0000

Many thanks to Arkadiusz Karas <arkkar13@googlemail.com> for figuring that out and sharing the info.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb                   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index f88be14..692d71a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -2569,7 +2569,7 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_DEVICEFS=y
 CONFIG_USB_DEVICE_CLASS=y
 # CONFIG_USB_DYNAMIC_MINORS is not set
-# CONFIG_USB_SUSPEND is not set
+CONFIG_USB_SUSPEND=y
 # CONFIG_USB_OTG_WHITELIST is not set
 # CONFIG_USB_OTG_BLACKLIST_HUB is not set
 # CONFIG_USB_DWC3 is not set
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index e51de2a..3243998 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -15,7 +15,7 @@ PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.18", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.10


