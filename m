Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 40854E00716; Fri, 16 May 2014 10:45:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from devils.ext.ti.com (unknown [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C2238E006EC
	for <meta-ti@yoctoproject.org>; Fri, 16 May 2014 10:45:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4GHjAdn009588;
	Fri, 16 May 2014 12:45:10 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GHjAjG027728;
	Fri, 16 May 2014 12:45:10 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 May 2014 12:45:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4GHjAAJ011667;
	Fri, 16 May 2014 12:45:10 -0500
Date: Fri, 16 May 2014 13:45:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: deepak vijay <deepakvijay2255@rediff.com>
Message-ID: <20140516174509.GB18053@edge>
References: <CAAxuRXhiK2cce86W7wWrahrOC=jaAqyVXaU_KCFwg2cQqJR0NQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAxuRXhiK2cce86W7wWrahrOC=jaAqyVXaU_KCFwg2cQqJR0NQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: boot fail in omap3 evm
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
X-List-Received-Date: Fri, 16 May 2014 17:45:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, May 16, 2014 at 12:33:31PM +0530, deepak vijay wrote:
> Hi all,
> I am new to yocto project .
> I have downloaded the beaglebone-daisy-11.0.0 and add meta-ti layer whith a
> commit id of 4e5bcb5712bf2f0587ceff908d75177e410de48f.
> And when I build it for omap3evm and boot the images of the build I am
> getting the following dump logs when I enable earlyprintk without changing
> any other configurations.
> 
> And one of the member suggested me that use lower version of gcc like gcc
> 4.3. But I didn't find any way to use it. Because only gcc 4.8.2 recipe is
> there in the layer.

You can grab one of the older Yocto releases, e.g. 1.2 denzil has gcc-4.6
Otherwise there were/are some layers still with gcc-4.5 support, at least in  
the external toolchain form...

On the other hand, may I ask why do you want to build such an old kernel with
the latest Yocto setup and the toolchain? Can you just use one of the recent  
3.x kernels?

-- 
Denys

