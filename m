Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C408E00749
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:18 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4135982wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:18 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.102.35 as permitted sender)
	client-ip=10.180.102.35; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.102.35 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.102.35])
	by 10.180.102.35 with SMTP id fl3mr24158104wib.22.1329820278320
	(num_hops = 1); Tue, 21 Feb 2012 02:31:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.102.35 with SMTP id fl3mr20130996wib.22.1329820278006;
	Tue, 21 Feb 2012 02:31:18 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fl2sm53646814wib.4.2012.02.21.02.31.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:31:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:24 +0100
Message-Id: <1329820224-28112-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmcpHp8a0jJjEMTunBh9psChpVIQbhZ/oi0GqfBOk/2yMQez+aXj0vA53i0OG/W0Wx2VwOd
Subject: [Beagleboard.org][PATCH v2 10/10] beaglebone-getting-started: update SRM to rev A5
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
X-List-Received-Date: Tue, 21 Feb 2012 10:31:18 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index d02c749..548a9c0 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r18"
+PR = "r19"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "9b46d33531f0c740be25bbff5d485bec522f5934"
+SRCREV = "4750e2bdd29ce037a045149b50ad73906d26999f"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5


