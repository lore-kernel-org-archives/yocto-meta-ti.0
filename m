Return-Path: <schnitzeltony@googlemail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3BCCE009A6; Thu,  8 May 2014 04:27:01 -0700 (PDT)
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
	*      [74.125.83.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 418 seconds by postgrey-1.32 at yocto-www;
	Thu, 08 May 2014 04:26:56 PDT
Received: from mail-ee0-f41.google.com (unknown [74.125.83.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25CDAE006EF
	for <meta-ti@yoctoproject.org>; Thu,  8 May 2014 04:26:56 -0700 (PDT)
Received: by mail-ee0-f41.google.com with SMTP id t10so1643544eei.28
	for <meta-ti@yoctoproject.org>; Thu, 08 May 2014 04:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=QAQmMfBq29k4yiNH1mdYUg+R2b7W/5W7X5c4zUzjPhs=;
	b=i9NVSLwo4ABVB1d92SaU7dRIkBMZirtgemKLcLfTOd5z08UD1LlXY4lulH8K9QhV0s
	KCT7SfrSWXP7tmACZPwSVcGddOHRp6T5TbkbqijR2vzhK5vMjuBSKkD8A7GmgM3zzkaG
	NkZjBHr0746vS9lZhGG5PRpAj4O8q2br1PpuUY9z8S/qioNHPM0EwSsrUc3nSIvs/H9q
	Qkarh2vKNlYU/CIDwJSmff4NbDrc5wwZbZtLO3fsVpax5EmuSDRtbPkSBctbbm7crWK/
	yuU7HCJ03EQE0rgcKd49rVEa1enopOocBsxfBK447tVkjUN7fhar2EBqPku+yarqx7o/
	5Hfg==
X-Received: by 10.14.7.65 with SMTP id 41mr4713924eeo.100.1399547997800;
	Thu, 08 May 2014 04:19:57 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-162.unitymediagroup.de.
	[178.200.247.162])
	by mx.google.com with ESMTPSA id x45sm3611636eef.15.2014.05.08.04.19.56
	for <meta-ti@yoctoproject.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 04:19:57 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Thu,  8 May 2014 13:19:48 +0200
Message-Id: <1399547988-9135-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399547988-9135-1-git-send-email-schnitzeltony@googlemail.com>
References: <1399547988-9135-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] formfactor: : remove PRINC
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
X-List-Received-Date: Thu, 08 May 2014 11:27:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

last oe-core PR-bump was commited May 2nd

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-bsp/formfactor/formfactor_0.0.bbappend | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-bsp/formfactor/formfactor_0.0.bbappend b/recipes-bsp/formfactor/formfactor_0.0.bbappend
index 491d403..72d991c 100644
--- a/recipes-bsp/formfactor/formfactor_0.0.bbappend
+++ b/recipes-bsp/formfactor/formfactor_0.0.bbappend
@@ -1,2 +1 @@
-PRINC := "${@int(PRINC) + 1}"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.8.3.1


