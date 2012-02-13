Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDAADE0030B
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:12:53 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so4248170wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:12:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.24.166 with SMTP id v6mr19871423wif.10.1329156771425;
	Mon, 13 Feb 2012 10:12:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ec3sm23155312wib.1.2012.02.13.10.12.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:12:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 19:12:39 +0100
Message-Id: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQklZqOa5nOekTXVrU6oJLVBsb0CP4XlKjK4nvEi+qODwqS6cR6Ep+Rel+axzVsFNugsbp07
Subject: [PATCH 1/8] beaglebone-tester: include Jasons debug tweaks
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
X-List-Received-Date: Mon, 13 Feb 2012 18:12:54 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index dae9628..7a72547 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r12"
+PR = "r13"
 
 SRC_URI = "git://github.com/koenkooi/validation-scripts.git;protocol=git \
           "
-SRCREV = "0a3415705afb206694d4e873fe8228b7440213db"
+SRCREV = "dc89e2d6b2ac0238a7aa5a334d7c86d7b8613837"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.2.5


