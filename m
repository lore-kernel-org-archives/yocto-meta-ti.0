Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6790CE0044A
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 00:19:40 -0700 (PDT)
Received: by eekd41 with SMTP id d41so1133673eek.35
	for <meta-ti@yoctoproject.org>; Fri, 31 Aug 2012 00:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=ZfxQH3DP5CZH0ncBT9/XOTVGhy3iMevxV7DSRzILYoI=;
	b=C3FMnA2lv7UgwYRY0SAZ+Tv1Lhvo1u129NtJJHZJaeawtlmFNkrk4C3mPEFAlLLkMC
	YbBKNedr1BWAOLS78afyKBzwiTs/V4QaToPH2RODgz1d7dR6Vy+ftVtoYL/NEXODWgPF
	ufQsB5FTZh6OlZn9F1R6ZoXyTNyCFkNlyWMnjETohnVb0GgdbOw/OiEn96Kzv6gvNT/z
	/+sc4w1E//cSHY0f1vRa+RbAcJ20kO149JIerpaEetJpuuhweuoTp+zMwzTUDJqY1g8t
	WkBDVhnay5zbuK42rtIj1zVADr6WNVLPHKc9gZt/zgMfhqLbIgD3iquYqxzFzcknnRyL
	mlMA==
Received: by 10.14.181.132 with SMTP id l4mr9800392eem.17.1346397578914;
	Fri, 31 Aug 2012 00:19:38 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u8sm10883222eel.11.2012.08.31.00.19.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 31 Aug 2012 00:19:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Fri, 31 Aug 2012 09:19:26 +0200
Message-Id: <1346397567-21825-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQlPKK9X77x1205rcnDpwNIw3EZidRNNEwvtZVqO7QluKdpF56A35Y4i+wbxpjc6DAQCrFz7
Subject: [PATCH 1/2] beaglebone-tester: ship testaudio, fix depends
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 07:19:40 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 82c5a83..138fbc6 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r17"
+PR = "r18"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "c748d157b9afbb71e6eadf1dca7a787a456c0149"
+SRCREV = "168a9604e170931d9de228f0d774f4fbda58aa37"
 
 S = "${WORKDIR}/git"
 
@@ -37,6 +37,10 @@ do_install() {
 	for i in ${S}/bone-tester/lib/* ; do
 		install -m 0755 ${i} ${D}${localstatedir}/lib/bone-tester/lib/
 	done
+
+	install -d ${D}${bindir}
+	install -m 0755 ${S}/testaudio ${D}${bindir}
+
 }
 
 
@@ -44,7 +48,7 @@ FILES_${PN} += "${base_libdir}/systemd \
                 /boot \
                "
 
-RDEPENDS_${PN} = "iputils memtester"
+RDEPENDS_${PN} = "alsa-utils-aplay sox iputils memtester"
 RRECOMMENDS_${PN} = "kernel-module-g-zero \
                      kernel-module-g-mass-storage \
                      kernel-module-g-file-storage \
-- 
1.7.10


