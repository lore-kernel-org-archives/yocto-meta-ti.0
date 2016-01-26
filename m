Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2A6CE00C25; Tue, 26 Jan 2016 13:17:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F552E00C13
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 13:16:58 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0QLGvmK022514
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0QLGvvw001380
	for <meta-ti@yoctoproject.org>; Tue, 26 Jan 2016 15:16:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 26 Jan 2016 15:16:57 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0QLGvUK012813;	Tue, 26 Jan 2016 15:16:57 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 26 Jan 2016 16:16:38 -0500
Message-ID: <1453843011-28530-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/13] OpenCL Dependency Upgrades
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
X-List-Received-Date: Tue, 26 Jan 2016 21:17:07 -0000
Content-Type: text/plain

* This patch set updates dependencies so that OpenCL may be upgraded
  and extended to support keystone SOCs

Jacob Stiffler (13):
  ti-cgt6x: Upgrade to version 8.1.0
  ti-cg-xml: Add version 2.41.00
  ti-pdk.bbclass: Add class for creating RTOS PDK components
  common-csl-ip: Upgrade to version 3.3.0.1B
  rm-lld: Seperate source info into .inc file
  rm-lld: Bump version to 02.02.00.00
  rm-lld-rtos: Add RTOS package of the RM LLD
  qmss-lld: Upgrade to version 2.1.0.12
  qmss-lld-rtos: Add RTOS package for QMSS LLD
  cppi-lld: Upgrade version to 2.1.0.11
  cppi-lld-rtos: Add RTOS package for CPPI LLD
  openmp-rtos: Add the OpenMP RTOS package
  gdbc6x: Extend support to keystone SOCs

 .../ti-pdk.bbclass                                 | 58 ++++++++++++-----
 .../common-csl-ip/common-csl-ip-rtos_git.bb        | 43 +++++--------
 recipes-bsp/common-csl-ip/common-csl-ip.inc        | 11 ++--
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |  6 ++
 .../cppi-lld-rtos_git.bb}                          | 16 ++---
 recipes-bsp/cppi-lld/cppi-lld.inc                  |  8 +--
 .../qmss-lld-rtos_git.bb}                          | 15 ++---
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb          |  4 +-
 recipes-bsp/qmss-lld/qmss-lld.inc                  | 14 +++--
 .../qmss-ld-fix-firmware-installation.patch        | 13 ++++
 .../rm-lld-rtos_git.bb}                            | 15 ++---
 recipes-bsp/rm-lld/{rm-lld_git.bb => rm-lld.inc}   | 35 ++---------
 recipes-bsp/rm-lld/rm-lld_git.bb                   | 24 +-------
 recipes-devtools/gdbc6x/gdbc6x.inc                 |  7 ++-
 .../devtools/ti-cg-xml_2.41.00.bb                  | 50 +++++++--------
 .../{ti-cgt6x_8.0.3.bb => ti-cgt6x_8.1.0.bb}       | 18 +++---
 recipes-ti/includes/ti-paths.inc                   |  4 ++
 .../openmp-rtos/openmp-rtos_git.bb                 | 72 +++++++++++++++-------
 18 files changed, 223 insertions(+), 190 deletions(-)
 copy recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb => classes/ti-pdk.bbclass (26%)
 copy recipes-bsp/{common-csl-ip/common-csl-ip_git.bb => cppi-lld/cppi-lld-rtos_git.bb} (6%)
 copy recipes-bsp/{common-csl-ip/common-csl-ip_git.bb => qmss-lld/qmss-lld-rtos_git.bb} (6%)
 create mode 100644 recipes-bsp/qmss-lld/qmss-lld/qmss-ld-fix-firmware-installation.patch
 copy recipes-bsp/{common-csl-ip/common-csl-ip_git.bb => rm-lld/rm-lld-rtos_git.bb} (6%)
 copy recipes-bsp/rm-lld/{rm-lld_git.bb => rm-lld.inc} (36%)
 copy recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb => recipes-ti/devtools/ti-cg-xml_2.41.00.bb (8%)
 rename recipes-ti/devtools/{ti-cgt6x_8.0.3.bb => ti-cgt6x_8.1.0.bb} (82%)
 copy recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb => recipes-ti/openmp-rtos/openmp-rtos_git.bb (5%)

-- 
1.9.1


