Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39332E009DA; Mon, 18 May 2015 10:24:52 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B898EE0094C
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:24:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHOknl014238
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:24:46 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHOko2024043
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:24:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:24:46 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHOj1C026575;	Mon, 18 May 2015 12:24:46 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:24:39 -0400
Message-ID: <1431969882-24031-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] dsptop 1.2.0
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
X-List-Received-Date: Mon, 18 May 2015 17:24:52 -0000
Content-Type: text/plain

The dsptop utility provides a top-like interface for observing the DSP
resource usage in realtime.

The following package are added by this patch set:

* debugss-module-drv
  - Kernel module which facilitates communication between user space
    and the DSP cores.
* libulm: Usage and Load Monitor (ULM) Implementation
  - ARM and DSP libraries required to enable dsptop.
* dsptop
  - User space application which provides the top-like interface to
    monitor DSP resources in realtime.

Jacob Stiffler (3):
  debugss-module-drv: Add version 1.2.0
  libulm: Add ULM library for ARM and DSP.
  dsptop: Add version 1.2.0

 recipes-bsp/dsptop/debugss-module-drv_git.bb |   22 +++++++++++++
 recipes-bsp/dsptop/dsptop.inc                |    9 ++++++
 recipes-bsp/dsptop/dsptop_git.bb             |   27 ++++++++++++++++
 recipes-bsp/dsptop/libulm_git.bb             |   43 ++++++++++++++++++++++++++
 4 files changed, 101 insertions(+)
 create mode 100644 recipes-bsp/dsptop/debugss-module-drv_git.bb
 create mode 100644 recipes-bsp/dsptop/dsptop.inc
 create mode 100644 recipes-bsp/dsptop/dsptop_git.bb
 create mode 100644 recipes-bsp/dsptop/libulm_git.bb

-- 
1.7.9.5


