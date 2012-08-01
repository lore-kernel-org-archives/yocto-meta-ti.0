Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D20CDE002A8
	for <meta-ti@yoctoproject.org>; Wed,  1 Aug 2012 02:36:20 -0700 (PDT)
Received: by bkty5 with SMTP id y5so3828178bkt.35
	for <meta-ti@yoctoproject.org>; Wed, 01 Aug 2012 02:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=MOS7b1Wa6LS8OR+WQvsmwzX1NoHd9Ixiw4hMtYI5fsU=;
	b=ObtMrAnk+l230ZkEagWuOLyu/hKGPV/9HAHpN0u3M9E61yAZlTt8kYwmUftkkqHNej
	0mFnyOqcIOTIxw9HYiE0bQswSf2xIiLdiIRY8HFCofeuKiFJuCaAwoRAuyxKmMOVYw4U
	sCyscQyivh8H2V61ao+oaWPQy9o88LI4mWe5AgHmAbObeiWNCq2hBIKeboqbBNfedW2x
	u4ivB5dMQSoW5e1i9tc6cvD/SM19S/9G8UL2lq6bOtJz06UdCBv2zDzoYvdrf4e7borl
	C1AepGq5xWsB6xsEXXtPHmHZiH5wCb5I5HW+a27fogNwQ4KJR2mGuxCm2AdgiDRlnpdZ
	XIsw==
Received: by 10.204.130.10 with SMTP id q10mr6507091bks.90.1343813779779;
	Wed, 01 Aug 2012 02:36:19 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id he8sm1279620bkc.3.2012.08.01.02.36.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 02:36:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  1 Aug 2012 11:35:46 +0200
Message-Id: <1343813748-8318-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [PATCH 1/3] gstreamer-ti: fix 'proto='-warning on recipe parsing
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
X-List-Received-Date: Wed, 01 Aug 2012 09:36:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
index 3d260ed..f314a35 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb
@@ -11,7 +11,7 @@ SRCREV = "962"
 # apply patches from tracker 1208 to get zero copy support.
 # https://gstreamer.ti.com/gf/project/gstreamer_ti/tracker/?action=TrackerItemEdit&tracker_item_id=1208&start=175
 
-SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;proto=https;user=anonymous;pswd='' \
+SRC_URI = "svn://gforge.ti.com/svn/gstreamer_ti/trunk;module=gstreamer_ti;protocol=https;user=anonymous;pswd='' \
            file://gstreamer-ti-rc.sh \
            file://r962-remove-include-videodev.diff \
            file://gstti-init.service \
-- 
1.7.6.5


