Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FBCCE00A96; Fri, 12 Jul 2019 18:00:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.214.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 241A6E009EA
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 18:00:05 -0700 (PDT)
Received: by mail-pl1-f196.google.com with SMTP id c14so5558594plo.0
	for <meta-ti@yoctoproject.org>; Fri, 12 Jul 2019 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EFvZSPdjDR1Kz3XXtFuX3eNnzi3EkPMj3MGhDABH3S4=;
	b=SpcidajHFtSzIJin/Ei3INhq5m931cWDEX2GqBeLlzSQW+OsSBtLRH9VmIffaFtyGh
	8bhby9YpcDd5gKpFd8+sK19+eB64msJv3szdlipplrtz/ldhU+9HMPfSe6xrYV69nesy
	PTDMX5ABN7hxfz/eEWL8tH1G62/uhOWJ5z82YD/BKzXnzeAbAyaXOko7MTKw3uCRVrgX
	vUQO2wCnU/PoL3jFWBYZvnNfK41C43e0DTYskuwurYzmTgvTDHly+uz/1DcNOtQlwArr
	FEhCIpfT2mRByp5khRpBVSCij0Ma3h4tDe8x6ZAVGSE2KVqzPJTjLMqQ4dRSA5zj7713
	wmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EFvZSPdjDR1Kz3XXtFuX3eNnzi3EkPMj3MGhDABH3S4=;
	b=OUErA7mRVdiNPAjKgKnlV31pstWvTQWiMyEregNH3a0rNjFYV0aEkWAsSYHPNtyhzM
	FRvJh7r7faAm77i0GFBysYng8TRRY/lOkNg46pl6v1X76PZd4TRQceIMIB2AyY0phtib
	zFgpIUScR9J22sCHtJ1+HbrR/NPMgkXX9YrElWIIeWT9WbuaifT0akak4EZI2gyv8nCv
	y2kHcytF2xN6rKj0szZd0ngICau6WwIdnsjPqeoelZ4LitfU0/rfN0Mq8a2Jee68mZUg
	3i8IIvUNmHDpgveGkonnGspNR020IoXB8rEuxWOsDIKIRhWssK3DXJqJt+v6g6EhohEO
	D8mQ==
X-Gm-Message-State: APjAAAWWhQZpNp161jESjOklNeakAjZ4Fs1VnrjDnvbKBsJLmMPRVFdG
	jW7kCHHDiOeeFmnjb90WT/KVpd2wJCw=
X-Google-Smtp-Source: APXvYqy4LIhiDTXS0HguEmom9a2lqy4k1EjoHGN74o5HbTznIWTNJs9GWayEJHDaA/wfBDOWGKzc6g==
X-Received: by 2002:a17:902:b08a:: with SMTP id
	p10mr15236368plr.83.1562979604271; 
	Fri, 12 Jul 2019 18:00:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	b68sm14017194pfb.149.2019.07.12.18.00.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 18:00:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Jul 2019 17:59:54 -0700
Message-Id: <20190713005955.6870-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/2] amx3-cm3: Use COMPATIBLE_MACHINE instead of COMPATIBLE_HOST
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
X-List-Received-Date: Sat, 13 Jul 2019 01:00:05 -0000
Content-Transfer-Encoding: 8bit

This represents it correctly in package arch as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
index b9a3b0fa..79166ca9 100644
--- a/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
+++ b/recipes-bsp/cm3-pm-firmware/amx3-cm3_git.bb
@@ -24,5 +24,5 @@ do_install() {
 }
 
 FILES_${PN} += "${base_libdir}/firmware"
-COMPATIBLE_HOST ?= "null"
-COMPATIBLE_HOST_ti-soc = "(.*)"
+
+COMPATIBLE_MACHINE = "(ti-soc)"
-- 
2.22.0


