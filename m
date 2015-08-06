Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5794FE00AAF; Thu,  6 Aug 2015 12:06:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6D68E00767
	for <meta-ti@yoctoproject.org>; Thu,  6 Aug 2015 12:02:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t76J2aJ9015087
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2015 14:02:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76J2a3L010277
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2015 14:02:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 14:02:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76J2aWw002761;
	Thu, 6 Aug 2015 14:02:36 -0500
Date: Thu, 6 Aug 2015 15:02:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20150806190220.GC1040@edge>
References: <1438886878-1165-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1438886878-1165-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/2] Update SGX graphics recipes to latest version for K4.1
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
X-List-Received-Date: Thu, 06 Aug 2015 19:06:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, Anand!

I'll give it a try right away!

Meanwhile, a quick question - is it still based on the same versions of DDK? 
I.e. 1.9.0.12 and 1.9.2253347?

-- 
Denys


On Fri, Aug 07, 2015 at 12:17:56AM +0530, Anand Balagopalakrishnan wrote:
> Update SGX UM / KM to latest version for 4.1 kernel for 2015 LTS
> 
> The changes involved have been tested against 4.1 kernel with GLSDK 7.01 Beta /
> 2014 LTS file system. The Yocto recipes have not been verified on 2015 LTS.
> 
> Anand Balagopalakrishnan (2):
>   omapdrm-pvr: recipe update for SGX KM on 4.1 kernel
>   omap5-sgx-ddk-um-linux: update SGX user mode binaries to latest
>     version
> 
>  .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
> 
> -- 
> 1.7.9.5
> 

