Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 079BBE00348
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:08:58 -0700 (PDT)
Received: by eaab14 with SMTP id b14so971369eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=hGDPYgjiMghRxNgUkuU5ksRVM8nfqt/E0s48tKFQwdk=;
	b=kXl6sEWiT3xYcI72038DSVJvwKZFjxZODVXGzAozyIFtaI1FMZN2ZVkPLkY61USqD/
	M+aVlAG8BpdWTtMsai0Ry50Ie+jCmFfl4HsCgnK5J6urfXuDRDC36VdfgC7cYB0NtMIo
	snBSuBwLsI27WaGx7KITcDKQx8KD21ahPnXER1a1e6cuj7879WJ1xPNKZ6TTcs3U5h3l
	ZMt9YcSypQ3DgS7Tdbem+iOERBWf3J8taob5Yu38Xf5OQmjolpa/3zzG/X1NdVA/vcLT
	1ZliY9STUnEaurmYuWtZRjjnONbA6qnqOF6xHQo+2IZfgpzEgEkEZ2gz5gK4kcsFkqTx
	UJjQ==
Received: by 10.14.173.71 with SMTP id u47mr9194914eel.22.1343581736997;
	Sun, 29 Jul 2012 10:08:56 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id o47sm9972574eem.0.2012.07.29.10.08.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:08:55 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:23 +0200
Message-Id: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkfUVo7YsDhtEUoBgL0AlmFcSn6cfDVwCgvkembbhVvzJMWCSUBVvA1ew2E6A9FQ0iXD/vN
Subject: [PATCH][for-denzil 01/12] beaglebone-tester: bump SRCREV to fix serial console race
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
X-List-Received-Date: Sun, 29 Jul 2012 17:08:59 -0000

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


