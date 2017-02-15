Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF477E00992; Wed, 15 Feb 2017 13:02:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45ADFE00970
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 13:02:23 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FL2BvW028519
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 15:02:11 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FL262P018889
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 15:02:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 15:02:05 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FL25sL029956	for
	<meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 15:02:06 -0600
Date: Wed, 15 Feb 2017 16:02:05 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Message-ID: <20170215210204.GC19009@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: RFC: New dsp and gc320 entries for MACHINE_FEATURES list
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
X-List-Received-Date: Wed, 15 Feb 2017 21:02:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

I'm thinking about adding 2 new MACHINE_FEATURES flags (dsp and gc320) to 
corresponding platforms' configs. Those will be used to easily control and 
toggle inclusion of corresponding drivers and/or packages into the build. 

The idea is to use dsp machine feature in place of opencl one, as opencl 
really belongs to distro features...

I'm soliciting feedback at this point. Thanks.

-- 
Denys

