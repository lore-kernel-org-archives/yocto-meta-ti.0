Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50606E00BE3; Mon, 25 Jan 2016 09:07:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08041E0090A
	for <meta-ti@yoctoproject.org>; Mon, 25 Jan 2016 09:07:32 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0PH7UPe001301;
	Mon, 25 Jan 2016 11:07:30 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0PH7UYU021609;
	Mon, 25 Jan 2016 11:07:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 25 Jan 2016 11:07:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0PH7UFN030560;
	Mon, 25 Jan 2016 11:07:30 -0600
Date: Mon, 25 Jan 2016 12:07:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <winiston@futuraautomation.com>
Message-ID: <20160125170714.GO11314@edge>
References: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
MIME-Version: 1.0
In-Reply-To: <7A144FD2E22B42C29D1455BA473BACE1@RD3>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: yocto texas <meta-ti@yoctoproject.org>
Subject: Re: Build Error for AM437x-evm
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
X-List-Received-Date: Mon, 25 Jan 2016 17:07:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Looks like branches are not matched between the layers...


On Mon, Jan 25, 2016 at 03:02:18PM +0530, winiston@futuraautomation.com wrote:
> Dear ,
> 
> I built default yocto image for qemux86 processor using poky. I used the bitbake core-image-minimal command to build the image. It has been built successfully. 
> Now I made the following changes to build for AM437x evm.
> 
> 1. Edited   ~/poky/build/conf/bblayers.conf   file as follows
> 
> BBFILES ?= “”
> BBLAYERS = “ \
> /home/winiston/poky/meta \
> /home/winiston/poky/meta-yocto \
> /home/winiston/poky/meta-ti \
> 
> Note :  meta-ti  resides in the poky folder.
> 
> 2.Edited  ~/poky/build/conf/local.conf  file. The MACHINE variable  changed from MACHINE ??= “qemux86”  to  MACHINE ??= "am437x-evm"
> 
> After making above two changes, I executed bitbake core-image-minimal command from terminal window. It gives the following error
> 
> ERROR: ParseError at /home/winiston/poky/meta-ti/recipes-graphics/drm/libdrm_2.4.41.bb:1: Could not include required file recipes-graphics/drm/libdrm.inc
> 
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> winiston@winiston-VirtualBox:~/poky/build$ 
> 
> What could be the reason of this error? How do I solve this error?
> 
> Regards,
> Winiston.P
> Futura Automation Pvt Ltd.
> 
> Ph :91-80-28375290 / 28375295
> Fax :91-80-28375291

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


