Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3A61E0140D
	for <meta-ti@yoctoproject.org>; Mon,  1 Jul 2013 05:31:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61CVIMB020083
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:31:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61CVIim005091
	for <meta-ti@yoctoproject.org>; Mon, 1 Jul 2013 07:31:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 1 Jul 2013 07:31:18 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r61CVGrR012338;
	Mon, 1 Jul 2013 07:31:17 -0500
Date: Mon, 1 Jul 2013 18:01:16 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20130701123116.GA16057@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH 0/2] omap-a15: Add support for libgles and powervr drivers
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
X-List-Received-Date: Mon, 01 Jul 2013 12:31:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

* Add support for libgles and powervr drivers.
  On OMAP5 and DRA7xx, the SGX 544MP2 is use. These patches enable
  support.
* There are significant differences between omap3-sgx/graphics-sdk 
  recipes.
  - There is no graphics SDK for OMAP5. Instead we have a DDK without 
    any graphics demos. Separate recipes will be posted for demos.
  - The PowerVR drivers are designed to be a omapdrm plugin. This is 
    available separately as git tree from which we build the kernel 
    module.

Mrinmayee Hingolikar (2):
  recipes-bsp: Add recipe for PowerVR SGX544MP2 kernel drivers
  libgles: Added prebuilt userspace libraries for graphics acceleration

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |   42 ++++++++++++++++++++
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |   24 +++++++++++
 2 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb


