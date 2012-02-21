Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66964E00749
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:43 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so4575059wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.81.66 as permitted sender)
	client-ip=10.180.81.66; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.81.66 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.81.66])
	by 10.180.81.66 with SMTP id y2mr24209842wix.20.1329820242054 (num_hops
	= 1); Tue, 21 Feb 2012 02:30:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.81.66 with SMTP id y2mr20165479wix.20.1329820241914;
	Tue, 21 Feb 2012 02:30:41 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y6sm21592994wix.10.2012.02.21.02.30.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:30:41 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:15 +0100
Message-Id: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnDFrwosZu1jho6K1FiXMWtPzO2HYCyCxkSc5KJd3fuEq0LoPGaTDVdRXk/oBvoXphRXDNY
Subject: [Beagleboard.org][PATCH v2 01/10] linux-ti33x-psp 3.2: fix ehrPWM polarity inversion
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
X-List-Received-Date: Tue, 21 Feb 2012 10:30:43 -0000

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


