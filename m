Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C34FE00345
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 02:36:22 -0700 (PDT)
Received: by mail-bk0-f48.google.com with SMTP id y5so3828178bkt.35
	for <meta-ti@yoctoproject.org>; Wed, 01 Aug 2012 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=o1BlekR7m4TSDMme+L1i1qkE+2tGOz3lvRPhcBp2m8M=;
	b=QlsmgCTYCuIdCHr1TY55G73m2ZDBMTEOruOkLb/xAfZ49EnMX7zqfFWB/ixRuAbqXF
	Adaz92JN+RoX8KERogrovFCC/kqLweI7OSl9k0WBYSy+0QYPGX1QMn1Crvs1bnpd6kBx
	pM35VI6lxXV1x6k4Rjjg9l1PzyOuUVVDM5trwIRbghiAWg0H9hxBu/4DZQmbcrZWinay
	84z8dFpPQOHG4gzOx3DNo+uSeNhHqT+V0VkePlatHeu3rM7peW7NqMdPnhpqILRRvGGR
	x7JDTKqzadOTJAe/Jo8Nzr3Stw2pTwEAmlbUqPg2F8FvLeSdvyXgaOsECKAYthAwuPw5
	/Y/Q==
Received: by 10.205.118.138 with SMTP id fq10mr6755877bkc.58.1343813782271;
	Wed, 01 Aug 2012 02:36:22 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id he8sm1279620bkc.3.2012.08.01.02.36.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 02:36:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  1 Aug 2012 11:35:47 +0200
Message-Id: <1343813748-8318-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1343813748-8318-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343813748-8318-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] am-sysinfo: fix 'proto='-warning on recipe parsing
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
X-List-Received-Date: Wed, 01 Aug 2012 09:36:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-bsp/ti/am-sysinfo_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/ti/am-sysinfo_svn.bb b/recipes-bsp/ti/am-sysinfo_svn.bb
index d4f8740..b73a884 100644
--- a/recipes-bsp/ti/am-sysinfo_svn.bb
+++ b/recipes-bsp/ti/am-sysinfo_svn.bb
@@ -9,7 +9,7 @@ SRCREV = "5"
 PV = "1.0"
 PR = "r1+svnr${SRCPV}"
 
-SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;proto=https;user=anonymous;pswd=''"
+SRC_URI = "svn://gforge.ti.com/svn/am_sysinfo/;module=trunk;protocol=https;user=anonymous;pswd=''"
 
 S = "${WORKDIR}/trunk"
 
-- 
1.7.6.5


