Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40C3BE00C01; Fri, 13 Jun 2014 15:34:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.49 listed in list.dnswl.org]
Received: from mail-pb0-f49.google.com (mail-pb0-f49.google.com
	[209.85.160.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2735DE00BEA
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:50 -0700 (PDT)
Received: by mail-pb0-f49.google.com with SMTP id jt11so2520607pbb.8
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DeP9+eaRTCSyR3d1SuDCkhwJtrQXAhaffVS2smU/lGQ=;
	b=jnFyTYfBHeGFtHodFWzBIwhnoVgahb3WVO7e/xwzD6CZuxOwRC+U4Fc9/aUiRbNFpz
	Yhnlt19L2Zl7toyuiz+ESIv8R+B8dxsJ1hK+9rPnJSfUDjX5c8BP8SIwxwNTVxvFaAL+
	PIhpOnrUnsGDRLbVMM0ityq0gKDHZQ2zUWb6lNyD6Owkndq8/DiEc6ps+I9r7KwhmrL3
	lV+hdVXeWA9/8iLWThoXCIIMo7hjV78g1B4M3ZBDIuKAOxD9pUyTQbNrAvTwRv+M7vTY
	eel6eknyJs5F4P7XNgkuSsV37dHQNhFS4LuF2NNID5lmlf9bvLL0pemsCezTz9i/20Ge
	RjuQ==
X-Received: by 10.66.162.74 with SMTP id xy10mr3939994pab.4.1402698889956;
	Fri, 13 Jun 2014 15:34:49 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xk1sm27397061pac.21.2014.06.13.15.34.49 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 15:34:49 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 15:34:06 -0700
Message-Id: <1402698848-13759-4-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
Subject: [PATCH 4/6] gstreamer-ti: Revert to build in place ${B} = ${S}
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
X-List-Received-Date: Fri, 13 Jun 2014 22:34:51 -0000

This recipe use autotools and breaks when built out-of-tree
(${B} != ${S}).

Signed-off-by: Ash Charles <ashcharles@gmail.com>
---
 recipes-ti/gstreamer-ti/gstreamer-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index 2c503f5..e0e65a7 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -9,7 +9,7 @@ LICENSE = "LGPL"
 # TODO :: Check if CPPFLAGS_append is still required
 # TODO :: Remove ENCODE/DECODE combo exports - these are not used anymore (check?)
 
-inherit autotools
+inherit autotools-brokensep
 inherit update-rc.d
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
-- 
1.8.3.2


