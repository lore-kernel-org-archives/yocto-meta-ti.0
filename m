Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD5EDE009FD; Thu,  6 Aug 2015 06:59:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49F65E00867
	for <meta-ti@yoctoproject.org>; Thu,  6 Aug 2015 06:59:39 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t76DxduX007992;
	Thu, 6 Aug 2015 08:59:39 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76Dxc7l006400;
	Thu, 6 Aug 2015 08:59:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 6 Aug 2015 08:59:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t76Dxb3K019737;
	Thu, 6 Aug 2015 08:59:38 -0500
Date: Thu, 6 Aug 2015 09:59:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20150806135921.GZ1040@edge>
References: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 13:59:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

SGX is a closed IP from Imagination Tech and is available mostly as a binary 
blob. Latest versions of it only come in hardfp format, hence the check - if 
you are not building the rest of your system in hardfp, it skips SGX.

-- 
Denys


On Thu, Aug 06, 2015 at 02:47:04PM +1200, Ankur Tyagi wrote:
> Hi,
> 
> I am using TI AM335x-EVM kit and while building image using
> "arago-daisy-config.txt", I saw this warning :
> 
> omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
> omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now
> 
> and TUNE_FEATUREis "vfp"
> 
> Does that mean GPU is not getting used anymore ?
> I am using QT5 with eglfs platform and need GPU support for performance.
> 
> Please clarify the situation.
> 
> Thanks
> Ankur

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


