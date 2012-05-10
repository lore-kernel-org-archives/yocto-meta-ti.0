Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D755E01421
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:16 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id fg15so937547wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=xPBaVxTKwSL4xhWhuBZLa04RdaHAmfAjGF/zoteILek=;
	b=k9VZLiHEDq4QLeuoo4QzBHTffN8KOqDUzyK9GCAbhXAOHrJ3aMIuP+9xH8gUN5wQ51
	sd9YbQZeHjqCvZe+FTIplRMfWN6mBk7i7k/I7ctpQ45jbxS9tHpgtPlr/HN8pInyURvx
	ghepa8O2wXtcMK5O3cNS95rcxDQXa5T5VpnbwuMAkQUqDQ5RRHbdjcHqohvBPTgDivfp
	0Yxm3dBMorVy7U3uK7euBngQhZ+pqgdjE/dDpgpuBpvAw4Tg+jLylThLoR7wWv63MGNw
	kFlfnpSQbX4VASxxHQyZ7yUMYPbtt1Wpo06CB1z9W2MXPuXqO3MB7EZ+mGdh9emN0igj
	bBUg==
Received: by 10.180.77.4 with SMTP id o4mr7582293wiw.17.1336640415887;
	Thu, 10 May 2012 02:00:15 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 6sm1966667wiz.1.2012.05.10.02.00.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 02:00:15 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:33 +0200
Message-Id: <1336640375-20418-11-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmBi41T6W21tbnVfr++oYJ7Xi9WgyVDVPFxwHThsCsaoFbVliwq80ARe9cI14YFnVa2mYIS
Cc: denys@ti.com
Subject: [PATCH v3 11/13] linux-ti33x-psp 3.2: bump SRCREV for 2 CPPI1.4 fixes
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
X-List-Received-Date: Thu, 10 May 2012 09:00:16 -0000

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


