Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87433E01389
	for <meta-ti@lists.yoctoproject.org>;
	Tue,  7 Feb 2012 03:14:35 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so5595130wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 07 Feb 2012 03:14:35 -0800 (PST)
Received: by 10.180.95.1 with SMTP id dg1mr33240078wib.21.1328613275136;
	Tue, 07 Feb 2012 03:14:35 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id g6sm50616409wig.9.2012.02.07.03.14.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:14:34 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue,  7 Feb 2012 12:14:12 +0100
Message-Id: <1328613252-27915-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
References: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
Subject: [BeagleBone][PATCH 6/6] cloud9-image: add tslib-tests to test touchscreens
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
X-List-Received-Date: Tue, 07 Feb 2012 11:14:35 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 087e88f..5d25493 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -26,6 +26,7 @@ IMAGE_INSTALL += " \
 	gdb gdbserver \
 	nodejs-dev \
 	mplayer2 \
+	tslib-tests tslib-calibrate \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"
-- 
1.7.2.5


