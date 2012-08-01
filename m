Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 097A0E006AD
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 02:36:23 -0700 (PDT)
Received: by mail-bk0-f48.google.com with SMTP id y5so3828178bkt.35
	for <meta-ti@yoctoproject.org>; Wed, 01 Aug 2012 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=arSlzEXnv5pk7rmYtJMq0tbZcWBGyfL0qeih+AVueXw=;
	b=y+Qd5hUi4yhoZCkXbm1QXdqBAVcypjR7Y8Ft0gjxPutk450HXKxc+LUE/g0w1i30q8
	SDITjH5Ze556amuPjlgKhgoYZ8cYOwfuYA0DWLkOn4mHMmrqNVR+hx7aaPawh/+kwZ5c
	IRmmTX/sFDSKLirTF3X8YcSLU2IuayY0SbxORnEj84DwKrmz0lfHmHT5nKodT10Mu0sa
	IX/NfdXYRBaEKUzQRGNUP5hZPUu5KHqN/MY5wcbMHY7N5kfdLz2GdX1cKPQS2IAtzR1S
	XBPSWMMx2kex0g+m6al2MiHZbqLHka3p8CCZcbMRqNBPGzpZ8bcIn0M/pWUC1jQq4ovY
	4z7Q==
Received: by 10.205.136.3 with SMTP id ii3mr6564127bkc.101.1343813783675;
	Wed, 01 Aug 2012 02:36:23 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id he8sm1279620bkc.3.2012.08.01.02.36.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 02:36:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  1 Aug 2012 11:35:48 +0200
Message-Id: <1343813748-8318-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1343813748-8318-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343813748-8318-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ti-dmai.inc: fix 'proto='-warning on recipe parsing
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
X-List-Received-Date: Wed, 01 Aug 2012 09:36:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-ti/dmai/ti-dmai.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai.inc b/recipes-ti/dmai/ti-dmai.inc
index 23481b7..58955b5 100644
--- a/recipes-ti/dmai/ti-dmai.inc
+++ b/recipes-ti/dmai/ti-dmai.inc
@@ -17,7 +17,7 @@ DMAIBRANCH           ?= "UNDEFINED_DMAIBRANCH"
 
 S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
 
-SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};proto=https;user=anonymous;pswd='' \
+SRC_URI = "svn://gforge.ti.com/svn/dmai/;module=${DMAIBRANCH};protocol=https;user=anonymous;pswd='' \
 		file://loadmodules-ti-dmai-dm6446_al.sh \
 		file://loadmodules-ti-dmai-dm6467_al.sh \
 		file://loadmodules-ti-dmai-o3530_al.sh \
-- 
1.7.6.5


