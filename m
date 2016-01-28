Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45C10E00A92; Thu, 28 Jan 2016 06:41:16 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15659E0088B
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 06:41:14 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0SEfDN4012846
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:13 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0SEfDOQ029292
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 08:41:13 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 Jan 2016 08:41:13 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0SEfDl9029208;	Thu, 28 Jan 2016 08:41:13 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jan 2016 09:41:00 -0500
Message-ID: <1453992071-23149-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/11] LLD Upgrades
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
X-List-Received-Date: Thu, 28 Jan 2016 14:41:16 -0000
Content-Type: text/plain

Upgrade LLDs to the latest versions

Jacob Stiffler (11):
  aif2-lld: Upgrade to version 1.2.0.1
  dfe-lld: Upgrade to version 1.0.0.7
  hyplnk-lld: Bump SRCREV
  iqn2-lld: Upgrade to version 1.0.0.10
  mmap-lld: Upgrade to version 2.0.0.6
  nwal-lld: Upgrade to version 02.01.00.09
  pa-lld: Upgrade to version 03.00.01.07
  pktlib: Upgrade to version 2.1.0.6
  sa-lld: Upgrade to version 03.00.00.12
  srio-lld: Upgrade to version 02.00.00.14
  traceframework: Upgrade to version 01.01.01.08

 recipes-bsp/aif2-lld/aif2-lld.inc                | 8 ++++----
 recipes-bsp/dfe-lld/dfe-lld.inc                  | 8 ++++----
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc            | 6 +++---
 recipes-bsp/iqn2-lld/iqn2-lld.inc                | 8 ++++----
 recipes-bsp/mmap-lld/mmap-lld.inc                | 8 ++++----
 recipes-bsp/nwal-lld/nwal-lld.inc                | 8 ++++----
 recipes-bsp/pa-lld/pa-lld.inc                    | 8 ++++----
 recipes-bsp/pktlib/pktlib_git.bb                 | 8 ++++----
 recipes-bsp/sa-lld/sa-lld.inc                    | 8 ++++----
 recipes-bsp/srio-lld/srio-lld.inc                | 8 ++++----
 recipes-bsp/traceframework/traceframework_git.bb | 8 ++++----
 11 files changed, 43 insertions(+), 43 deletions(-)

-- 
1.9.1


