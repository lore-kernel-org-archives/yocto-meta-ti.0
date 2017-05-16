Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63C67E00901; Tue, 16 May 2017 12:17:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 503FDE00710
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 12:17:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4GJHDAi004579
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 14:17:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494962233;
	bh=Sctu+VgXbt0hzj48A3ZiJuZZwpZuWloSmDlpIE1Tehk=;
	h=From:To:CC:Subject:Date;
	b=eOun79N1m7kvbsP0Y/GIVYC/9OM+B1AYwkoJuaagFu80cZ+j5r7r/dTvQgkR0PaOV
	GyQMMj7cdhvxC5IoEm5RdHJiqP5FI+Fk83P5lZ6/T+5guBeGByWuKbjaE0HXEzM41C
	fj8oHNsZLA1Ke/uU9DNYa7T1Y9KXueoGlpwGtFtc=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4GJHDvx029633
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 14:17:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 May 2017 14:17:12 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4GJHC7G013647;	Tue, 16 May 2017 14:17:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 16 May 2017 15:11:36 -0400
Message-ID: <1494961900-8068-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/4] Add c66x machines
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
X-List-Received-Date: Tue, 16 May 2017 19:17:16 -0000
Content-Type: text/plain

The ultimate goal of this patch set is the add the c66x machines.
Prior to this, there is some clean-up for the ti-pdk class and
relocation of the machine specific device lists into the machine
configuration files.


Jacob Stiffler (4):
  ti-pdk: clean up variables by adding TI_PDK_ prefix
  machines: add ti-pdk class variables
  recipes: remove ti-pdk device configuration
  c66x: add basic machine configuration

 classes/ti-pdk.bbclass                              | 18 ++++++++++--------
 conf/machine/am57xx-evm.conf                        |  4 ++++
 conf/machine/beaglebone.conf                        |  3 +++
 conf/machine/c665x-evm.conf                         |  9 +++++++++
 conf/machine/c667x-evm.conf                         |  9 +++++++++
 conf/machine/dra7xx-evm.conf                        |  4 ++++
 conf/machine/include/c66x.inc                       |  9 +++++++++
 conf/machine/include/k2e.inc                        |  4 ++++
 conf/machine/include/k2g.inc                        |  4 ++++
 conf/machine/include/k2hk.inc                       |  4 ++++
 conf/machine/include/ti33x.inc                      |  4 ++++
 conf/machine/include/ti43x.inc                      |  4 ++++
 conf/machine/k2l-evm.conf                           |  4 ++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 10 +---------
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb           |  5 -----
 recipes-bsp/pktlib/pktlib-rtos_git.bb               |  4 ----
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb           |  5 -----
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb               |  5 -----
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb       |  4 ----
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb       |  2 --
 20 files changed, 73 insertions(+), 42 deletions(-)
 create mode 100644 conf/machine/c665x-evm.conf
 create mode 100644 conf/machine/c667x-evm.conf
 create mode 100644 conf/machine/include/c66x.inc

-- 
2.7.4


