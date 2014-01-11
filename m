Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (mail-pb0-f44.google.com
	[209.85.160.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C4D6E007EC
	for <meta-ti@yoctoproject.org>; Sat, 11 Jan 2014 02:53:24 -0800 (PST)
Received: by mail-pb0-f44.google.com with SMTP id rq2so5482385pbb.31
	for <meta-ti@yoctoproject.org>; Sat, 11 Jan 2014 02:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yrb0L/4btqKRHzlZHAJzCjtgS3siZjC3ZagAqzM7Mg8=;
	b=Zdumva7DjLy6MCApcwc+abyM/Ml/+A4EoVJyUHxF54SGmNM5mFB6oF3zMzydSpeZsS
	ZsLW95PL4yZ6vva7gi3paF6xmgN50PHKCuZSXpEeIS3ZGJkXtvDDsv5jiWE5geXyMPU5
	w3uJ14LV9IUxvDksRNxqqQKn67d0LR5NrqTmsP92vpCIE2c1+tY1RvPLbc8r5yEZzcIZ
	a+MmbUd3nvztljUUu2oFVL3wSWyXmen0qr+DjDyB9U+HAdJzLedYA69aDftOfRpnT25g
	0+DHcnme4YtBzsatq8GKrlURmZGKhylPTTDHfWrVwb+oBkiYfT2+3fHPtj+85rhxJYlw
	65eg==
X-Received: by 10.66.154.169 with SMTP id vp9mr17422890pab.39.1389437603796;
	Sat, 11 Jan 2014 02:53:23 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id ki1sm23805738pbd.1.2014.01.11.02.53.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jan 2014 02:53:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sat, 11 Jan 2014 02:53:44 -0800
Message-Id: <1389437624-5567-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] mesa-omap3-common.inc: Add missing virtual/mesa in PROVIDES
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
X-List-Received-Date: Sat, 11 Jan 2014 10:53:25 -0000

We shave too much here, this lands into trouble of pulling mesa-gl
to provide virtual/mesa since we overwrote mesa to just provide
virtual/libgl and nothing else, this patch will fix the errors where
both mesa and mesa-gl will be pulled when building a recipe that demands
virtual/libgl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-graphics/mesa/mesa-omap3-common.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
index 0340770..e8daaa6 100644
--- a/recipes-graphics/mesa/mesa-omap3-common.inc
+++ b/recipes-graphics/mesa/mesa-omap3-common.inc
@@ -1,7 +1,7 @@
 PRINC := "${@int(PRINC) + 1}"
 
 # avoid providing conflicts for libgles-omap3 compatibles
-PROVIDES_omap3 = "virtual/libgl"
-PROVIDES_ti814x = "virtual/libgl"
-PROVIDES_ti816x = "virtual/libgl"
-PROVIDES_ti33x = "virtual/libgl"
+PROVIDES_omap3 = "virtual/libgl virtual/mesa"
+PROVIDES_ti814x = "virtual/libgl virtual/mesa"
+PROVIDES_ti816x = "virtual/libgl virtual/mesa"
+PROVIDES_ti33x = "virtual/libgl virtual/mesa"
-- 
1.8.5.2


