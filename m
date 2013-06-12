Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C22DE006C2
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 10:23:00 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5CHMwPU018696
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:22:59 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5CHMtTT004963
	for <meta-ti@yoctoproject.org>; Wed, 12 Jun 2013 12:22:57 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 13 Jun 2013 01:22:55 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5CHMsO1027868;
	Wed, 12 Jun 2013 22:52:55 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Jun 2013 22:52:33 +0530
Message-ID: <1371057762-17055-1-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <Prabindh Sundareson <prabu@ti.com>
References: <Prabindh Sundareson <prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 0/9] Graphics SDK cleanup
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
X-List-Received-Date: Wed, 12 Jun 2013 17:23:02 -0000
Content-Type: text/plain

Patch-set removes unsupported features, and separates X11 and non-X11 builds, and enables support for Qt5 builds. This patch-set also squashes 2 commits together per discussion at https://lists.yoctoproject.org/pipermail/meta-ti/2013-May/002774.html

Prabindh Sundareson (9):
  libgles-omap3: Remove X11 related build and packaging
  omap3-sgx-modules: Remove X11 related build and packaging
  libgles-omap3: Remove unsupported core build option ES2.0
  libgles-omap3: Remove OpenVG references
  libgles-omap3: Remove copying of unused header files
  libgles-omap3: Add missing RPROVIDES
  libgles-omap3: Package files with right permission
  libgles-omap3-x11: Separate X11 SGX driver package into new recipe
  omap3-sgx-modules-x11: Separate X11 SGX driver package into new
    recipe

 .../Compile-fixes-for-38-kernel.patch              |  346 ++++++++++++++++++++
 .../omap3-sgx-modules-x11/kernel-30.patch          |   38 +++
 .../omap3-sgx-modules-x11_4.09.00.01.bb            |   74 +++++
 .../omap3-sgx-modules_4.09.00.01.bb                |    9 +-
 recipes-graphics/libgles/libgles-omap3-no-x.inc    |  318 ++++++++++++++++++
 .../libgles/libgles-omap3-x11-4.09.00.01/rc.pvr    |  125 +++++++
 .../libgles-omap3-x11-4.09.00.01/rc_dri.pvr        |  137 ++++++++
 recipes-graphics/libgles/libgles-omap3-x11.inc     |  323 ++++++++++++++++++
 .../libgles/libgles-omap3_4.09.00.01.bb            |   45 +---
 9 files changed, 1365 insertions(+), 50 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/Compile-fixes-for-38-kernel.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11/kernel-30.patch
 create mode 100644 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
 create mode 100644 recipes-graphics/libgles/libgles-omap3-no-x.inc
 create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3-x11-4.09.00.01/rc_dri.pvr
 create mode 100644 recipes-graphics/libgles/libgles-omap3-x11.inc


