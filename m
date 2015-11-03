Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDFBCE009EF; Tue,  3 Nov 2015 11:47:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84B8EE007E4
	for <meta-ti@yoctoproject.org>; Tue,  3 Nov 2015 11:47:37 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3Jlb55014561
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:37 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JlaZC001282
	for <meta-ti@yoctoproject.org>; Tue, 3 Nov 2015 13:47:37 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:47:37 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA3Jla70022118;	Tue, 3 Nov 2015 13:47:36 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Nov 2015 14:47:06 -0500
Message-ID: <1446580053-16935-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/27] keystone llds: Clean up recipes
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
X-List-Received-Date: Tue, 03 Nov 2015 19:47:40 -0000
Content-Type: text/plain

Clean up the keystone LLD recipes and only install the device-specific
biaries on the supported machine.

Jacob Stiffler (27):
  aif2-lld: Clean up recipes
  common-csl-ip: Clean up recipes
  cppi-lld: Clean up recipes
  cppi-lld: Only build binaries relevent to the machine
  dfe-lld: Clean up recipes
  edma3-lld: Clean up recipes
  hplib: Clean up recipes
  hplib: Only build binaries relevent to the machine
  hyplnk-lld: Clean up recipes
  hyplnk-lld: Only build binaries relevent to the machine
  iqn2-lld:  Clean up recipes
  mmap-lld: Clean up recipes
  mmap-lld-test: Only build binaries relevent to the machine
  nwal-lld: Clean up recipes
  nwal-lld: Only build binaries relevent to the machine
  pa-lld: Clean up recipes
  pa-lld: Only build binaries relevent to the machine
  pktlib: Clean up recipes
  qmss-lld: Clean up recipes
  qmss-lld: Only build binaries relevent to the machine
  rm-lld: Clean up recipes
  sa-lld: Clean up recipes
  sa-lld-test: Only build binaries relevent to the machine
  srio-lld: Clean up recipes
  srio-lld: Only compatible with k2hk-evm
  traceframework: Clean up recipes
  traceframework: Only build binaries relevent to the machine

 recipes-bsp/aif2-lld/aif2-lld-test_git.bb          |  2 +
 recipes-bsp/aif2-lld/aif2-lld.inc                  | 17 ++++++--
 recipes-bsp/aif2-lld/aif2-lld_git.bb               |  2 +
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |  6 +--
 recipes-bsp/common-csl-ip/common-csl-ip.inc        | 19 ++++++---
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |  4 +-
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb          |  3 +-
 recipes-bsp/cppi-lld/cppi-lld.inc                  | 24 ++++++++---
 recipes-bsp/cppi-lld/cppi-lld_git.bb               | 20 +++++----
 recipes-bsp/cppi-lld/files/init_cppi.sh            | 47 ----------------------
 recipes-bsp/dfe-lld/dfe-lld-test_git.bb            |  2 +
 recipes-bsp/dfe-lld/dfe-lld.inc                    | 17 ++++++--
 recipes-bsp/dfe-lld/dfe-lld_git.bb                 |  2 +
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb        |  2 +-
 recipes-bsp/edma3-lld/edma3-lld.inc                | 13 ++++--
 recipes-bsp/edma3-lld/edma3-lld_git.bb             |  2 +-
 recipes-bsp/hplib/hplib-test_git.bb                |  2 +
 recipes-bsp/hplib/hplib.inc                        | 18 +++++++--
 recipes-bsp/hplib/hplib_git.bb                     |  2 +
 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh        | 43 --------------------
 recipes-bsp/hyplnk-lld/hyplnk-lld-test_git.bb      |  2 +
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc              | 30 ++++++++------
 recipes-bsp/hyplnk-lld/hyplnk-lld_git.bb           | 24 +++++------
 recipes-bsp/iqn2-lld/iqn2-lld-test_git.bb          |  2 +
 recipes-bsp/iqn2-lld/iqn2-lld.inc                  | 16 ++++++--
 recipes-bsp/iqn2-lld/iqn2-lld_git.bb               |  2 +
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb          | 10 +++--
 recipes-bsp/mmap-lld/mmap-lld.inc                  | 17 +++++---
 recipes-bsp/mmap-lld/mmap-lld_git.bb               |  2 +
 recipes-bsp/nwal-lld/nwal-lld-test_git.bb          |  2 +
 recipes-bsp/nwal-lld/nwal-lld.inc                  | 18 +++++++--
 recipes-bsp/nwal-lld/nwal-lld_git.bb               |  2 +
 recipes-bsp/pa-lld/files/init_pa.sh                | 47 ----------------------
 recipes-bsp/pa-lld/pa-lld-test_git.bb              |  2 +-
 recipes-bsp/pa-lld/pa-lld.inc                      | 27 ++++++++++---
 recipes-bsp/pa-lld/pa-lld_git.bb                   | 19 ++++-----
 recipes-bsp/pktlib/pktlib_git.bb                   | 13 ++++--
 recipes-bsp/qmss-lld/files/init_qmss.sh            | 47 ----------------------
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb          |  3 +-
 recipes-bsp/qmss-lld/qmss-lld.inc                  | 24 ++++++++---
 recipes-bsp/qmss-lld/qmss-lld_git.bb               | 22 +++++-----
 recipes-bsp/rm-lld/rm-lld_git.bb                   | 16 ++++++--
 recipes-bsp/sa-lld/sa-lld-test_git.bb              |  8 +++-
 recipes-bsp/sa-lld/sa-lld.inc                      | 18 ++++++---
 recipes-bsp/sa-lld/sa-lld_git.bb                   |  2 +
 recipes-bsp/srio-lld/srio-lld-test_git.bb          |  3 +-
 recipes-bsp/srio-lld/srio-lld.inc                  | 16 ++++++--
 recipes-bsp/srio-lld/srio-lld_git.bb               |  3 +-
 recipes-bsp/traceframework/traceframework_git.bb   | 19 +++++++--
 49 files changed, 329 insertions(+), 334 deletions(-)
 delete mode 100755 recipes-bsp/cppi-lld/files/init_cppi.sh
 delete mode 100755 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
 delete mode 100755 recipes-bsp/pa-lld/files/init_pa.sh
 delete mode 100755 recipes-bsp/qmss-lld/files/init_qmss.sh

-- 
1.9.1


