Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF1FAE00B93; Tue, 25 Oct 2016 17:09:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.195 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F32EE00B93
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:09:04 -0700 (PDT)
Received: by mail-pf0-f195.google.com with SMTP id n85so1810239pfi.3
	for <meta-ti@yoctoproject.org>; Tue, 25 Oct 2016 17:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=G9H2rZQijVMVb0+Cq4l2F65LTy4uaf066PXvey1vwis=;
	b=mse4qHZ+zt27ZsDpDZLRky566RnJ8RFqZzV1LaDttkxn0CGr6FAhDvQsw0ATvnZMRP
	5rsaHexo1a8NSi7ocLq04FHPtUqX0Q5BG04kENmK5TazsL3DKQizg5mFXJf77K29Rmfe
	XScFK2M3l3b2GZmoOHICR9qTihFBHputUIg1FS+PqncXYkqvM1oJ8fMyxOHqNxypeTuL
	nUC95EeLaFHbc4MBrQjpCoeNSd90nsZr9emzgcrKGGKCeqNs3s+gmgWZuaIf6btsNF+5
	9lU3fLvQn7v+wGsSoLEPX4zivUz7Atxlm+P2mcuUB3qskDwalh7QBwfljmTWmlx86Mxi
	lY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G9H2rZQijVMVb0+Cq4l2F65LTy4uaf066PXvey1vwis=;
	b=GlRgZAUgeVoh6dK8fKGYyOzA7ddRRLYJGv7VB3UHt348+NgCkj8su+peswFXX78acn
	29pJEMSUQ3wRzF6v/RMYGfqquqoloOLGCvsHxsfMJtbn5wkOr3UUBAuRSxDAQ685xZP5
	I0j7GFUDf8XQs3nekiidKOHwCPb2akoxT3yhpBin5CF9dt6FfDf4LIxJox+nD/B9r5ME
	nSlfSsv/dnaRMm+Sh8JHKgZetErCPK83ocKxjpB3sG5cfoAlCcJfiaq8flrqT4h0/IG/
	UcRsElxK22Hhnw4d4Xi41Y0yHPPCKg0hAgZw/p6L3ZBT2bHmiWhPc3e3r1QONaQ33CsT
	YXKA==
X-Gm-Message-State: ABUngvfRH29A9EKkRh3A7FK/+vbCgSbYWK4q7u4GS5sZcTBSKn+Ink2sprLpR8fQ94baxQ==
X-Received: by 10.99.173.75 with SMTP id y11mr37198406pgo.130.1477440543688;
	Tue, 25 Oct 2016 17:09:03 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	d142sm35937867pfd.33.2016.10.25.17.09.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Oct 2016 17:09:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 25 Oct 2016 17:08:57 -0700
Message-Id: <20161026000857.10015-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] ti-unpack.inc: Use absolute paths in require directive
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
X-List-Received-Date: Wed, 26 Oct 2016 00:09:06 -0000

This helps in using this inc file from other BSP
layers which are dependent on meta-ti

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/includes/ti-eula-unpack.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/includes/ti-eula-unpack.inc b/recipes-ti/includes/ti-eula-unpack.inc
index 912cd18..ead0610 100644
--- a/recipes-ti/includes/ti-eula-unpack.inc
+++ b/recipes-ti/includes/ti-eula-unpack.inc
@@ -9,7 +9,7 @@
 #  TI_BIN_UNPK_WDEXT  - This variable extends workdir path, if user wants to put
 #                       the output in some internal directory
 
-require ../includes/ti-unpack.inc
+require recipes-ti/includes/ti-unpack.inc
 
 TI_BIN_UNPK_ARGS = "--mode console"
 
-- 
2.10.1


