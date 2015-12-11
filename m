Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C704E00B63; Fri, 11 Dec 2015 01:19:48 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E2E1E0088C
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 01:19:43 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBB9JfY1032651
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 03:19:41 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBB9JfXV014085
	for <meta-ti@yoctoproject.org>; Fri, 11 Dec 2015 03:19:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Dec 2015 03:19:41 -0600
Received: from tigfxsrv.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tBB9JeV4027069;	Fri, 11 Dec 2015 03:19:40 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 11 Dec 2015 14:49:16 +0530
Message-ID: <1449825558-1294-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [SGX AM57x/DRA7xx 0/2] Update SGX graphics recipes for AM57x/DRA7xx to latest version
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
X-List-Received-Date: Fri, 11 Dec 2015 09:19:48 -0000
Content-Type: text/plain

Update SGX UM / KM to latest version for AM57x/DRA7xx

The changes involved have been tested against 4.1 kernel (commit -
03066ae73fc380e3ea9da8cba63591a135b33b71) with GLSDK 7.02 GA /
2014 LTS file system. The Yocto recipes have not been verified on 2015 LTS.

Summary of changes
==================
UM:
- Enable screenshot capture in Weston
- Resolve SGX HW recovery when Wayland OpenGLES clients are abruptly terminated
- Resolve SGX HW recovery with glmark2 benchmark application
- Resolve rendering issue with half float textures

KM:
- Fix access to freed memory
- Fix GEM handle memory leak when Wayland client exit and Weston continues to run

Anand Balagopalakrishnan (2):
  omapdrm-pvr: bump SRCREV for AM57x/DRA7xx
  omap5-sgx-ddk-um-linux: bump SRCREV for AM57x/DRA7xx to the latest
    DDK UM

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    2 +-
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


