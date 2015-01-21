Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CE7CE0089B; Wed, 21 Jan 2015 09:52:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 327B9E0080C
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 09:52:55 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0LHqsE2005750
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 11:52:54 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LHqsFw007028
	for <meta-ti@yoctoproject.org>; Wed, 21 Jan 2015 11:52:54 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 Jan 2015 11:52:53 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0LHqqlU026200;
	Wed, 21 Jan 2015 11:52:53 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 21 Jan 2015 23:22:48 +0530
Message-ID: <1421862770-30804-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH] Increasing the max_leb_count
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
X-List-Received-Date: Wed, 21 Jan 2015 17:52:58 -0000
Content-Type: text/plain

Background:

* GLSDK brings in a lot of multimedia and graphics
  enabling components as well as example applications.
* Customers are going to add more software layers on top 
  of this to enable more feature rich graphics and multimedia. 
* There are two configurations that are used internally:
   ** Release filesystem
   ** Debug filesystem - (Release + GDB + dbg-pkgs)
      dbg-pkgs is basically the EXTRA_MACHINE_FEATURES in 
      the local.conf that brings in the sources and debug
      symbols to allow gdb debugging.

With the current leb_count it is not possible to support 
the above usecases. And to allow for enough room for the 
customer to add their components and not hit the space 
issue, it is proposed to make this change.

Karthik Ramanan (1):
  dra7xx-evm: ubifs: Increase "max_leb_cnt"

 conf/machine/dra7xx-evm.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.7.9.5


