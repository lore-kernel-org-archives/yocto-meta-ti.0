Return-Path: <paul.barker.commagility@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C7D0E00BAB; Wed, 20 Jan 2016 06:04:47 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [74.125.82.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C55EE00B9C
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2016 06:04:39 -0800 (PST)
Received: by mail-wm0-f66.google.com with SMTP id l65so4338297wmf.3
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2016 06:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G+9U7R6cfXLj7TlgNI2OjyN62JJT+Od3izczeo2gBRo=;
	b=UFRWeMwTY7BhxMQy868ZuvOkZ41Hc5PXoIZcaDqWtOML/G+JUI17Ck37qswXmdgN71
	zO5eyYMxeNsIaVY38ZBZYSbs3Ii1vWShbDs6Bf7QLauIzHCKDQvHRpasACIe/NduPErD
	kGbVsMrgeDhAKihBz8+DUVuIxDhlSIVTYUVSsMt05Hxj23RUdRdK9bWayul/jARWv5KK
	CxECUwP2rJyHsBRYrFUgodY46Ryt/buRvKhZQM9ymX2ZusKP0pmHAWvy/nLiNmy7khnD
	XXqie9wwLzeyD8BEnsjqSSBTcuNIfgIIhryuc0Dc4Y9qMD10lUMgMSvvySdIVhROz6px
	JMGw==
X-Gm-Message-State: AG10YOSikwCFl0kOo0jYRDcjuUZfx6u40bRayg65naxwaVflyXeY8+WOzygSDpUQgOQZ/w==
X-Received: by 10.28.54.65 with SMTP id d62mr4112997wma.35.1453298677942;
	Wed, 20 Jan 2016 06:04:37 -0800 (PST)
Received: from ku1404.commagility.com (inno-commagility-ownrouter.lut.ac.uk.
	[131.231.60.35]) by smtp.gmail.com with ESMTPSA id
	s2sm33315250wjs.43.2016.01.20.06.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 06:04:36 -0800 (PST)
From: Paul Barker <paul.barker@commagility.com>
To: meta-ti@yoctoproject.org
Date: Wed, 20 Jan 2016 14:04:26 +0000
Message-Id: <1453298666-17095-1-git-send-email-paul.barker@commagility.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH V2] ti-softhsmv2: Use target includes for zlib and openssl
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Jan 2016 14:04:47 -0000

ti-softhsmv2 needs to look at the target include directories instead of the host
include directories for zlib and openssl header files. By using
STAGING_EXECPREFIXDIR we can support changes to exec_prefix.

Signed-off-by: Paul Barker <paul.barker@commagility.com>
---
 recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
index c1e1654..3143acd 100644
--- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
+++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
@@ -21,7 +21,10 @@ S = "${WORKDIR}/git"
 CFLAGS += " -mno-unaligned-access"
 CPPFLAGS += " -mno-unaligned-access"
 
-EXTRA_OECONF += "--with-zlib=${STAGING_DIR_HOST}/usr"
+EXTRA_OECONF += " \
+    --with-zlib=${STAGING_EXECPREFIXDIR} \
+    --with-openssl=${STAGING_EXECPREFIXDIR} \
+    "
 
 INITSCRIPT_NAME = "softhsm-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
-- 
1.9.1


