Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB5AEE00B0A
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:13:00 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so4248170wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 13 Feb 2012 10:13:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.86.198 with SMTP id r6mr20037337wiz.2.1329156780279;
	Mon, 13 Feb 2012 10:13:00 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id by3sm7534976wib.3.2012.02.13.10.12.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 10:12:59 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 13 Feb 2012 19:12:43 +0100
Message-Id: <1329156766-29776-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
References: <1329156766-29776-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl9ALRD2UVXOvpLsGrxVHNbBYoYiH7w6AH29vpEE33+xLkbWuEZ5qpB5GpXkNo3exOvT6lw
Subject: [PATCH 5/8] cloud9-image: ship connman-test as well to manipulate interfaces using the CLI
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
X-List-Received-Date: Mon, 13 Feb 2012 18:13:01 -0000

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


