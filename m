Return-Path: <sinthu.raja@mistralsolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D50BC47DA9
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 11:53:56 +0000 (UTC)
Received: from egress-ip12b.ess.de.barracuda.com (egress-ip12b.ess.de.barracuda.com [18.185.115.216])
 by mx.groups.io with SMTP id smtpd.web11.12696.1706529232825350632
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jan 2024 03:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mistralsolutions.com header.s=google header.b=PsKMemP0;
 spf=pass (domain: mistralsolutions.com, ip: 18.185.115.216, mailfrom: sinthu.raja@mistralsolutions.com)
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197]) by mx-outbound21-231.eu-central-1b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 29 Jan 2024 11:53:48 +0000
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1d8cd8315fbso15424595ad.1
        for <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 03:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mistralsolutions.com; s=google; t=1706529227; x=1707134027; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpAApPnT4lUjFULSD6bRYk5mmtYLQnPkDO55vSXaUsA=;
        b=PsKMemP0OwoBlnA0OngEnWf/gPPy0dIw1TujHfPWlDZhnRE3Yoe7/Tvvyo4/2+idz+
         O0kJmulSY/fc9TDHsp48MlGZ2u0n+VNivVKae06YqPUz3nH1HH86YtjdRysc0hYk/DuF
         kQNre8IIhV5rA52XVDmb5iczRM7RHta0n3kR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706529227; x=1707134027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpAApPnT4lUjFULSD6bRYk5mmtYLQnPkDO55vSXaUsA=;
        b=KKMROgZZH1KDsO6I5peED7QyeL9xkQFU0y89S9B2cb4WPyKsDapUI0F30KrAuTu+6c
         AvMDnMBvSwYkxvx5rVtziNRJijuneNQYK5S8rhSZDsIr2cLX6+oiPXDNz6tWfBNhUOwB
         XI2x0joZnK8rf6R60ukIoapEKJmbgSEQcvtVRTwygJVRXKC906qxU6xSW0z/cds2REaF
         8sDhKRoMDd/cELEs2GmWjTJPYaJkK7YBh9hyJ32wQcSGn29g/UDqxf+YGLjQvcj6O5TI
         /LssvcTOiSpICvgpANDXTM2aEiAfgolYs2PzG0V80ie0+TkOD55UHaR6eYDRraC0bDmd
         RpMA==
X-Gm-Message-State: AOJu0YyPKhaIKBFx1PtphJ2zGU2GlGqDK2F3QjJ1lUb9SRvlwTnerh8+
	WuKJHQXZ6eIL8UFOqXpm24rVYaOOLZKMPz2c3IKZFUHMWIu+p7W8dW7HRugYe045SVK1PdpZt3l
	FhE8H0gG8tX9CzMV9MJlB/YX3P50w4NTVaKD5kxi119ak8aPPppWZUTYd+NwlVkrvAgLFnQL4V8
	ybD2h3roa05DIonWGOnnAqkf4=
X-Received: by 2002:a17:902:d484:b0:1d8:ee30:aaac with SMTP id c4-20020a170902d48400b001d8ee30aaacmr1017303plg.69.1706529227674;
        Mon, 29 Jan 2024 03:53:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3AeC+KEHUBl8K7tt1YbNf482MtpVvDEXO+r76LPunhrIiqa+qnrr0pmnGWltJyrhwPLdU5A==
X-Received: by 2002:a17:902:d484:b0:1d8:ee30:aaac with SMTP id c4-20020a170902d48400b001d8ee30aaacmr1017291plg.69.1706529227316;
        Mon, 29 Jan 2024 03:53:47 -0800 (PST)
Received: from LAP568U.mistral.in ([106.51.227.150])
        by smtp.gmail.com with ESMTPSA id az10-20020a170902a58a00b001d7274cbd33sm5096391plb.121.2024.01.29.03.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 03:53:46 -0800 (PST)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: reatmon@ti.com,
	Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@lists.yoctoproject.org,
	Sinthu Raja <sinthu.raja@ti.com>
Subject: [meta-ti][kirkstone][PATCH 0/4] Add gstreamer 1.20
Date: Mon, 29 Jan 2024 17:23:38 +0530
Message-Id: <20240129115342.9321-1-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BESS-ID: 1706529228-305607-12458-3191-1
X-BESS-VER: 2019.1_20240125.1952
X-BESS-Apparent-Source-IP: 209.85.214.197
X-BESS-Parts: H4sIAAAAAAACA4uuVkqtKFGyUirNy1bSUcovVrIyNDExALIygILJqYlmqeaWRs
	mp5mZp5iYpycaWZskGpgZm5hapZhYWaUq1sQCvVy3rQQAAAA==
X-BESS-Outbound-Spam-Score: 0.40
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.253837 [from 
	cloudscan13-231.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.40 BSF_SC0_SA085b         META: Custom Rule SA085b 
	0.00 BSF_SC0_MISMATCH_TO    META: Envelope rcpt doesn't match header 
X-BESS-Outbound-Spam-Status: SCORE=0.40 using account:ESS91090 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND, BSF_SC0_SA085b, BSF_SC0_MISMATCH_TO
X-BESS-BRTS-Status: 1
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jan 2024 11:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17424

From: Sinthu Raja <sinthu.raja@ti.com>

Hi All,
This patch series add supports to gstreamer 1.20 plugins-bad for AM57x
platform and also it enables the mmip along with VPE and Ducati plugins.

RFC Patch: https://www.mail-archive.com/meta-arago@lists.yoctoproject.org/msg01680.html

Sinthu Raja (4):
  gstreamer1.0-plugins-bad: Add patches to support DRM allocator
  gst-plugins-ti: fetch gstreamer common project sources
  ti-test: Remove OAMP-DRM test
  branding-core: enable mmip for AM57x platform

 .../conf/distro/include/branding-core.inc     |   3 -
 .../conf/distro/include/branding-ltsprep.inc  |   3 -
 .../gstreamer1.0-plugins-ducati_git.bb        |   4 +
 .../gstreamer1.0-plugins-vpe_git.bb           |   4 +
 ...mallocator-Add-DRM-allocator-support.patch | 367 ++++++++++++++++++
 ...drm-and-tidss-in-the-list-of-drivers.patch | 160 ++++++++
 .../gstreamer1.0-plugins-bad_1.20.%.bbappend  |  15 +
 .../recipes-core/packagegroups/ti-test.bb     |   3 -
 8 files changed, 550 insertions(+), 9 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-gstdrmallocator-Add-DRM-allocator-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-kmssink-Add-omapdrm-and-tidss-in-the-list-of-drivers.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.%.bbappend

-- 
2.36.1


