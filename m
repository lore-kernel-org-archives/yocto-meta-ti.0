Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A53CE0139E
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:35 -0800 (PST)
Received: by wgbed3 with SMTP id ed3so1067103wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:34 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.86.134 as permitted sender)
	client-ip=10.180.86.134; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.86.134 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.86.134])
	by 10.180.86.134 with SMTP id p6mr28021590wiz.0.1330350034102 (num_hops
	= 1); Mon, 27 Feb 2012 05:40:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.86.134 with SMTP id p6mr22241642wiz.0.1330350034022;
	Mon, 27 Feb 2012 05:40:34 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bg3sm21973330wib.10.2012.02.27.05.40.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:19 +0100
Message-Id: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQlSV71MQ+AztL7OdbVpH+anZkQioQlM1pF+EmFR+5ilnErekSMWz0jMkQ8Fdy/tbk90dg3g
Subject: [BeagleBone][PATCH v3 01/11] linux-ti33x-psp 3.2: fix ehrPWM polarity inversion
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
X-List-Received-Date: Mon, 27 Feb 2012 13:40:35 -0000

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


