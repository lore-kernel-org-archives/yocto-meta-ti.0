Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EDFE0E00BEB; Tue, 20 Sep 2016 12:32:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E032E00BE1
	for <meta-ti@yoctoproject.org>; Tue, 20 Sep 2016 12:32:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D1F2452A93; Tue, 20 Sep 2016 19:32:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160920193203.D1F2452A93@arago-project.org>
Date: Tue, 20 Sep 2016 19:32:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine, recipes: introduce k2e SOC family
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
X-List-Received-Date: Tue, 20 Sep 2016 19:32:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 939b243286d83fadd364d1e0b575d71aee14affd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=939b243286d83fadd364d1e0b575d71aee14affd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep 21 01:29:01 2016 +0000

conf/machine,recipes: introduce k2e SOC family

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/k2e.inc                       |    2 ++
 conf/machine/k2e-evm.conf                          |    2 +-
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    3 +--
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb          |    2 +-
 recipes-bsp/cppi-lld/cppi-lld.inc                  |    2 +-
 recipes-bsp/dsptop/debugss-module-drv_git.bb       |    2 +-
 recipes-bsp/hplib/hplib.inc                        |    2 +-
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc              |    4 ++--
 recipes-bsp/mmap-lld/mmap-lld-test_git.bb          |    2 +-
 recipes-bsp/netcp-pa-fw/netcp-pa-fw_git.bb         |    2 +-
 recipes-bsp/nwal-lld/nwal-lld.inc                  |    2 +-
 recipes-bsp/pa-lld/pa-lld.inc                      |    4 ++--
 recipes-bsp/pktlib/pktlib-rtos_git.bb              |    2 +-
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb          |    2 +-
 recipes-bsp/qmss-lld/qmss-lld.inc                  |    2 +-
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb              |    2 +-
 recipes-bsp/sa-lld/sa-lld-test_git.bb              |    2 +-
 recipes-bsp/traceframework/traceframework.inc      |    2 +-
 .../linux/files/{k2e-evm => k2e}/cmem.dtsi         |    0
 .../linux/files/{k2e-evm => k2e}/k2e-uio.dtsi      |    0
 recipes-kernel/linux/linux-ti-staging_4.4.bb       |    7 +++----
 recipes-kernel/linux/ti-uio.inc                    |    4 ++--
 recipes-ti/ipc/ipc-transport-common-rtos_git.bb    |    2 +-
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb      |    4 ++--
 recipes-ti/ipc/ipc-transport-qmss-test_git.bb      |    2 +-
 recipes-ti/ipc/ti-ipc.inc                          |    2 +-
 recipes-ti/ipc/ti-ipc_git.bb                       |    2 +-
 recipes-ti/mpm-transport/mpm-transport_git.bb      |    4 ++--
 recipes-ti/netapi/netapi.inc                       |    2 +-
 recipes-ti/openmp-rtos/openmp-rtos_git.bb          |    2 +-
 30 files changed, 36 insertions(+), 36 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=939b243286d83fadd364d1e0b575d71aee14affd

