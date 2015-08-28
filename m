Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21FB5E00C08; Thu, 27 Aug 2015 20:16:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 97349E00B18
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 20:16:15 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7S3GEEL030810
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 22:16:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7S3GEIf012014
	for <meta-ti@yoctoproject.org>; Thu, 27 Aug 2015 22:16:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 27 Aug 2015 22:16:14 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t7S3GDdZ011689;	Thu, 27 Aug 2015 22:16:14 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Aug 2015 23:16:06 -0400
Message-ID: <1440731769-15759-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Add AM3 and AM4 which use null_window DRM
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
X-List-Received-Date: Fri, 28 Aug 2015 03:16:16 -0000
Content-Type: text/plain

Add AM3 and AM4 which use null_window DRM from SGX DDK.

The kernel module ompadrm-pvr in this patch is built with Eric's version 1 kernel patches

Hongmei Gou (3):
  omapdrm-pvr: add AM3 and AM4 which use null_window DRM
  omap5-sgx-ddk-um-linux: add AM3 and AM4, and pvr-init to
    initialization
  libdrm: add ti33x and ti43x to COMPATIBLE_MACHINE

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     | 28 ++++++++++++++----
 recipes-graphics/drm/libdrm_2.4.41.bb              |  4 +--
 .../libgles/omap5-sgx-ddk-um-linux/dummy.ini       |  0
 .../libgles/omap5-sgx-ddk-um-linux/powervr.ini     |  3 ++
 .../libgles/omap5-sgx-ddk-um-linux/rc.pvr          | 17 +++++++++++
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     | 33 ++++++++++++++++++++--
 6 files changed, 74 insertions(+), 11 deletions(-)
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/dummy.ini
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/powervr.ini
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/rc.pvr

-- 
1.9.1


