Return-Path: <manishv.b@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC6AEE004CF
	for <meta-ti@yoctoproject.org>; Sun,  2 Jun 2013 23:11:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r536B6F8022286
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 01:11:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r536B6jw015446
	for <meta-ti@yoctoproject.org>; Mon, 3 Jun 2013 01:11:06 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 3 Jun 2013 01:11:06 -0500
Received: from ucmsshproxy.india.ext.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlelxv23.itg.ti.com (8.13.8/8.13.8) with SMTP id
	r536B4n8021756;	Mon, 3 Jun 2013 01:11:05 -0500
Received: from symphony.india.ext.ti.com (unknown [192.168.247.13])	by
	ucmsshproxy.india.ext.ti.com (Postfix) with ESMTP	id 0E8E6158002;
	Mon,  3 Jun 2013 11:41:04 +0530 (IST)
Received: from ubuntu-psp-linux.india.ext.ti.com (ubuntu-psp-linux
	[192.168.247.46])	by symphony.india.ext.ti.com (8.11.7p1+Sun/8.11.7)
	with ESMTP id r536B2R12358;	Mon, 3 Jun 2013 11:41:03 +0530 (IST)
From: "Vishwanathrao Badarkhe, Manish" <manishv.b@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 3 Jun 2013 11:43:11 +0530
Message-ID: <1370239993-19633-1-git-send-email-manishv.b@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] Recipe for OMAPL138 release 03.22.00.04
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
X-List-Received-Date: Mon, 03 Jun 2013 06:11:06 -0000
Content-Type: text/plain

Updated recipe for OMAPL138 release 03.22.00.04

Vishwanathrao Badarkhe, Manish (2):
  linux-omapl138: add omapl138 recipe for kernel 3.3.0
  u-boot-omapl138: add recipe for omapl138 devices

 conf/machine/am180x-evm.conf                       |    2 +-
 recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb     |   17 +
 .../am180x-evm/configs/static                      | 1868 ++++++++++++++++++++
 .../tipspkernel/am180x-evm/configs/static          | 1867 +++++++++++++++++++
 recipes-kernel/linux/linux-omapl138-psp_3.3.0.bb   |   23 +
 5 files changed, 3776 insertions(+), 1 deletions(-)
 create mode 100644 recipes-bsp/u-boot/u-boot-am180x_2012.04.01.bb
 create mode 100644 recipes-kernel/linux/linux-omapl138-psp-3.3.0/am180x-evm/configs/static
 create mode 100644 recipes-kernel/linux/linux-omapl138-psp-3.3.0/tipspkernel/am180x-evm/configs/static
 create mode 100644 recipes-kernel/linux/linux-omapl138-psp_3.3.0.bb

-- 
1.7.4.1


