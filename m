Return-Path: <tom.rini@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B152CE004D2
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:36:57 -0700 (PDT)
Received: by obbef5 with SMTP id ef5so3534775obb.35
	for <meta-ti@yoctoproject.org>; Fri, 23 Mar 2012 10:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=QD7RqCN0Z3ar3xkgKMYMH3my9LKWACewaXSXpzFaGf4=;
	b=jXxbSeI0TpOgvV9sP47uYWK9XF/HBqDSASeqSeQ+111R4trdQMyVG7V6CQ/TWa7HfM
	6BD9bjk3Ik8FJqGXIzBfzhs9R3Atd+T86WvykSINZ3HYWB9AP1xUSiSm2cnCsP0c5nQH
	zyrebX/oTiYMxN/+uzRIYcz9eJh2egrJwe6hIeagh6abBlFLqIaytX4iEj1AHCLV+Fmj
	ZFNKp83Rl4wjFLdigRG7aLNTClWx2Bjm70AYai6C8H9NK8ur1QlOnmHi7L0lDcaWjMCL
	7s+UW0TjXGwLCVUmYWnOEyYGw72cfvGYxcxt8GiqjoYLw5G6eoJgsOs1FY02FPuRnteT
	yBKg==
Received: by 10.60.3.6 with SMTP id 6mr4968417oey.35.1332524217189;
	Fri, 23 Mar 2012 10:36:57 -0700 (PDT)
Received: from localhost.localdomain (ip68-230-54-74.ph.ph.cox.net.
	[68.230.54.74])
	by mx.google.com with ESMTPS id d9sm8324697obq.0.2012.03.23.10.36.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 10:36:56 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Mar 2012 10:36:54 -0700
Message-Id: <1332524217-27534-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1331235244-5173-1-git-send-email-trini@ti.com>
References: <1331235244-5173-1-git-send-email-trini@ti.com>
Subject: [PATCH v2 1/4] am37x-evm.conf: Use '=' not '?=' in IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 23 Mar 2012 17:36:57 -0000

As per
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-March/019772.html
a machine conf file should use '=' to set IMAGE_FSTYPES.

Signed-off-by: Tom Rini <trini@ti.com>
---
 conf/machine/am37x-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am37x-evm.conf b/conf/machine/am37x-evm.conf
index e4170f4..bc97930 100644
--- a/conf/machine/am37x-evm.conf
+++ b/conf/machine/am37x-evm.conf
@@ -16,7 +16,7 @@ require conf/machine/include/omap3.inc
 
 # Ship all kernel modules
 
-IMAGE_FSTYPES ?= "jffs2 tar.bz2"
+IMAGE_FSTYPES = "jffs2 tar.bz2"
 EXTRA_IMAGECMD_jffs2 = "-lnp -e 0x20000 -s 2048"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-- 
1.7.0.4


