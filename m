Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F0B6E00A9B; Wed,  4 Nov 2015 11:53:23 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0B07E00A28
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 11:53:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA4JrJaT001090
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2015 13:53:19 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA4JrJxK028302
	for <meta-ti@yoctoproject.org>; Wed, 4 Nov 2015 13:53:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Nov 2015 13:53:19 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA4JrJwr029455;	Wed, 4 Nov 2015 13:53:19 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 4 Nov 2015 14:53:13 -0500
Message-ID: <1446666795-21381-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Support hardware mode wayland for AM4
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
X-List-Received-Date: Wed, 04 Nov 2015 19:53:23 -0000
Content-Type: text/plain

Update DDK kernel module and user module to support wayland/DRM on AM4

Hongmei Gou (2):
  omapdrm-pvr: disable PVR_NULLDRM to support DRI_DRM for AM4
  omap5-sgx-ddk-um-linux: bump SRCREV and other changes to support
    wayland/DRM on AM4

 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb         |  2 +-
 .../libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini           |  3 ---
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb    | 10 ++++++++--
 3 files changed, 9 insertions(+), 6 deletions(-)
 delete mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux/ti43x/powervr.ini

-- 
1.9.1


