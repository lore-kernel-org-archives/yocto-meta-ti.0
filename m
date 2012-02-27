Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25B80E013A6
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:56 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so3288741wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 27 Feb 2012 05:40:56 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.101.228 as permitted sender)
	client-ip=10.180.101.228; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.101.228 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.101.228])
	by 10.180.101.228 with SMTP id fj4mr18910348wib.4.1330350056322
	(num_hops = 1); Mon, 27 Feb 2012 05:40:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.101.228 with SMTP id fj4mr14917554wib.4.1330350056111;
	Mon, 27 Feb 2012 05:40:56 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id d7sm55284117wiz.6.2012.02.27.05.40.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 05:40:53 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 27 Feb 2012 14:40:27 +0100
Message-Id: <1330350029-29100-9-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
References: <1330350029-29100-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkgvs8Y3JI7hQmZ/tJsFnGUJkTaRh9ZzELJ0lf/siPGc7yCydf5iFHwYfDl01TyiXbMswwu
Subject: [BeagleBone][PATCH v3 09/11] cloud9-image: ship connman-test as well to manipulate interfaces using the CLI
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
X-List-Received-Date: Mon, 27 Feb 2012 13:40:57 -0000

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


