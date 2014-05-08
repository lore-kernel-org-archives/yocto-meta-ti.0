Return-Path: <schnitzeltony@googlemail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4FAB3E009A6; Thu,  8 May 2014 04:28:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (schnitzeltony[at]googlemail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [74.125.83.46 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from mail-ee0-f46.google.com (unknown [74.125.83.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD0F7E006EF
	for <meta-ti@yoctoproject.org>; Thu,  8 May 2014 04:28:10 -0700 (PDT)
Received: by mail-ee0-f46.google.com with SMTP id t10so1605679eei.19
	for <meta-ti@yoctoproject.org>; Thu, 08 May 2014 04:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=EoRFUlbvBvDM0g7zkD6uG0xKH2u7g5zL4/m3Feui+L4=;
	b=dKrmR6CMpyWxBQeoMeOFclVo2jbc7M0qnHE38ravHaxJEKrRYUhjE3TmjpFEVvwTGG
	4LxzMLhvTz6FmsSybQYwqK4Iqkea6xgUf91FSqdOmYlcOfMRbpgCvchzackYHrTULpKX
	p0tb9BHQXSD5niPMn8CcfP1y7Rwst0vdzml1sKSbDxyrDOJxYmnxlCj4s1dYm6DxOL9V
	fFSCGRvAFsIRxCC/dnb2aoN3gM8b0C3l8n+Bl1RK4Ra9muFOmjE16N/roVwuECQMvtbt
	d2wk/yYNPpckC+fhOu8X7qS71IuA13znvZrkmko78ei8PTT9w2vu0w95A7R00VtsHVvl
	1SlQ==
X-Received: by 10.14.184.130 with SMTP id s2mr4795234eem.34.1399547996715;
	Thu, 08 May 2014 04:19:56 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-162.unitymediagroup.de.
	[178.200.247.162])
	by mx.google.com with ESMTPSA id x45sm3611636eef.15.2014.05.08.04.19.55
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 04:19:56 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 May 2014 13:19:47 +0200
Message-Id: <1399547988-9135-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/2] xserver-xf86-config_0.1: remove PRINC
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
X-List-Received-Date: Thu, 08 May 2014 11:28:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

last oe-core PR-bump was commited May 2nd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
index 491d403..72d991c 100644
--- a/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
+++ b/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bbappend
@@ -1,2 +1 @@
-PRINC := "${@int(PRINC) + 1}"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.8.3.1


