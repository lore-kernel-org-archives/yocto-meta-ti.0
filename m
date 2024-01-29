Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DAAC47DA9
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 11:54:06 +0000 (UTC)
Received: from egress-ip12a.ess.de.barracuda.com (egress-ip12a.ess.de.barracuda.com [18.184.203.235])
 by mx.groups.io with SMTP id smtpd.web10.13016.1706529237150246174
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 03:53:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=NJGZrwg2;
 spf=pass (domain: mistralsolutions.com, ip: 18.184.203.235, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199]) by mx-outbound11-134.eu-central-1a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Jan 2024 11:53:54 +0000
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5c659339436so1365431a12.2
        for <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 03:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1706529232; x=1707134032; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRtm+e/lg4VjMRqilLFSuQA76cnMlKZB0kL4L4JNWpo=;
        b=NJGZrwg2gfN+kUBYMjp8ntjpNgfk4KDPrrmqMOtImih2pLY3n0LMYlv161BJt9JNDE
         KzfryD0gMt/LyumoKRfXvRk80Tte8zuyazV3jtazBJJz54c9n4Z+FK1bbMDMVSR5d5ti
         rpo31BcOCH91WRifW5X4Wa2zg2YaVewymHDdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529232; x=1707134032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRtm+e/lg4VjMRqilLFSuQA76cnMlKZB0kL4L4JNWpo=;
        b=b2IvxIvmNIZnYBpC5L15Pu3d4x2zvoN6kDdeCWcmTKPkKPV5is+omOMe5bNcocDlYw
         7t4HS8s1J2dwD6ht0pKkiO9/l5cnx3mxZeEZWzTc3jlFN59W06k3WPA/WXZJXTMfI8jk
         KIjswE2BAc9et0nD/DMJKvLzf5+9JqnFx0AVI3ny1gQSj0FM1xdDL6PHG96Bwrp+r8pl
         vLHeih7uVutFNJdjy9BrM896boHfH/fKym2HGWox3q0wVbcqvjEiepZmEWRVuIL1Aqvk
         CL4cuAqTUdUw8itjHaUrYmsS2cZ9uwCYWVwuMycp2FMy7u0+rrSZkOXIc6lMzqjkTXMi
         8pBQ==
X-Gm-Message-State: AOJu0Yyl+bkJ3O5eimzzcxFboTMWQc0KQkYcM0ICz9w0A/c6tpRkAU0y
	UOUVggVGusFC6Biq9/WTW7jkL8zJ35gtmUmOcSj/IEwXTOHxk4BMwkWFFOGEi5J6Is5lE0VgAI7
	DYXQDh40I8fpYaZcFAyn74gmGr2WXVV1xm+Gm/o8lWdBu+huFtr162s8VFPbJDqR1EVQvD6qvuA
	HGokSd8lGZ1iE0grhm5og1DvfvCUclpSc=
X-Received: by 2002:a17:902:6b03:b0:1d8:cbcf:2150 with SMTP id o3-20020a1709026b0300b001d8cbcf2150mr1683052plk.81.1706529232314;
        Mon, 29 Jan 2024 03:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwNpv7O7AV1Fpo+grv6XZifw/tUIsLZDAysrLFKU6ooZqXuDmpTsk4hWlRcrJCtRMtF5R0Bw==
X-Received: by 2002:a17:902:6b03:b0:1d8:cbcf:2150 with SMTP id o3-20020a1709026b0300b001d8cbcf2150mr1683042plk.81.1706529231996;
        Mon, 29 Jan 2024 03:53:51 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001d7274cbd33sm5096391plb.121.2024.01.29.03.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:53:51 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/4] gst-plugins-ti: fetch gstreamer common project sources
Date: Mon, 29 Jan 2024 17:23:40 +0530
Message-Id: <20240129115342.9321-3-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20240129115342.9321-1-sinthu.raja@ti.com>
References: <20240129115342.9321-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1706529233-302950-12647-3372-1
X-BESS-VER: 2019.1_20240125.1952
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIytDQwB7IygILJyUaJFpbJqQ
	YmFuYpxolJxmYWqYaJxqbGhmkpJgYmSUq1sQCQv3FQQQAAAA==
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253837 [from 
	cloudscan16-131.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 11:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17425

From: Sinthu Raja <sinthu.raja@ti.com>

fetch gstreamer common project sources by adding "common" tree to
SRC_URI and set the corresponding SRCREV.

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb         | 4 ++++
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb            | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index 1ff2dfb0..a648d2b7 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -18,4 +18,8 @@ SRC_URI = " \
     file://0001-gstducati-configure.ac-stop-using-export-symbols-reg.patch \
 "
 
+SRC_URI += "git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common"
+
+SRCREV_common = "011bcc8a0fc7f798ee874a7ba899123fb2470e22"
+
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 237031b1..c624baa4 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -15,3 +15,7 @@ SRCREV = "b9dba5a8bc7d14d55125abdce04672e3dc30bbdf"
 SRC_URI = "git://git.ti.com/git/glsdk/gst-plugin-vpe.git;protocol=https \
            file://0001-gstvpe-configure.ac-stop-using-export-symbols-regex.patch \
 "
+
+SRC_URI += "git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;name=common"
+
+SRCREV_common = "011bcc8a0fc7f798ee874a7ba899123fb2470e22"
-- 
2.36.1


