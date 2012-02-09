Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADBD1E00307
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  9 Feb 2012 11:21:38 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so1779139wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 09 Feb 2012 11:21:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.181.13.113 with SMTP id ex17mr4779383wid.15.1328815297186;
	Thu, 09 Feb 2012 11:21:37 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id m8sm10476547wia.11.2012.02.09.11.21.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 11:21:36 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  9 Feb 2012 20:21:19 +0100
Message-Id: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmc58pANLHuryUHzFGS2WQ+XrJcJE2UWscAGe7hrMbA6FTcqVhixKKxrC7giPgY42I7eP6T
Subject: [PATCH 1/6] beaglebone-getting-started: update to latest git
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
X-List-Received-Date: Thu, 09 Feb 2012 19:21:39 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index 142da90..b135176 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r16"
+PR = "r17"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "a698888220634a1b549bc2f2e6b33aa03709cb19"
+SRCREV = "5b93037d0504ab194709cf8b6dc3890fefe19fd9"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5


