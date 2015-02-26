Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DA9AE00779; Thu, 26 Feb 2015 12:21:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9133E0074C
	for <meta-ti@yoctoproject.org>; Thu, 26 Feb 2015 12:21:37 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1QKLbGT031189;
	Thu, 26 Feb 2015 14:21:37 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QKLZqP023771;
	Thu, 26 Feb 2015 14:21:35 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Feb 2015 14:21:35 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1QKLZgf004773;
	Thu, 26 Feb 2015 14:21:35 -0600
Date: Thu, 26 Feb 2015 15:21:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Aravind Babu <aravind.nizam79@gmail.com>
Message-ID: <20150226202134.GH6052@edge>
References: <CADMH9KBinadwV00-kok4d4qQWLxFgmss0Auw8xKJh3u+H5uorQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADMH9KBinadwV00-kok4d4qQWLxFgmss0Auw8xKJh3u+H5uorQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: How to build Local PC kernel using Local Pc Toolchain with Yocto
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
X-List-Received-Date: Thu, 26 Feb 2015 20:21:40 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 24, 2015 at 03:05:03PM +0530, Aravind Babu wrote:
> Hi ,
> 
> I am new to Yocto build system & I am currently using Ycto (Poky
> distrbution) in my project to build u-boot, kernel and file system.
> 
> I am working on *AM437x GP EVM board*. and I am using
> *ti-sdk-am437x-evm-07.01.00.00*
> 
> I am able to build kernel and file system using Yocto but these are
> different versions which I don't want to build,  and there are building
> based on versions  specified in .bb files.
> 
> but I want to use my local PC *Tool chain* and my local PC* Kernel-3.12 *in
> Yocto build but with my local tool chain path and local PC kernel I am not
> able to build
> 
> can you please provide the procedure to export local Toolchain path & build
> the local Pc kernel3.12

I'm not sure you'll get complete am437 support from 3.12 kernel... You can 
start with these instructions and adopt to your needs:

http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

-- 
Denys

