Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92A0FE01206
	for <meta-ti@yoctoproject.org>; Wed,  9 May 2012 00:17:15 -0700 (PDT)
Received: by wibhm4 with SMTP id hm4so1371964wib.5
	for <meta-ti@yoctoproject.org>; Wed, 09 May 2012 00:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=xPBaVxTKwSL4xhWhuBZLa04RdaHAmfAjGF/zoteILek=;
	b=XaVHLj0PqiWLra2Sovg6u6eGx4dMdZzqYgkwcegF+PCjjL+aaGMZ7/wdkC/4Kgg2lA
	+2wTKUJYKy8SArSAMvxerbWr4MX8ZFjDjrUdzrYdekubR3jeccwO4b8mGklchIWNnne6
	vttoh4Y/OWp34tvsJf1mJwxUwpJLzLfokn3ycZbK6fHf83BdtFAEoAZsBVvTWvP2vxO4
	kCi2zBkzpSW8Qwo7MKZ5KhwSAoO6bXzhfy7UDbCFCwC5Aj0iALdPL0XLB/GoBJBHflgk
	k/Y+8zjNa/oIsIimWPfbZwMbhGqf4fx4aDZ0sxScL/QwjtqxkP/XZnsHudVjw5ECDos4
	AZOQ==
Received: by 10.180.76.232 with SMTP id n8mr4182128wiw.2.1336547833726;
	Wed, 09 May 2012 00:17:13 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gd4sm6827425wib.6.2012.05.09.00.17.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 00:17:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed,  9 May 2012 09:16:54 +0200
Message-Id: <1336547816-28951-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlobGGr5S7a1uQdg+LAVOAhdiJobtaHXJUbKE+yMAdDF20X7eWeY9/wJBxj18b3cAWdJo93
Cc: denys@ti.com
Subject: [PATCH 1/2] linux-ti33x-psp 3.2: bump SRCREV for 2 CPPI1.4 fixes
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
X-List-Received-Date: Wed, 09 May 2012 07:17:16 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 458248e..593d6e7 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "31944a82681a0e7ab6cc3e069c30eddc5042e3e8"
-MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
+SRCREV = "baaa0c0425528486efcc70b7696dd6359f10b5bd"
+MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.10


