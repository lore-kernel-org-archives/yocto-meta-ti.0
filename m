Return-Path: <koen@dominion.thruhere.net>
Received: from mail-bw0-f53.google.com (mail-bw0-f53.google.com
	[209.85.214.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 595BBE01217
	for <meta-ti@lists.yoctoproject.org>;
	Fri,  9 Dec 2011 04:11:49 -0800 (PST)
Received: by bkat8 with SMTP id t8so3007559bka.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 09 Dec 2011 04:11:49 -0800 (PST)
Received: by 10.180.91.137 with SMTP id ce9mr10740756wib.5.1323432708117;
	Fri, 09 Dec 2011 04:11:48 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id hq5sm12997129wib.7.2011.12.09.04.11.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 09 Dec 2011 04:11:47 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri,  9 Dec 2011 13:11:42 +0100
Message-Id: <1323432702-7423-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH v2] beaglebone-getting-started: fix LICENSE, update to latest git
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
X-List-Received-Date: Fri, 09 Dec 2011 12:11:50 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index b2b9308..142da90 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r15"
+PR = "r16"
 
 inherit allarch
 
-LICENSE = "GPLv2+ && MIT && PD && others"
+LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "46c58edffaca856fbe5efa8126af7b1e933a1c9b"
+SRCREV = "a698888220634a1b549bc2f2e6b33aa03709cb19"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5


