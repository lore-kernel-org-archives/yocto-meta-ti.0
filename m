Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFA77E009DA; Mon, 18 May 2015 10:33:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FE9EE0094C
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 10:33:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4IHWxvO019242
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:32:59 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4IHWxTv031056
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 12:32:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 12:32:59 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4IHWx5O023023;	Mon, 18 May 2015 12:32:59 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 13:32:53 -0400
Message-ID: <1431970376-24163-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] gdbc6x 1.1.0
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
X-List-Received-Date: Mon, 18 May 2015 17:33:02 -0000
Content-Type: text/plain

* The gdbc6x utility provides remote gdb capabilities for C6x DSP
  cores.

Jacob Stiffler (3):
  gdbserverproxy-module-drv: Add version 1.1.0
  gdbserver-c6x: Add version 1.1.0
  gdbc6x: Add version 1.1.0

 recipes-devtools/gdbc6x/gdbc6x.inc                 |    9 ++++
 recipes-devtools/gdbc6x/gdbc6x/init                |   48 ++++++++++++++++++++
 recipes-devtools/gdbc6x/gdbc6x_git.bb              |   48 ++++++++++++++++++++
 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb       |   46 +++++++++++++++++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb        |   31 +++++++++++++
 5 files changed, 182 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x.inc
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/init
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x_git.bb
 create mode 100644 recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
 create mode 100644 recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb

-- 
1.7.9.5


