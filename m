Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 71B2CE0136A
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:12:55 -0800 (PST)
Received: by werp13 with SMTP id p13so4307838wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:12:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.136.98 with SMTP id v76mr5109434wei.17.1329156773630;
	Mon, 13 Feb 2012 10:12:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id eq5sm48979383wib.2.2012.02.13.10.12.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:12:52 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 19:12:40 +0100
Message-Id: <1329156766-29776-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
References: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQljLqVdGnxyg8nOs2f6sd08xzMjR7xmrQWv8kTS2sj0gCc4vUp8lvpFmVSZJHKJhtl+kNuk
Subject: [PATCH 2/8] beaglebone-getting-started: update to latest git
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
X-List-Received-Date: Mon, 13 Feb 2012 18:12:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index b135176..d02c749 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r17"
+PR = "r18"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "5b93037d0504ab194709cf8b6dc3890fefe19fd9"
+SRCREV = "9b46d33531f0c740be25bbff5d485bec522f5934"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5


