Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EEA69E00C3A; Thu, 24 Mar 2016 09:48:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BCCFE00C3D
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 09:48:45 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2OGmiq3014932
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2OGmiUw031546
	for <meta-ti@yoctoproject.org>; Thu, 24 Mar 2016 11:48:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 24 Mar 2016 11:48:43 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2OGmhsi013865;	Thu, 24 Mar 2016 11:48:43 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 24 Mar 2016 12:48:34 -0400
Message-ID: <1458838121-2846-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/7] Userspace LLD updates
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
X-List-Received-Date: Thu, 24 Mar 2016 16:48:53 -0000
Content-Type: text/plain

Jacob Stiffler (7):
  common-csl-ip: Bump SRCREV for fix
  cppi-lld: Bump SRCREV for fix
  pa-lld: Bump SRCREV for fix
  qmss-lld: Bump SRCREV for fix
  sa-lld: Bump SRCREV for fix
  nwal-lld: Bump SRCREV for fix
  mmap-lld: Upgrade to 2.0.0.7

 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 recipes-bsp/cppi-lld/cppi-lld.inc           | 6 +++---
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb   | 4 +++-
 recipes-bsp/mmap-lld/mmap-lld.inc           | 6 +++---
 recipes-bsp/nwal-lld/nwal-lld.inc           | 6 +++---
 recipes-bsp/pa-lld/pa-lld.inc               | 6 +++---
 recipes-bsp/qmss-lld/qmss-lld.inc           | 6 +++---
 recipes-bsp/sa-lld/sa-lld.inc               | 6 +++---
 8 files changed, 24 insertions(+), 22 deletions(-)

-- 
1.9.1


