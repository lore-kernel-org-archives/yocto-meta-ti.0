Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4708FE00B65; Fri, 12 Jul 2019 18:00:06 -0700 (PDT)
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
	*      [209.85.214.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
	[209.85.214.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2988E009EA
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 18:00:05 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id y8so5558676plr.12
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BJsMyCjM2IY+gdUeEel1ZavDR8T79CsLp4lBkXUwhus=;
	b=DOstTsVyoxGgZWK7IwzMHLgOG74ekzFs9c6HMVPJeppiTHw3/Zotf1mFNQPLK/9cXZ
	lOaC1gwRw18rk0iPDe/HB8W/3285gHCpogXRvpMYFBEIDVbS+U9Y9KKKRpKWNEs59vpI
	ka/CmT1IBQiZHajxAH17Fdkv2vpwNkAJeWiZ9BbaUReCAVP7uaiwL98yUghY6QIUY2oS
	ZEq6Um31x9c5yAxtYjqcNnJjIMZA1ezgJV4sG2db/386WGoGxM17YxjzwpKMKJNgeiWZ
	VfCawEmt2iWhcd1tkvA9mmsddeTd2zjoCRIArovVVGYNX1EkImKT/3/J/YRyRxENhcuw
	EnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BJsMyCjM2IY+gdUeEel1ZavDR8T79CsLp4lBkXUwhus=;
	b=SvjsdEyomP+oeyBZ8/tmgay/y3AOGxuja5rLKGCdTPPSeX5qSqwXf/eppkJCHhtWkP
	UA9t9lZ2MQj6Zvnli5IaL1SbXSIsvBmBbTDedh9W/GzqzqsfP8nfbqx1gvxS2fX8kYMf
	Fy35+jMuQtkp2oOXHuk+sgaRYCJQgMBAGuUIMAcCjlo3jflRmK5Bv2fTTQ2HQP9BxdXm
	PX9zMtI1Cnmw0aRAamLn7HjOriV5MBh+WMjQ7k26Fm7SDhEmqDoKSTlS/zZOcByO3hf2
	+XFMiXagTNkmGftJ2/U66lNi0lt6Y3BwpW7vYngUZqM17ocGm7MPK/7wk8S1Bgl53UGT
	LPRQ==
X-Gm-Message-State: APjAAAV9q2s8dpqXvAGt4te2s4NIl2mNCriNq6MytpPz0JXRpQZfn0YE
	P00WfUSI0I9YlIB9ZA8239sBH8NY3Rg=
X-Google-Smtp-Source: APXvYqxLwI4Nt7+4QBQ1gGu8FcqmZAMm0OAIJvu5RUSacQa4AVd/lCRzNeZ/UdeYuax6EjuzyOUsbw==
X-Received: by 2002:a17:902:9f81:: with SMTP id
	g1mr14771443plq.17.1562979604911; 
	Fri, 12 Jul 2019 18:00:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	b68sm14017194pfb.149.2019.07.12.18.00.04
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 18:00:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Jul 2019 17:59:55 -0700
Message-Id: <20190713005955.6870-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713005955.6870-1-raj.khem@gmail.com>
References: <20190713005955.6870-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] amx3-cm3,u-boot-ti: Pin to gcc compiler
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
X-List-Received-Date: Sat, 13 Jul 2019 01:00:06 -0000
Content-Transfer-Encoding: 8bit

Using clang as default compiler fails to build these
since these packages explicitly asks for gcc as compiler
this ensures that we meet that demand

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 2 ++
 recipes-bsp/u-boot/u-boot-ti.inc            | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index 79166ca9..196b11b9 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -26,3 +26,5 @@ do_install() {
 FILES_${PN} += "${base_libdir}/firmware"
 
 COMPATIBLE_MACHINE = "(ti-soc)"
+TOOLCHAIN = "gcc"
+
diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index b66a7a6f..36746826 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -370,3 +370,6 @@ do_deploy_append_keystone () {
 		fi
 	fi
 }
+
+TOOLCHAIN = "gcc"
+
-- 
2.22.0


