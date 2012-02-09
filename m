Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B02C4E00593
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  9 Feb 2012 11:21:43 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so1599928wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 09 Feb 2012 11:21:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.86.105 with SMTP id o9mr4820644wiz.4.1328815302874;
	Thu, 09 Feb 2012 11:21:42 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id y1sm10531082wiw.6.2012.02.09.11.21.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 11:21:42 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  9 Feb 2012 20:21:22 +0100
Message-Id: <1328815284-26086-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
References: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnyxP8m2/yVLzHI+krJznoUC3b5xtXlxPR9L8J0jCDpKmXK3/fhqevSUt/5MafRpcyaKo5E
Subject: [PATCH 4/6] beaglebone-tester: bump SRCREV
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
X-List-Received-Date: Thu, 09 Feb 2012 19:21:44 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index b4a94ab..dae9628 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "ab8c1e604575b85eca9a55073f7d50ac465a1072"
+SRCREV = "0a3415705afb206694d4e873fe8228b7440213db"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2.5


