Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44F47E01389
	for <meta-ti@lists.yoctoproject.org>;
	Tue,  7 Feb 2012 03:14:34 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id b10so5976570wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 07 Feb 2012 03:14:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.132.219 with SMTP id o69mr4845296wei.55.1328613273206;
	Tue, 07 Feb 2012 03:14:33 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id p10sm31932612wic.0.2012.02.07.03.14.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 03:14:32 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue,  7 Feb 2012 12:14:11 +0100
Message-Id: <1328613252-27915-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
References: <1328613252-27915-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkwdj0osU4NPn81vauh+lYHtuB5uBjev9//7UPo0aES5G6rW7hOj3QgFIyBXKPCV0nLI5Go
Subject: [BeagleBone][PATCH 5/6] cloud9-image: add mplayer to test media playback
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
X-List-Received-Date: Tue, 07 Feb 2012 11:14:34 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/images/cloud9-image.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes-misc/images/cloud9-image.bb b/recipes-misc/images/cloud9-image.bb
index 826dc93..087e88f 100644
--- a/recipes-misc/images/cloud9-image.bb
+++ b/recipes-misc/images/cloud9-image.bb
@@ -25,6 +25,7 @@ IMAGE_INSTALL += " \
 	tar \
 	gdb gdbserver \
 	nodejs-dev \
+	mplayer2 \
 "
 
 export IMAGE_BASENAME = "Cloud9-IDE"
-- 
1.7.2.5


