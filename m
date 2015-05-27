Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0DC84E009C5; Wed, 27 May 2015 09:20:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2F53E005B9
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:20:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4RGKLBL012292
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 11:20:21 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RGKLtM024899
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 11:20:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 11:20:21 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4RGKKkB001523;	Wed, 27 May 2015 11:20:21 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 12:20:14 -0400
Message-ID: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] Add EDMA3 LLD RTOS package.
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
X-List-Received-Date: Wed, 27 May 2015 16:20:27 -0000
Content-Type: text/plain

* and restructure edma3-lld so that a common file may be used to
  specify source and version.

Jacob Stiffler (3):
  edma3-lld: Seperate source and version into include file.
  edma3-lld: Update to version 2.12.01.21.
  edma3-lld-rtos: Add the EDMA3 LLD RTOS package.

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |   75 +++++++++++++++++++++++++++
 recipes-bsp/edma3-lld/edma3-lld.inc         |   10 ++++
 recipes-bsp/edma3-lld/edma3-lld_git.bb      |   11 +---
 3 files changed, 86 insertions(+), 10 deletions(-)
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld.inc
 mode change 100755 => 100644 recipes-bsp/edma3-lld/edma3-lld_git.bb

-- 
1.7.9.5


