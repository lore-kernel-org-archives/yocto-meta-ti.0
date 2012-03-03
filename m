Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8911AE01363
	for <meta-ti@lists.yoctoproject.org>;
	Sat,  3 Mar 2012 02:53:18 -0800 (PST)
Received: by wico1 with SMTP id o1so652001wic.26
	for <meta-ti@lists.yoctoproject.org>;
	Sat, 03 Mar 2012 02:53:17 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.92.34 as permitted sender)
	client-ip=10.180.92.34; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.92.34 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.92.34])
	by 10.180.92.34 with SMTP id cj2mr3247121wib.20.1330771997607 (num_hops
	= 1); Sat, 03 Mar 2012 02:53:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.92.34 with SMTP id cj2mr2557775wib.20.1330771997386;
	Sat, 03 Mar 2012 02:53:17 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gp8sm8812046wib.5.2012.03.03.02.53.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Mar 2012 02:53:16 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Sat,  3 Mar 2012 11:53:07 +0100
Message-Id: <1330771988-13742-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
References: <1330771988-13742-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlr+2rUcbWC9QDZHNUktopqsX2Y/OVorQ2rGLAAEjxV0ZLZ6MoSqO8vpse+pJaZ/dqM4kND
Subject: [PATCH 2/3] ti-hw-bringup-image: change require to include to make meta-angstrom a soft dependency
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
X-List-Received-Date: Sat, 03 Mar 2012 10:53:18 -0000

The image will be non-functional, but parsing completes with only oe-core + meta-ti

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/ti-hw-bringup-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-misc/images/ti-hw-bringup-image.bb b/recipes-misc/images/ti-hw-bringup-image.bb
index 5f7afce..2be8baf 100644
--- a/recipes-misc/images/ti-hw-bringup-image.bb
+++ b/recipes-misc/images/ti-hw-bringup-image.bb
@@ -1,6 +1,6 @@
 # Image for assisting in hardware bringup
 
-require recipes-images/angstrom/systemd-image.bb
+include recipes-images/angstrom/systemd-image.bb
 
 EXTRA_MACHINE_IMAGE_INSTALL ?= ""
 
-- 
1.7.2.5


