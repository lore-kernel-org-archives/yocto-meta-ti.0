Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28EF0E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:20:53 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so4384861wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:20:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.139.25 with SMTP id b25mr6528944wej.28.1329156776509;
	Mon, 13 Feb 2012 10:12:56 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y6sm23124987wix.10.2012.02.13.10.12.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:12:54 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 19:12:41 +0100
Message-Id: <1329156766-29776-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
References: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnNB5alAb3SHeDqIHddtFJHzZVXjGpc6ljmC/wTEVl5Avo7sT4qrEGJBqnZrH1OIoYqAhQ0
Subject: [PATCH 3/8] linux-ti33x-psp 3.2: fix ehrPWM polarity inversion
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
X-List-Received-Date: Mon, 13 Feb 2012 18:20:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index a25d503..f2ba8e0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -10,8 +10,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "21ef5e1fa530eb8f23bfe18650e3915d7c291ca9"
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
-- 
1.7.2.5


