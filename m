Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2086BE00749
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:15 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4135982wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:31:15 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.14.73 as permitted sender)
	client-ip=10.180.14.73; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.14.73 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.14.73])
	by 10.180.14.73 with SMTP id n9mr24596871wic.16.1329820275879 (num_hops
	= 1); Tue, 21 Feb 2012 02:31:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.14.73 with SMTP id n9mr20459137wic.16.1329820275826;
	Tue, 21 Feb 2012 02:31:15 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id cs4sm53597902wib.8.2012.02.21.02.31.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:31:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:23 +0100
Message-Id: <1329820224-28112-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQk+dJ6DDRkgecla2sVuRpR8Wn/FD8vTNLji1vlHTahI0WpD0bZT+e0yI7xtF4XBi6cevZfo
Subject: [Beagleboard.org][PATCH v2 09/10] cloud9-image: ship connman-test as well to manipulate interfaces using the CLI
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
X-List-Received-Date: Tue, 21 Feb 2012 10:31:16 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 1a7e269..b8ef3d8 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -29,6 +29,7 @@ IMAGE_INSTALL += " \
 	mplayer2 \
 	tslib-tests tslib-calibrate \
 	iproute2 canutils \
+	connman-tests \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"
-- 
1.7.2.5


