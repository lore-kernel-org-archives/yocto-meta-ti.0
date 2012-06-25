Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68B17E01452
	for <meta-ti@yoctoproject.org>; Sun, 24 Jun 2012 23:57:25 -0700 (PDT)
Received: by eaab16 with SMTP id b16so1398251eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 24 Jun 2012 23:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=hGDPYgjiMghRxNgUkuU5ksRVM8nfqt/E0s48tKFQwdk=;
	b=T4AWOdDcac/T05s0oJ+TRBUExu3VvWGAKH5dG93xKjEZLZllFlVNc80nCMRqjnv7HG
	mLxtd3n/yfFft7u+nfZ3McJCVAUWkzhF7IcvL4Ll4rjVQFBguM4jAOJPCJrzfOZwnKqd
	2x921SJaxK6S9TqAoLs0/vkmiNqiDJMmBiOVQe4+9ADXxzez1IAZ+qXIAbc8jD6JzcW4
	L0/FM+Z/xWsOAcrlF84wTwtuurIkbfo6abr92CeHRyRrpPIFBvlA0y2pG7zgJz6mDgxb
	6b7O6win6BM+8hZGc6129Oo6MKF09bDSYmZMMYxr4ChegYfUU39kuUNQ84kHbxyBalLZ
	kZVg==
Received: by 10.14.99.196 with SMTP id x44mr2108505eef.31.1340607443651;
	Sun, 24 Jun 2012 23:57:23 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id z5sm135565813eem.3.2012.06.24.23.57.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jun 2012 23:57:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Jun 2012 08:57:10 +0200
Message-Id: <1340607432-27134-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlJO/ZbINi5gXEiWS4Yic4hPgbTNzo5JQssCXxnWiOqBg6PhPmJtDtNpQvLH50oCnwMf0z/
Subject: [PATCH 1/3] beaglebone-tester: bump SRCREV to fix serial console race
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
X-List-Received-Date: Mon, 25 Jun 2012 06:57:25 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index b5e3081..9995556 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r15"
+PR = "r16"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "3b19f1caf8c616e3f4a25abacca28b2239d3ec82"
+SRCREV = "4f6335aedf520917a0bc0c83e9c1ac1135b8a2af"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.10


