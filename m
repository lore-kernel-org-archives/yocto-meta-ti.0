Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77C78E0030B
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 23:45:59 -0700 (PDT)
Received: by weyr3 with SMTP id r3so311015wey.35
	for <meta-ti@yoctoproject.org>; Tue, 15 May 2012 23:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=fVePSQ0iYqQ+9sDP6gdubckEUmvI89qjmNmVRmakMd8=;
	b=cNME0KATa3f7SOBhhtwoZ7R9XLBYhP/XblNrPRKhNDTZNlYIg9TNK4yylMfE4SdhVu
	Bb908tEJGKG1p8MXZVQaT1TNU+RUdiPF9I4HU1iD6LmUVJf3VP/GY33Fm0Kec04+x+ZH
	SsTUCEUReFabKEud3b7VcjNHdOhiLocHvBRd8AY+1Y6/kfFddr1Cwa1kxpPS8fliNEQM
	UiC1Xe2/QqUUBVdg6kaEIu0N4COBIKRsAelxecte2t348RkJbK5G53wnRigEa9abFNxi
	uyhJMeDbzbQ0GW9MsSIoI1ldPwcmbLK94ig7jGFLjmPSYJNYBXFHaoAWyqgzvHxR8UBq
	xUVg==
Received: by 10.180.79.166 with SMTP id k6mr37352102wix.8.1337150758308;
	Tue, 15 May 2012 23:45:58 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ga8sm6096229wib.5.2012.05.15.23.45.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 23:45:57 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Wed, 16 May 2012 08:45:48 +0200
Message-Id: <1337150748-22598-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkYm/IYR2J2UpbkAAWLcmLXL4CCPLRxg1sCTr/1cMguNl5BtMI5HBJfuKGmD805qN0Z0Wkr
Cc: denys@ti.com
Subject: [PATCH] beagleboard-getting-started: update for revision A6 release
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
X-List-Received-Date: Wed, 16 May 2012 06:45:59 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index ede7b3c..603a01a 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r20"
+PR = "r21"
 
 inherit allarch
 
 LICENSE = "GPLv2+ & MIT & PD & others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "7d1f070ab2e981a89db302b1b61e85562b949dac"
+SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.10


