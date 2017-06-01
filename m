Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D42F5E00B51; Thu,  1 Jun 2017 08:33:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74C39E00992
	for <meta-ti@yoctoproject.org>; Thu,  1 Jun 2017 08:33:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v51FXSKH008023
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496331208;
	bh=r27tx1NvGeov5Zt53sormM15uV+sOBqK0+Ey+ppgKZg=;
	h=From:To:CC:Subject:Date;
	b=qc0ENwR/DQOs1CKLgNy+jlAnbo/T3zESlCO/NSTAvKn+KoQ70FHPbLlSLldd1uWtZ
	9jbWVb2yYJwoxQQ0TTiPHlMom/GH7+Mw7iSzNyll32zo+kZEjOJ+YQMRLYrUJAAJK6
	gTrXJj1I+gGbc9PkBolP3PceCU0qo9zvRWt+4qMA=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v51FXSiZ014396
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:33:27 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v51FXRvI026013;	Thu, 1 Jun 2017 10:33:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Jun 2017 11:27:50 -0400
Message-ID: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH v3 0/6] Add c66x machines
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
X-List-Received-Date: Thu, 01 Jun 2017 15:33:30 -0000
Content-Type: text/plain

The ultimate goal of this patch set is the add the c66x machines.
Prior to this, there is some clean-up for the ti-pdk class and
relocation of the machine specific device lists into the machine
 configuration files.

v3 changes:
* Add ti-pdk-build-rtos fix
* Enhance the ti-pdk class to limit the cores built

Jacob Stiffler (6):
  ti-pdk-build-rtos: set PACKAGE_ARCH to MACHINE_ARCH
  ti-pdk: clean up variables by adding TI_PDK_ prefix
  ti-pdk: limit the set of cores to build
  machines: add ti-pdk class variables
  recipes: remove ti-pdk device configuration
  c66x: add basic machine configuration

 classes/ti-pdk.bbclass                             | 27 +++++++++++++++-------
 conf/machine/am57xx-evm.conf                       |  4 ++++
 conf/machine/beaglebone.conf                       |  3 +++
 conf/machine/c665x-evm.conf                        |  9 ++++++++
 conf/machine/c667x-evm.conf                        |  9 ++++++++
 conf/machine/dra7xx-evm.conf                       |  4 ++++
 conf/machine/include/c66x.inc                      |  9 ++++++++
 conf/machine/include/k2e.inc                       |  4 ++++
 conf/machine/include/k2g.inc                       |  4 ++++
 conf/machine/include/k2hk.inc                      |  4 ++++
 conf/machine/include/ti33x.inc                     |  4 ++++
 conf/machine/include/ti43x.inc                     |  4 ++++
 conf/machine/k2l-evm.conf                          |  4 ++++
 .../common-csl-ip/common-csl-ip-rtos_git.bb        | 10 +-------
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb          |  5 ----
 recipes-bsp/pktlib/pktlib-rtos_git.bb              |  4 ----
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb          |  5 ----
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb              |  5 ----
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb      |  4 ----
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb      |  2 --
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb   |  3 ++-
 21 files changed, 84 insertions(+), 43 deletions(-)
 create mode 100644 conf/machine/c665x-evm.conf
 create mode 100644 conf/machine/c667x-evm.conf
 create mode 100644 conf/machine/include/c66x.inc

-- 
2.7.4


