Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D4D3E00AE6; Tue,  1 Dec 2015 07:40:03 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45046E00ACF
	for <meta-ti@yoctoproject.org>; Tue,  1 Dec 2015 07:39:59 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB1Fdwxb032164
	for <meta-ti@yoctoproject.org>; Tue, 1 Dec 2015 09:39:58 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB1FdwOl018140
	for <meta-ti@yoctoproject.org>; Tue, 1 Dec 2015 09:39:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Dec 2015 09:39:57 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tB1FdvOh027913	for <meta-ti@yoctoproject.org>;
	Tue, 1 Dec 2015 09:39:58 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Dec 2015 10:39:48 -0500
Message-ID: <1448984390-21457-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] Enable non-SGX build for AM3/AM4
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
X-List-Received-Date: Tue, 01 Dec 2015 15:40:03 -0000
Content-Type: text/plain

Enhance meta-ti (and meta-arago) recipes to enable SGX/software rendering 
graphics support based on whether SGX is included at Machine Feature list.

Major changes since V1:
- Invoke SGX DDK kernel module (omapdrm-pvr.ko) build recipe only if
  SGX is available

Eric Ruei (2):
  conf/layer.conf: Build omapdrm-pvr only if SGX is included
  omap5-sgx-ddk-um-linux: Configure DDK UM based on the availability of
    SGX

 conf/layer.conf                                            |  2 +-
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb             | 14 ++++++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.9.1


