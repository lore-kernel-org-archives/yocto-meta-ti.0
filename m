Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02919E002A8
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 02:58:39 -0700 (PDT)
Received: by eaab16 with SMTP id b16so345213eaa.35
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2012 02:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=hGDPYgjiMghRxNgUkuU5ksRVM8nfqt/E0s48tKFQwdk=;
	b=DVlQbExILvCqGBfiwCrc9jULwdJNmVyMPUUEFpLexCSTBBjXGGmTu9XJ12XKeYejE8
	eZtrrgL0gNdkJ8f5nk25ILeg3E/EuUe6UHlbZ7bL/o+8C+WuJQW3fTC3+NfrZzmhVFdJ
	/TTvvoOp6Rv9feelvQ2MBHRkg4v493F6W17GHtTooI/7jDvWEpEp3R8zf/1nmaHHD+L7
	bgjQfDHhDPoPdj4tgzhfWur/Ni9uaWtFjVNjPD0RzZcxd49xEFhkCfkjTULHneffHbSt
	Cu2/Zr1lsJXfWcbPJusAx84G7ow/M1aP1g56GDVsYXkB+vixt9zfTLvJqc9HgszipT+8
	16gQ==
Received: by 10.14.127.8 with SMTP id c8mr11730213eei.148.1342000718187;
	Wed, 11 Jul 2012 02:58:38 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id a16sm4252274eeg.0.2012.07.11.02.58.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 02:58:35 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Jul 2012 11:58:24 +0200
Message-Id: <1342000711-18346-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlneVdoHwzKaHqIFagOypDRMjGzdTcq88kILKt9zlCn6d3KeFKJT/VkfDr2mV64X2BUOtja
Subject: [PATCH 1/8] beaglebone-tester: bump SRCREV to fix serial console race
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
X-List-Received-Date: Wed, 11 Jul 2012 09:58:40 -0000

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


