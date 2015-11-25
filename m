Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B589AE007C9; Wed, 25 Nov 2015 14:54:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7929FE007C9
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 14:53:59 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPMrxUC030559
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:53:59 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPMrxXd007716
	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:53:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 16:53:58 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPMrwc2016335	for <meta-ti@yoctoproject.org>; Wed, 25 Nov 2015 16:53:58
	-0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 25 Nov 2015 17:53:39 -0500
Message-ID: <1448492021-887-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Enable non-SGX build for AM3/AM4
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
X-List-Received-Date: Wed, 25 Nov 2015 22:54:05 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enhance meta-ti (and meta-arago) recipes to enable SGX/software rendering 
graphics support based on whether or not SGX is included at Machine Feature
list.

Eric Ruei (2):
  omapdrm_pvr: Define PVR_NULLDRM based on the availability of SGX
  omap5-sgx-ddk-um-linux: Configure DDK UM based on the availability of
    SGX

 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |  2 +-
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb             | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.9.1


