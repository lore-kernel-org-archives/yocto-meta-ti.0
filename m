Return-Path: <eballetbo@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3CFBFE00878; Wed,  8 Oct 2014 06:48:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.212.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A8FB5E0084F
	for <meta-ti@yoctoproject.org>; Wed,  8 Oct 2014 06:48:07 -0700 (PDT)
Received: by mail-wi0-f175.google.com with SMTP id d1so10614137wiv.14
	for <meta-ti@yoctoproject.org>; Wed, 08 Oct 2014 06:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=from:to:cc:subject:date:message-id;
	bh=q3fh24r6s5mzkFNdA5jDxE9V6TRlBRpNZ6DQYl2c1xA=;
	b=QlFFQmZa1V2nmU2GXMwKS9vbaJlQ8LBNwyuFa/kgGax/khoFX8xQEqMVQ0QWyYSilp
	s5kHIGPYxxOPERf1Ie35773FDJn9s/tgjXhgW58l7nC6oDhJFrYIGg6rlbYkr7E9pt3O
	4kQGV57sfhqMOYP3y2EmHZjGI1T4IraTuz9/AbkOiKHa1S4uxvQ5w36+t71sdygdPnEU
	kZr5v4Fl8s/N5HFZmdHrfAiVL96rDAYIXnAAcR9h8tDie4jcVJVBmSo0+mnFEJf7VpMz
	atuYa3yvIgv5wi6fVkPxOCkb+RwH5+RUdmYlH6Jgi3JR9S8fn0KWg4W0w7ofOwniCRtj
	v5Dw==
X-Received: by 10.194.89.225 with SMTP id br1mr11961707wjb.51.1412776086462;
	Wed, 08 Oct 2014 06:48:06 -0700 (PDT)
Received: from localhost.localdomain (43.Red-2-139-180.staticIP.rima-tde.net.
	[2.139.180.43])
	by mx.google.com with ESMTPSA id p1sm158375wjy.22.2014.10.08.06.48.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Oct 2014 06:48:05 -0700 (PDT)
From: Enric Balletbo i Serra <eballetbo@iseebcn.com>
To: meta-ti@yoctoproject.org,
	ebutera@gmail.com,
	martinez.javier@gmail.com
Date: Wed,  8 Oct 2014 15:47:43 +0200
Message-Id: <1412776066-4991-1-git-send-email-eballetbo@iseebcn.com>
X-Mailer: git-send-email 1.9.1
Cc: Enric Balletbo i Serra <eballetbo@iseebcn.com>
Subject: [PATCH 0/3] Fix dsp related packages for new kernels
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
X-List-Received-Date: Wed, 08 Oct 2014 13:48:15 -0000

Hi all,

According to the README I know that probably these packages are unmaintained,
but these packages are still used for some of us with newer kernels. This patch
series fixes some build problems found when I tried to build this infrastructure
with a 3.17 kernel. With these patches I'm able to build and run dsplink examples
and gstreamer-ti to encode/decode some videos using the DSP.

If you don't have any inconvenient maybe would be interesting add these patches.

Cheers,

Enric Balletbo i Serra (3):
  ti-dmai: Fix build with recent kernels and compilers.
  ti-dsplink: Fix irq mismatch for kernel versions greater than 3.7.0.
  ti-linuxutils: Fix build problems for kernel up to 3.17

 .../dmai/ti-dmai/remove-unneeded-includes.patch    | 26 ++++++++++
 recipes-ti/dmai/ti-dmai_svn.bb                     |  3 +-
 recipes-ti/dsplink/ti-dsplink.inc                  |  2 +-
 ...splink_1_65_kernel_3_7_0_fix-irq-mismatch.patch | 16 ++++++
 recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb        |  1 +
 recipes-ti/linuxutils/ti-linuxutils.inc            |  2 +-
 .../linuxutils_2_26-cmemk-fixes.patch              | 59 ++++++++++++++++++++++
 .../linuxutils_2_26-sdmak-fixes.patch              | 25 +++++++++
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |  5 +-
 9 files changed, 135 insertions(+), 4 deletions(-)
 create mode 100644 recipes-ti/dmai/ti-dmai/remove-unneeded-includes.patch
 create mode 100644 recipes-ti/dsplink/ti-dsplink/dsplink_1_65_kernel_3_7_0_fix-irq-mismatch.patch
 create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-cmemk-fixes.patch
 create mode 100644 recipes-ti/linuxutils/ti-linuxutils/linuxutils_2_26-sdmak-fixes.patch

-- 
1.9.1


