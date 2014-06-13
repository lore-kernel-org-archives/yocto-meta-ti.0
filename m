Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15378E00C31; Fri, 13 Jun 2014 15:34:56 -0700 (PDT)
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
	*      [209.85.160.42 listed in list.dnswl.org]
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8351E00BFE
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:49 -0700 (PDT)
Received: by mail-pb0-f42.google.com with SMTP id ma3so2302795pbc.1
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZrgApx85eniAN9iBhsRws/NxV+ZFbBLI2z2QVhDRGvU=;
	b=EytJCZO+6eDZHvl7tcDx7/ZXBIIQXxDbhrfomrd//VBYscsAe3C7+nHurYC/zi+FuE
	GKXLmECfRQCznXRfc6cCHjG6XhysQrXhFK9HziN6DCkSpVa56Nk+N6r+tp9VzvhFK0gY
	BQV8YKsD41f4NRKB82rvu9xOnLguUYjnVSvyAKm8Co9ak1ckiwB+FAp5NlYFlx1sbFoB
	5su5SXd9BRdvUpHpY1EI1XYZaL/RtR78e22wx76aESqwWnWafkhzu+4E3K+nVZlMSd5S
	8msYTZaZJ8KvBlioKQrKT9ip6TMpmlFu/q+0KnOAftVxyOTo8RHP/kONdWBczbjfLB0P
	sAIw==
X-Received: by 10.68.200.133 with SMTP id js5mr6743289pbc.138.1402698889026;
	Fri, 13 Jun 2014 15:34:49 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xk1sm27397061pac.21.2014.06.13.15.34.48 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 15:34:48 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 15:34:05 -0700
Message-Id: <1402698848-13759-3-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
References: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
Cc: Scott Ellis <scott@jumpnowtek.com>
Subject: [PATCH 3/6] gstreamer-ti: Break packages into dev and staticdev
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
X-List-Received-Date: Fri, 13 Jun 2014 22:34:56 -0000

From: Scott Ellis <scott@jumpnowtek.com>

---
 recipes-ti/gstreamer-ti/gstreamer-ti.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index cb03266..2c503f5 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -141,7 +141,8 @@ RRECOMMENDS_${PN}_append_omapl137  += "ti-codecs-omapl137-server ti-cmem-module
 RRECOMMENDS_${PN}_append_omapl138  += "ti-codecs-omapl138-server ti-cmem-module ti-dsplink-module"
 
 FILES_${PN}     += "${libdir}/gstreamer-0.10/*.so ${sysconfdir} ${installdir} ${base_libdir}/systemd"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
+FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 
 pkg_postinst_${PN} () {
-- 
1.8.3.2


