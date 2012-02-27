Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2DA8E013A7
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:58 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so3288741wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:58 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.162 as permitted sender)
	client-ip=10.180.107.162; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.162 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.162])
	by 10.180.107.162 with SMTP id hd2mr4437161wib.8.1330350058407
	(num_hops = 1); Mon, 27 Feb 2012 05:40:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.107.162 with SMTP id hd2mr3422861wib.8.1330350058358;
	Mon, 27 Feb 2012 05:40:58 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id h19sm21980635wiw.9.2012.02.27.05.40.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:28 +0100
Message-Id: <1330350029-29100-10-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlTotjwYUOBpkwnFjWzcIM+xwbvSN9Qx02JcgCdOSyoxEjWqgKIkBgApZt2hf9ZamGvWRBj
Subject: [BeagleBone][PATCH v3 10/11] beaglebone-getting-started: update SRM to rev A5
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
X-List-Received-Date: Mon, 27 Feb 2012 13:40:59 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index d02c749..548a9c0 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r18"
+PR = "r19"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "9b46d33531f0c740be25bbff5d485bec522f5934"
+SRCREV = "4750e2bdd29ce037a045149b50ad73906d26999f"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.5


