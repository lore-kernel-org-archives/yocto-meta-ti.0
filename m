Return-Path: <jpewhacker@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE149E009C8; Mon,  2 Apr 2018 12:47:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (jpewhacker[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.214.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4FD0E00843
	for <meta-ti@yoctoproject.org>; Mon,  2 Apr 2018 12:47:31 -0700 (PDT)
Received: by mail-it0-f66.google.com with SMTP id v194-v6so19727779itb.0
	for <meta-ti@yoctoproject.org>; Mon, 02 Apr 2018 12:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=hgEDOEA8BH0G7INnNULbhrGvesME3TBwd4Er3BJIVw0=;
	b=fl2Wj/nVhK+jX0VpwxTc8b9Ywa8mTIOQjfFP/sf2k094ETgcQ6yady7xLUN/g5kSfg
	RfEVFinB7+CqcOm6Y8rxP/dpXoV2T4d3dglyFczEoWwZpWjglpZ47NFVp9AHv4wNRpXS
	va6KAASOHPnDdBm9ICxozTByuNkJ5LoVM8dO0CS9Cj5duii0iv8k4nez8NbOqG0+XAOc
	3fNNDwl2cT27+7Wv595V6F8D4HLFWhO+MEMTFKNClbaDoEv+2GvLmtoZbSo+TNGTqmqx
	+epQT1Jy1SgBdntskPrjpvd2jt/cUOmvKfUWL3qizzbpzeJOnIJRnt220ylUEjkBQ6T1
	pq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hgEDOEA8BH0G7INnNULbhrGvesME3TBwd4Er3BJIVw0=;
	b=n4xz/4eyjPxVGxKKwbghzPezTeVgNdcoBPCC4qkvS4WvB26QoZBJAv/FVw3xH7Sctm
	Q3W+3qcgRuA0HtnryA6LmNIIy1+sxZLl/qwbwlivp2ZxNgBnUUE2mz3MhwZ1Uu6GaA1H
	9rCl3wx/tkkrTZHl6xFBFTj8G7NDljgsG6MrIeSzpb1BXk2MbdvEGKsifixiCcdmhoDu
	+v8G9Jwl/eMivyjZzQbK8zeSBlY1iUIEW0ZwW7cK9275Eg4J0rrDNrEJ+MoFGg17iAnA
	YAp9xJhoby3AMoNFiCrv1UQ+oL4zIZXGPAf+kNo2A987pIqi/al2HyLfFa78Hsemxfcn
	9evg==
X-Gm-Message-State: AElRT7Hk+6ELv0iM8ZcEQuM5W4/jTMH62FJjhEre8cxWphSPJgs/bZhI
	la+id4mifE1kIrfv2dRPMAb8horh
X-Google-Smtp-Source: AIpwx48kDM+cSgfZ2jWmVgcl32VvYFUL+XwO0j65qLVu0BS9gr7lHzgtqLo8/rF89H13EttEnrD5mQ==
X-Received: by 2002:a24:1c49:: with SMTP id c70-v6mr2478513itc.1.1522698450391;
	Mon, 02 Apr 2018 12:47:30 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	u77-v6sm691915ita.30.2018.04.02.12.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 02 Apr 2018 12:47:29 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: meta-ti@yoctoproject.org
Date: Mon,  2 Apr 2018 14:47:28 -0500
Message-Id: <20180402194728.21389-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
Subject: [morty/rocko/master][PATCH] ti-pdk: Weakly assign PARALLEL_XDC
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
X-List-Received-Date: Mon, 02 Apr 2018 19:47:32 -0000

Allowing it to be overridden in local.conf

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 classes/ti-pdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 540a665c..0b0c9ffe 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -63,7 +63,7 @@ TI_PDK_DOXYGEN_SUPPORT ?= "1"
 
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
-PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+PARALLEL_XDC ?= "--jobs=${BB_NUMBER_THREADS}"
 PARALLEL_MAKE = ""
 
 def get_doxygen_support(d):
-- 
2.14.3


