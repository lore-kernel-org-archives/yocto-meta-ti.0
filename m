Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ea0-f182.google.com (mail-ea0-f182.google.com
	[209.85.215.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DE1EE016D6
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 02:29:48 -0700 (PDT)
Received: by mail-ea0-f182.google.com with SMTP id o10so1064610eaj.27
	for <meta-ti@yoctoproject.org>; Thu, 24 Oct 2013 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=VpuIr+Njy4MZMhLSY85luaS1jXoMlhxp7xhU5i9v4nM=;
	b=FlNQSnKnJJK37DXhe87ySA2k+jHUsf0+bEgdLfD1FaPgQx9UzU2hY7DxdrLqeQwmM1
	KWyBMv7rfl2LXRIUYLcQvAIOs6C832+Ee4niTIceXd4JKxlqRghDWOfI2JZKXy4iX0tV
	eKZbzx/cURAEsowlb989ixs1TtLhIkn/m/UM4mQKyFQJrKtBzLj0syEnfLO2seyWmxHk
	OWSNmieSAx53Np5Q/Mdxs3Ubqw0PjnzuFQDG0qP9YjfnOIME+g/8pd0Lci0bhRA/dtnY
	IaDQQcrPGq7YPfRrzMcwPySF5vkmEza7fNnM82SNeMM3ANzAt9SNIHXgwBjS560c5DNP
	7J6A==
X-Received: by 10.14.213.133 with SMTP id a5mr577346eep.133.1382606986938;
	Thu, 24 Oct 2013 02:29:46 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id i1sm2059297eeg.0.2013.10.24.02.29.45
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Oct 2013 02:29:46 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Thu, 24 Oct 2013 11:29:38 +0200
Message-Id: <1382606978-9914-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] mesa appends: remove PROVIDES
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
X-List-Received-Date: Thu, 24 Oct 2013 09:29:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These came in when mesa was reworked. Nowadays they are useless and what
they try to do achieve is wrong: provider for virtual/libgsl should be
mesa-gl. The appends were left in to avoid backward revision trouble in
package feeds.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-graphics/mesa/mesa-omap3-common.inc | 7 -------
 recipes-graphics/mesa/mesa_9.1.6.bbappend   | 3 ++-
 recipes-graphics/mesa/mesa_git.bbappend     | 3 ++-
 3 files changed, 4 insertions(+), 9 deletions(-)
 delete mode 100644 recipes-graphics/mesa/mesa-omap3-common.inc

diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
deleted file mode 100644
index 0340770..0000000
--- a/recipes-graphics/mesa/mesa-omap3-common.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-
-# avoid providing conflicts for libgles-omap3 compatibles
-PROVIDES_omap3 = "virtual/libgl"
-PROVIDES_ti814x = "virtual/libgl"
-PROVIDES_ti816x = "virtual/libgl"
-PROVIDES_ti33x = "virtual/libgl"
diff --git a/recipes-graphics/mesa/mesa_9.1.6.bbappend b/recipes-graphics/mesa/mesa_9.1.6.bbappend
index 164ec1b..8445337 100644
--- a/recipes-graphics/mesa/mesa_9.1.6.bbappend
+++ b/recipes-graphics/mesa/mesa_9.1.6.bbappend
@@ -1 +1,2 @@
-require mesa-omap3-common.inc
+PRINC := "${@int(PRINC) + 1}"
+
diff --git a/recipes-graphics/mesa/mesa_git.bbappend b/recipes-graphics/mesa/mesa_git.bbappend
index 164ec1b..8445337 100644
--- a/recipes-graphics/mesa/mesa_git.bbappend
+++ b/recipes-graphics/mesa/mesa_git.bbappend
@@ -1 +1,2 @@
-require mesa-omap3-common.inc
+PRINC := "${@int(PRINC) + 1}"
+
-- 
1.8.3.1


