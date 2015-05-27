Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 98A5FE00960; Wed, 27 May 2015 07:10:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66FACE004F6
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 07:10:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4REAgwi031593
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:10:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4REAgRA006227
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:10:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 09:10:42 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4REAgJH027888;	Wed, 27 May 2015 09:10:42 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 10:10:34 -0400
Message-ID: <1432735838-7207-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/4] Add CSL RTOS package.
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
X-List-Received-Date: Wed, 27 May 2015 14:10:48 -0000
Content-Type: text/plain

* and restructure common-csl-ip so that a common file may be used to
  specify source and version.

Jacob Stiffler (4):
  ti-paths: Add PDK_INSTALL_DIR for RTOS drivers.
  common-csl-ip: Seperate source and version into include file.
  common-csl-ip.inc: Add source revision for dra7xx.
  common-csl-ip-rtos: Add CSL RTOS package.

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   33 ++++++++++++++++++++
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |   18 +++++++++++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |   13 ++------
 recipes-ti/includes/ti-paths.inc                   |    3 +-
 4 files changed, 56 insertions(+), 11 deletions(-)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip.inc

-- 
1.7.9.5


