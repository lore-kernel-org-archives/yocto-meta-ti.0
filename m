Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5CF2E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:13:07 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4248170wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:13:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.80.8 with SMTP id n8mr26098212wix.14.1329156787437;
	Mon, 13 Feb 2012 10:13:07 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id q2sm23133895wiy.7.2012.02.13.10.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:13:06 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 19:12:46 +0100
Message-Id: <1329156766-29776-8-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
References: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkAxt10ua8hSRoCPfHPZ+5e7cjb2w3yiZNYcf8GgQtSOCfS604wx4UxncVSuhhnWkvRbIoH
Subject: [PATCH 8/8] ti335x: bump MACHINE_KERNEL_PR for kernel update
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
X-List-Received-Date: Mon, 13 Feb 2012 18:13:08 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 3807fbb..fc670d0 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "ti33x"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r2"
+MACHINE_KERNEL_PR = "r3"
 
 KERNEL_IMAGETYPE = "uImage"
 
-- 
1.7.2.5


