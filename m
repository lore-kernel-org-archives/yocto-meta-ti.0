Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f41.google.com (mail-ww0-f41.google.com [74.125.82.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD4FBE0123C
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  9 Feb 2012 11:21:41 -0800 (PST)
Received: by wgbdt11 with SMTP id dt11so6639717wgb.2
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 09 Feb 2012 11:21:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.90.194 with SMTP id by2mr4814454wib.5.1328815300941;
	Thu, 09 Feb 2012 11:21:40 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm8701000wib.3.2012.02.09.11.21.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 11:21:40 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  9 Feb 2012 20:21:21 +0100
Message-Id: <1328815284-26086-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
References: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl/cGNnje37kRMz0pvN+8/KqmSiH7SYyS7Y6EbgWvbL8bJmhFZ8Ogii8TAWoO3jnc0iE/io
Subject: [PATCH 3/6] cloud9-image: include CAN support
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
X-List-Received-Date: Thu, 09 Feb 2012 19:21:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 65ce4e0..1a7e269 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -28,6 +28,7 @@ IMAGE_INSTALL += " \
 	nodejs-dev \
 	mplayer2 \
 	tslib-tests tslib-calibrate \
+	iproute2 canutils \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"
-- 
1.7.2.5


