Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56D50E00CA6; Mon, 21 Mar 2016 07:51:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07457E00951
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 07:51:17 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2LEpGL8015168
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:16 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2LEpGVw001297
	for <meta-ti@yoctoproject.org>; Mon, 21 Mar 2016 09:51:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Mar 2016 09:51:16 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2LEpFkj000744;	Mon, 21 Mar 2016 09:51:16 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 21 Mar 2016 10:51:03 -0400
Message-ID: <1458571873-12889-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/10] Userspace LLD component upgrades
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
X-List-Received-Date: Mon, 21 Mar 2016 14:51:21 -0000
Content-Type: text/plain

Upgrade userspace LLDs with latest versions available

Jacob Stiffler (10):
  common-csl-ip: Upgrade to version 3.3.0.2A
  rm-lld: Upgrade to version 2.2.0.1
  qmss-lld: Upgrade to version 2.1.0.14
  cppi-lld: Upgrae to version 2.1.0.12
  hyplnk-lld: Upgrade to version 2.1.0.6
  pa-lld: Upgrade to version 3.0.1.8
  sa-lld: Upgrade to version 3.0.0.13
  srio-lld: Update to version 2.0.0.15
  traceframework: Bump SRCREV for fix
  openmp-rtos: Bump version for hotfix

 recipes-bsp/common-csl-ip/common-csl-ip.inc              |  8 ++++----
 recipes-bsp/cppi-lld/cppi-lld.inc                        |  6 +++---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc                    |  8 ++++----
 recipes-bsp/pa-lld/pa-lld.inc                            | 10 +++++-----
 recipes-bsp/qmss-lld/qmss-lld.inc                        | 16 +++++-----------
 .../qmss-lld/qmss-ld-fix-firmware-installation.patch     | 13 -------------
 recipes-bsp/rm-lld/rm-lld.inc                            |  6 +++---
 recipes-bsp/sa-lld/sa-lld.inc                            | 10 +++++-----
 recipes-bsp/srio-lld/srio-lld.inc                        |  6 +++---
 recipes-bsp/traceframework/traceframework_git.bb         |  6 +++---
 recipes-ti/openmp-rtos/openmp-rtos_git.bb                |  4 ++--
 11 files changed, 37 insertions(+), 56 deletions(-)
 delete mode 100644 recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch

-- 
1.9.1


