Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30E71E017F4
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 18:26:21 -0800 (PST)
Received: by mail-pd0-f180.google.com with SMTP id p10so382590pdj.11
	for <meta-ti@yoctoproject.org>; Wed, 06 Nov 2013 18:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=u2E4t4QR2c2OBS41pXsjdZntrl1ghPO6SKauRSSaotg=;
	b=jfaZyt+YS119F25NM6xkMPX73tcgdeQ1SCE9jQ68v2KrwpFag2gs7Ky0W2tOatHBru
	lbc7OieIj4aiTXOHfuuo0dHD5VXpl+X9gK+sWe9rLTzmvRv0RJYvyjpdZOqrX2OnzBeA
	ue/B3uGwf1Jv09YQ60ZrdiHOw7zpwtNDePdUJ8a0V+qJyV3dO2vzXDJWqgAhxZeYYOcq
	Wdd5DPnPO/sEhX6o10NXvQv8bjXAGF6s1jSl1AVqWdHSDrIzEuPEltQkGUgtdJf6pcvo
	rJBkH+9IIXVn0Vb9QhY2xL5YrImHSEf0hxTT29AsI4m66FME7ZHvK3ZmE8OK+Nse/jJ9
	y0/A==
X-Received: by 10.68.34.105 with SMTP id y9mr6438349pbi.15.1383791181603;
	Wed, 06 Nov 2013 18:26:21 -0800 (PST)
Received: from haswell.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id x8sm1215390pbf.0.2013.11.06.18.26.20
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 06 Nov 2013 18:26:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Wed,  6 Nov 2013 18:25:26 -0800
Message-Id: <1383791126-22557-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] adjust BBPATH to be a good citizen of layer world
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
X-List-Received-Date: Thu, 07 Nov 2013 02:26:25 -0000

Currently, meta-ti appears as first path in BBPATH
rest of layers append so lets do the same

helps distros with multiple BSP layers to include meta-ti

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index e39bd85..faa4ac0 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -1,5 +1,5 @@
 # We have a conf and classes directory, append to BBPATH
-BBPATH =. "${LAYERDIR}:"
+BBPATH .= ":${LAYERDIR}"
 
 # We have a recipes directory, add to BBFILES
 BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
-- 
1.8.3.2


