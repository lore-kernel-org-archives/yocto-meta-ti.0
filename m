Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79A18E01459
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:44 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id d41so1131520eek.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=dbpJXxyGoGqd4St6H9M9uvMw3LCp2bynccKPcbyKsD0=;
	b=pVAii/Rny8T+Gg5o6WLyZbU8iqeGgrWNOXAvL6W72SYk58Am6F9+yYMZBzwOYS7oj7
	hKGGmcV5KQObrjePt7gZuM0ccffBujFupBpPdrw+INjUDb4GF8uDgaVRfaVIm1w7Fl8a
	cDw1w/lgT0hIUwfqixZs/axUZH7n4CQMK1ILNdIie6D7Feikfeu1SBKw2TddUbhNhKxr
	DkL3Nxy3G9Ts51QtjelFcKB4WxqUk4YSidzQOI09Zu5L8HFcanCl+W8UbGH9D5fFpfYb
	D6berbThhfga5yfc0/yAxMi2n8apWyLpo06qtNbJzSVBJ0puBUHd0B+MUZLrU1/G0DPe
	fnig==
Received: by 10.14.211.196 with SMTP id w44mr9020882eeo.19.1343581784081;
	Sun, 29 Jul 2012 10:09:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id g46sm21472695eep.15.2012.07.29.10.09.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:34 +0200
Message-Id: <1343581714-20397-12-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmkABIY+aOJV3LZW8UID2EjVtqfWOBM+9u8KuGweL02taBNwKEqs1nR4czWlG4THJ3sURIA
Subject: [PATCH][for-denzil 12/12] u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-bsp/u-boot/u-boot_2011.10rc.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.10rc.bb b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
index c4b4ca7..7035b4c 100644
--- a/recipes-bsp/u-boot/u-boot_2011.10rc.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.10rc.bb
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "(ti33x)"
 DEFAULT_PREFERENCE_ti33x = "99"
 
 PV = "2011.09+git"
-PR = "r28"
+PR = "r29"
 
 # SPL build
 UBOOT_BINARY = "u-boot.img"
@@ -26,7 +26,7 @@ SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;br
            file://2011.09git/0010-am335x-switch-to-ext4-mode.patch \
           "
 
-SRCREV = "ec687252299796639ff9bcb981804fbec7b445a4"
+SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
 
-- 
1.7.10


