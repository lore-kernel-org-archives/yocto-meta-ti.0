Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B4CFE00B74; Fri, 16 May 2014 12:13:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05ABDE006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 12:13:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GJDoN2031709
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:13:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GJDnXt008188
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 14:13:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 14:13:49 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4GJDnn9009418;	Fri, 16 May 2014 14:13:49 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WlNZl-0006Le-4k; Fri, 16 May 2014
	15:13:49 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 May 2014 15:13:48 -0400
Message-ID: <1400267628-24372-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] add 3 keystone II device machine configs
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
X-List-Received-Date: Fri, 16 May 2014 19:13:57 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

These patches add 3 machine configs for 3 Keystone II devices/EVMs,
k2hk, k2e, k2l, which share the same keystone SoC family. 


Hao Zhang (3):
  keystone: machine config: change machine config name from
    keystone-evm to k2hk-evm
  keystone: k2l-evm conf: add k2l-evm machine config
  keystone: k2e-evm config: add k2e-evm machine config

 conf/machine/include/keystone.inc              |    2 --
 conf/machine/k2e-evm.conf                      |   30 ++++++++++++++++++++++++
 conf/machine/k2hk-evm.conf                     |   30 ++++++++++++++++++++++++
 conf/machine/k2l-evm.conf                      |   30 ++++++++++++++++++++++++
 conf/machine/keystone-evm.conf                 |   26 --------------------
 recipes-bsp/boot-monitor/boot-monitor_git.bb   |    9 ++++---
 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    2 +-
 recipes-kernel/linux/linux-keystone_3.10.bb    |    2 +-
 8 files changed, 96 insertions(+), 35 deletions(-)
 create mode 100644 conf/machine/k2e-evm.conf
 create mode 100644 conf/machine/k2hk-evm.conf
 create mode 100644 conf/machine/k2l-evm.conf
 delete mode 100644 conf/machine/keystone-evm.conf

-- 
1.7.9.5


