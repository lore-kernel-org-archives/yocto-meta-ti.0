Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EE7EE009A5; Fri, 20 Sep 2019 15:57:39 -0700 (PDT)
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
	*      [209.85.215.194 listed in list.dnswl.org]
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D0BBE00867
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 15:57:37 -0700 (PDT)
Received: by mail-pg1-f194.google.com with SMTP id n190so4669632pgn.0
	for <meta-ti@yoctoproject.org>; Fri, 20 Sep 2019 15:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=54abdmNNmiuqBbSnL3KiuM5ByXMe8gjL2xY3w4Vpw8o=;
	b=J3FGFBAs6B/icRrDd3R7RwxPyLDbr4fEr5G1iHGC2Nee5JaEWpcbtPdrb4mSCyK9fH
	lc3wDJ5bCKnqYqbesgvebkSPWk4+arVenGdZ/+jc6nR9qtUPci5mxjcGgVNIB7pU1YJv
	hnwClDfP6KeO71LAk/ElClVVeLh/BOJ4eUkAdJ8UZmG24SGuW4obMJQWO3qQKVG+Gv1b
	rlGoYJfUmr2mQN9UbWPYCoB320ThpYB/AzzTVctjttHpZPFg9FJBTBm8LY+sToHOjgVH
	RhpV+1JukOHyCCwI5V+d3BIHDBc823UXufMVC64lZpi4KC79QIIsk1Itj7SvYH3Mn7AM
	iJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=54abdmNNmiuqBbSnL3KiuM5ByXMe8gjL2xY3w4Vpw8o=;
	b=T76U0uUejoNudjBiCBRKooHddd0zIuVyRLPg6ZxlMZvYkpedekfhkiZLSwxCm3uLoA
	EcyG/Vb4vbNhifJsdsiprcdPlyzersKrXTkdU2pdFqoeHh8TY+h/yU+Ya6SsCGLdzmPw
	1bNNWbCUvKKGJ6t8PWRRfyHvMoNocPuCRPy6BJHSUHyNAk4MKCjMQGVSDA1Q9GppImkj
	pwN8/PrrLx3/hbRfRVY+Cd3kG52sIODZu82srOg26zrtyau8FugXEjghHZMMnRKVOJzg
	WmOu2Wy1o36Herq+XnkJbNtUOdYpRDUmNyVlrFfL1wxUx9hVCeO4Lz0VcGTm1DkH3qZ8
	JbCA==
X-Gm-Message-State: APjAAAWqftg1klGIXM4iVk+um26I1/i+rMIXORtNXghl1ucwfUoXy+O7
	SnHrWjlIe3ExMPC1oH5PJ+M+huEDWVw=
X-Google-Smtp-Source: APXvYqysmYsELG5Bm0a6sOgp0bNX5a6oOG/bjlhle7nAbTPPxq13xNoSlcGxc4TtPuZ8+sb6wzGquw==
X-Received: by 2002:a62:3844:: with SMTP id f65mr20789503pfa.142.1569020256304;
	Fri, 20 Sep 2019 15:57:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3])
	by smtp.gmail.com with ESMTPSA id t9sm2588982pgj.89.2019.09.20.15.57.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 15:57:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Sep 2019 15:57:28 -0700
Message-Id: <20190920225728.1967683-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] uim: Rename to uim-sysfs
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
X-List-Received-Date: Fri, 20 Sep 2019 22:57:39 -0000
Content-Transfer-Encoding: 8bit

There is a uim recipe clash with meta-oe layer where uim recipe is
pre-existing see [1]

[1] http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/uim/

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-connectivity/uim/{uim_8.5.bb => uim-sysfs_8.5.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-connectivity/uim/{uim_8.5.bb => uim-sysfs_8.5.bb} (100%)

diff --git a/recipes-connectivity/uim/uim_8.5.bb b/recipes-connectivity/uim/uim-sysfs_8.5.bb
similarity index 100%
rename from recipes-connectivity/uim/uim_8.5.bb
rename to recipes-connectivity/uim/uim-sysfs_8.5.bb
-- 
2.23.0


