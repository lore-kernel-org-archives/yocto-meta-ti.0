Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01142E013A5
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:00 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id p13so4548183wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:00 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.181.11.227 as permitted sender)
	client-ip=10.181.11.227; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.181.11.227 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.181.11.227])
	by 10.181.11.227 with SMTP id el3mr24227510wid.18.1329820260749
	(num_hops = 1); Tue, 21 Feb 2012 02:31:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.181.11.227 with SMTP id el3mr20137344wid.18.1329820260698;
	Tue, 21 Feb 2012 02:31:00 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id cs4sm53595271wib.8.2012.02.21.02.30.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:31:00 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:20 +0100
Message-Id: <1329820224-28112-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm5Iu/C3Q6LuxMfho3/eznUOLxiPUxY24nZEOVMVJStolYxnwIU4XR6WCkela2Br5Gywp+g
Subject: [Beagleboard.org][PATCH v2 06/10] beaglebone-tester: include Jasons debug tweaks
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
X-List-Received-Date: Tue, 21 Feb 2012 10:31:01 -0000

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


