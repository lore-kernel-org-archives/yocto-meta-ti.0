Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77F16E00749
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:05 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so4135982wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:04 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.100.33 as permitted sender)
	client-ip=10.180.100.33; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.100.33 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.100.33])
	by 10.180.100.33 with SMTP id ev1mr30738867wib.3.1329820264551
	(num_hops = 1); Tue, 21 Feb 2012 02:31:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.100.33 with SMTP id ev1mr25651902wib.3.1329820264503;
	Tue, 21 Feb 2012 02:31:04 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id m8sm53557597wia.11.2012.02.21.02.31.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:31:03 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:21 +0100
Message-Id: <1329820224-28112-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlak2OH0PaCUqqetEB0qfL6VqV/dlcoVBtSpxLKI2yuL0z6WYohen/7XTnR6Dr3sWN6yNR/
Subject: [Beagleboard.org][PATCH v2 07/10] beaglebone-getting-started: update to latest git
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
X-List-Received-Date: Tue, 21 Feb 2012 10:31:05 -0000

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


