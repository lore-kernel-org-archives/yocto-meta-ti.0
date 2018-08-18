Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69067E0086B; Fri, 17 Aug 2018 18:02:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F002BE00828
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2018 18:02:45 -0700 (PDT)
Received: by mail-pl0-f65.google.com with SMTP id a4-v6so928161plm.13
	for <meta-ti@yoctoproject.org>; Fri, 17 Aug 2018 18:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=lNHZ/fVmLHccOuOumkQpIxEAtIVBObf/62QEfiMuZ3g=;
	b=VE4Vt73wBZAzyXYvauUlDmUYAqxTnyyaHB3cTKRNciHDVeNSywEbqUoVWke8sYU0Vd
	cCWFzNTmWnV+9actBUVviQ250NJAoXj3CUuUntXMG4l0DtYCGYKvKbw76XWKi9ewUeuT
	imvyZnthrqxK49fj4wXhK0hMUdZF+UdxxaJzj7R8v0w/lx0kfc7PFkC3+XBspU6ieyqL
	pwSbhU0MxckmuqcWHh6715tCUQ4lvRIfBfa1VjgZjSQ4Dl3qcdG7uPYE+18kEMNChhsr
	JReJLbyqBOWLiCTGNsv8sXZlIX9G+90vcXT3eUF92I8b09y1eMTyBpxP5JROupQ7R04H
	+/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lNHZ/fVmLHccOuOumkQpIxEAtIVBObf/62QEfiMuZ3g=;
	b=MJhloXrKwurk7ZXpGlSwI+ZahMblLOq3ONB8FKR2fWCan04EJudyGnbmbc07tGmlhC
	B8bBIRNCusFaYS88WklXjUukunfyUYzc0tjwmGztuwS/+joE+iMbH0SqF6b2/U6kN5On
	LshLrsSjeNLlVfe0G0jVeEfsDkI2xHSsJSGwt4k3ZGvnnnbJeojPtneQ1B/ON0UHrZGx
	/TuGO8l+qfOmtOLV/EYXy0FMT1vsrqAn8Zgi1Y7ec3iRcGQfJzbwKsWVgsWiH7vMwiiN
	OeBA1h1NQIu5DxbrnqlElr+J4gi3pt1MpsXrvM2AOPgIDmmxZG6j5KRBSjhTp0qbaLAB
	X8ZA==
X-Gm-Message-State: AOUpUlGisazSzZqtkNZ5TDkeGnhVjvnYMsdII/cgw9TWFBDOUXqmmTeU
	blwxTgEjwMmaDCZ2u6UeM8loWU+X
X-Google-Smtp-Source: AA+uWPxkzbKFi353L3rIqMdMkvENnAsqrFZDFonlLiQV3PIftGDXNQcJfy898/xCSn3cPrjK+iSJ+A==
X-Received: by 2002:a17:902:aa83:: with SMTP id
	d3-v6mr35611270plr.242.1534554165429; 
	Fri, 17 Aug 2018 18:02:45 -0700 (PDT)
Received: from localhost.localdomain (163-47-106-116.flip.co.nz.
	[163.47.106.116]) by smtp.gmail.com with ESMTPSA id
	h190-v6sm171016pge.18.2018.08.17.18.02.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Aug 2018 18:02:44 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sat, 18 Aug 2018 13:02:23 +1200
Message-Id: <1534554143-16256-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [rocko][sumo][master][PATCH] u-boot-ti: add UBOOT_GIT_URI, UBOOT_GIT_PROTOCOL variable
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
X-List-Received-Date: Sat, 18 Aug 2018 01:02:46 -0000

This is to allow user to override git repository and git protocol.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 recipes-bsp/u-boot/u-boot-ti.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index 61bf990..f22fcb4 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -22,7 +22,9 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
 BRANCH ?= "master"
-SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
+UBOOT_GIT_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git"
+UBOOT_GIT_PROTOCOL = "git"
+SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 
 PV_append = "+git${SRCPV}"
 
-- 
2.7.4


