Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E49BE013E8
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 01:08:43 -0800 (PST)
Received: by werm13 with SMTP id m13so238113wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 01:08:43 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.87.100 as permitted sender)
	client-ip=10.180.87.100; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.87.100 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.87.100])
	by 10.180.87.100 with SMTP id w4mr8251070wiz.22.1330592923222 (num_hops
	= 1); Thu, 01 Mar 2012 01:08:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.87.100 with SMTP id w4mr6611955wiz.22.1330592923133;
	Thu, 01 Mar 2012 01:08:43 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm6779873wib.4.2012.03.01.01.08.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 01:08:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  1 Mar 2012 10:08:33 +0100
Message-Id: <1330592913-8809-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQnK5Wo8dxrQx56wGshqtdfzuPCs3pOFTy9BzwXnjhdKXyfbGGozQ8Y+JE23iNMM396GvY80
Subject: [Beagleboard.org][PATCH 5/4] linux-ti33x-psp 3.2: remove patch that slipped in when regenerating SRC_URI
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
X-List-Received-Date: Thu, 01 Mar 2012 09:08:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 530fb48..b2f706a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -480,7 +480,6 @@ PATCHES_OVER_PSP = " \
 	file://3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch \
 	file://3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch \
 	file://3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch \
-	file://3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch \
 	file://3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch \
 	file://3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch \
 	file://3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch \
-- 
1.7.2.5


