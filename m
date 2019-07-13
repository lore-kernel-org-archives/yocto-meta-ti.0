Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 981F2E00B3E; Fri, 12 Jul 2019 17:43:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.196 listed in list.dnswl.org]
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A88EE00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:36 -0700 (PDT)
Received: by mail-pf1-f196.google.com with SMTP id g2so5033189pfq.0
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 17:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=X9B6w6GiliO858oSCFLyTlK4GTR+CZ07xC9A8fpkg1Y=;
	b=i3sJfgosgXy9O6C9nRcNAqEo0e/DhEyX/4W7qrlWJSUE0nn2OUjTCdUq2LbsxWj79f
	KzsuF8u9P4wryf3epaCUufr6Yjz6oSdDQqnhwOmxmlaAVn65oWLKc+Lz++1kCVC3Zfdv
	RwMrwNetg6wGoe+RZntOmDWJsNCADlfvMMEWQfN5LgmulSLhZEzSlarWYAA9uJk5zj+Q
	YFdE2TF3eZLsTTTnt74gwHP/oLa8lrebFKvuAXPLgRDDt4AVcst7Ylp8iwogWbc0XZpu
	X6m7zefrRu3PL/3j6fGa17QGa+0ukalvh1FSV8cS4FWSRLkoXZaqsNvAxMbu8JJ+Nr/x
	LzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X9B6w6GiliO858oSCFLyTlK4GTR+CZ07xC9A8fpkg1Y=;
	b=bmzDuJs1JOkW6jIDcDQpO/K0SoeVQHTL1p+piWxqBOv59H+sJMUSl+WpqXdUMtkGRl
	nwO3qsEprTav4Kvd7YRBSX+vq99iDq4uy/dKypn3Qe62XUaXTUG6G94DD8JP0IQA7GFI
	qcNhPZPvclP/W7jUS/wsIDyBVbsJ8+DvnfQKGUPfW8ZvZeFutFiAcZe4yGCxiZ73pqDD
	Noobj9JbL/+nEUW9GmzHr88gMVOmUeEqh7WZ0aggHDk+P2LMBpoXK9yRPuFBAkIUUG7i
	n8b6p7flZhjBT11V7BA+LgY2XJOJRmlEhaqWY0hdWoKbk4bRdJ/i7wlC0KIgneR5zUF4
	RSZQ==
X-Gm-Message-State: APjAAAUqmPKlfVcLTqaBZ6q47uNZvN+teqYLenReccvVL+DF9yp6HSwE
	653/R+CANy59tu7bvvEU+4gYn2MWT6s=
X-Google-Smtp-Source: APXvYqxp1/EalXCxzFmp3eSVwCeHQ/iSyUm+Ic5u1vJ+ct4MpYajpBeti4842RfLAoki5zOGdAB46w==
X-Received: by 2002:a63:6507:: with SMTP id z7mr13600262pgb.186.1562978616120; 
	Fri, 12 Jul 2019 17:43:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	j19sm10547303pgn.19.2019.07.12.17.43.34
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 17:43:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Jul 2019 17:43:23 -0700
Message-Id: <20190713004324.12695-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713004324.12695-1-raj.khem@gmail.com>
References: <20190713004324.12695-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] jailhouse: Replace tabs with spaces in python code
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
X-List-Received-Date: Sat, 13 Jul 2019 00:43:37 -0000
Content-Transfer-Encoding: 8bit

Fixes
WARNING: python should use 4 spaces indentation, but found tabs in jailhouse_git.bb, line 85

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 753664ed..db31bb7d 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -82,10 +82,10 @@ do_compile() {
 }
 
 python __anonymous () {
-	d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
-	initrd = d.getVar('INITRAMFS_IMAGE', True)
-	if initrd:
-		d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+        d.appendVarFlag('do_install', 'depends', ' virtual/kernel:do_deploy')
+        initrd = d.getVar('INITRAMFS_IMAGE', True)
+        if initrd:
+                d.appendVarFlag('do_install', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
 }
 
 do_install() {
-- 
2.22.0


