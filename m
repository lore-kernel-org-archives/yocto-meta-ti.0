Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 68990E00998; Sun, 29 Sep 2019 08:43:48 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.215.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DF921E00998
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 08:43:47 -0700 (PDT)
Received: by mail-pg1-f196.google.com with SMTP id i14so5884080pgt.11
	for <meta-ti@yoctoproject.org>; Sun, 29 Sep 2019 08:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=UFbPfBSTHA+x1tqbR+irT7dgKc7xdPh+C8I6RHJcuQ8=;
	b=rbgjf7eIA9wN+0qw5FR5iPOwBhmS8iLyn9bYfcQB7uIeBRlAgZj3cOIpHMisR4hOC9
	n/z/usJZepAQQTfJ2ERjUVi7zcGvsMxC+l7WVMVcRVlF85Pbkd/qxcHTj298tkWj7UMx
	Qmp4+bbv/VkDolXJBREndSp0Ue4hNwmaPoWLy/zK1F12oB3plukGT3J0mylR/xplCX/v
	7rLvIpVHseVp1rfHQNzzqsqegDfx7IDMVbIfFN4IDe8/nECSU1BGfRhayDTNVr3Mgq9u
	EhJL9S3RhXaXcu/5lX0MVhf9g6OW+yimHwwylSA543DHHu5IPojmeQcZCnaMPO3OnUdu
	lIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=UFbPfBSTHA+x1tqbR+irT7dgKc7xdPh+C8I6RHJcuQ8=;
	b=LEGIaFwI+qYFrj716yHUF1fWxvy9Tm9VabTnBrvA8jShsHZCZNBmrmRBx9f4An2Iyz
	wlnD1AIjWbUtw5KCl/KhzKMqaC5edJVFusvNrp1BNXDj0t/86eBb1u0hg6CvuCCwuceM
	8LKb8b+o+KENnqfZhS9jc3jBQns+Nos5z1LeknGxnK/iVYbB2AkwRu1Z/G96331+poBE
	rB4P7vcYSxmSflL5UuI5TwVQpQh7wCu+9bKHV9QubHRKOB3pNA7NPbEmg21FNWQsBt3j
	Tv/J2aBMCAbv01ZeUkyzI3yhELDpz5gvkEngP2jsQP/il+7S6GSsJFpM47Sskj3oMd5Q
	WLxA==
X-Gm-Message-State: APjAAAVpTi2wcphzucS1Bj75FqBELEX5Y+pYKcWDnW2AKK/aKmxElteL
	zS8zKqVav5ScYdNZUHfRmf2LP6m3aBc=
X-Google-Smtp-Source: APXvYqzeKa1mGuJV+vlh7ys5qpyi8uTtbvSniCUS6EC6fTQ//WOaxPNQvOc9V/rw8fexhW972EJ11A==
X-Received: by 2002:a62:a509:: with SMTP id v9mr15980419pfm.180.1569771826615; 
	Sun, 29 Sep 2019 08:43:46 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	x20sm11059284pfp.120.2019.09.29.08.43.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 08:43:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Sep 2019 08:43:34 -0700
Message-Id: <20190929154335.2646732-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190929154335.2646732-1-raj.khem@gmail.com>
References: <20190929154335.2646732-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] recipes-ti: Use COMMON_LICENSE_DIR instead of COREBASE
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
X-List-Received-Date: Sun, 29 Sep 2019 15:43:48 -0000
Content-Transfer-Encoding: 8bit

Fixes
beaglebone-capes-1.0-r4 do_populate_lic: ${COREBASE}/LICENSE is not a valid license file, please use '${COMMON_LICENSE_DIR}/MIT' for a MIT License file in LIC_FILES_CHKSUM. This will become an error in the future

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-ti/beagleboard/beaglebone-capes.bb | 2 +-
 recipes-ti/beagleboard/gadget-init.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-capes.bb b/recipes-ti/beagleboard/beaglebone-capes.bb
index 30b985b5..569a3e5a 100644
--- a/recipes-ti/beagleboard/beaglebone-capes.bb
+++ b/recipes-ti/beagleboard/beaglebone-capes.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Userspace setup for beaglebone capes"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=b97a012949927931feb7793eee5ed924 "
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 PR = "r4"
 
diff --git a/recipes-ti/beagleboard/gadget-init.bb b/recipes-ti/beagleboard/gadget-init.bb
index 8b899c51..b546efbb 100644
--- a/recipes-ti/beagleboard/gadget-init.bb
+++ b/recipes-ti/beagleboard/gadget-init.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Units to initialize usb gadgets"
 PR = "r19"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
2.23.0


