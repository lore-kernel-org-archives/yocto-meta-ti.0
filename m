Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C693E01457
	for <meta-ti@yoctoproject.org>; Sun, 24 Jun 2012 23:57:26 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id b16so1398251eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 24 Jun 2012 23:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=0sIjPpxeTFr7iD2u2lVdBG+9zyBw7HcOZ5Tr2qlu/yA=;
	b=m3K9fQ/Axs4ah/iNyTlf+pWcxIDxowv0sYnYgeqDfQc1zd3sbcActj+aRTsFMmaikF
	EUVivxiBhTMXgjHAAgX+/odSS7vvOCDBLAbHgxl1G2Iu2RH3eLu9HKR7Cf0r7Axp4Xgg
	CxM4PeEu7+BR2/zumazfi8YudXufqI0kt7T0dK1MzezlzJ6gAHedlUb+1tvjj5/N9Kso
	Fqz+V63LO7ReEgFKeAknWv+qspdCces2E0zq7MF5sxsyCVhbSlNWWPvZZqp6ekFnFH4S
	6n70b5SOhG8pHL4eYqqK2mJJy6EWer/mW98ek1SysBBDVEpc/HCkNlSgT0F1yqNU8PAY
	ZZmA==
Received: by 10.14.45.15 with SMTP id o15mr2072020eeb.43.1340607446058;
	Sun, 24 Jun 2012 23:57:26 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t3sm135526003eeb.15.2012.06.24.23.57.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jun 2012 23:57:25 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Jun 2012 08:57:11 +0200
Message-Id: <1340607432-27134-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1340607432-27134-1-git-send-email-koen@dominion.thruhere.net>
References: <1340607432-27134-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkajXt4jB2Ry1FYmg2gLl9K8p6AovU8S3+T5jjWuQMQuxS1AZN+ypzdpF/nB43BZa/J1rTg
Subject: [PATCH 2/3] beaglebone-tester: re-enable pmic test
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
X-List-Received-Date: Mon, 25 Jun 2012 06:57:26 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 9995556..82c5a83 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r16"
+PR = "r17"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "4f6335aedf520917a0bc0c83e9c1ac1135b8a2af"
+SRCREV = "c748d157b9afbb71e6eadf1dca7a787a456c0149"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10


