Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7879E00D01; Thu,  7 Mar 2019 14:08:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00156E00CED
	for <meta-ti@yoctoproject.org>; Thu,  7 Mar 2019 14:08:29 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x27M8TSI007860
	for <meta-ti@yoctoproject.org>; Thu, 7 Mar 2019 16:08:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551996509;
	bh=uQ1BpNEKd3WepbWPy0wCcmM1aqpQ8eulgAza+qFdA+I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=B5sBmcQG7X+Mqg0PSe1jZ1pdaxGPceCsaiREUU4Flv/B9uFvCKRmCUxZ3/7jzpo4B
	iE3bMCBcPI1Sv4LHcVmpnYjYKdfkr6C81mOnBbFds380RtCzd+CWzVsrYZ/3JRJhB6
	8D1tb/ZxZjiz1fuLy45teKBrghqqSzFqyMdzMcZo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x27M8TQV115915
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Mar 2019 16:08:29 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 7 Mar 2019 16:08:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 7 Mar 2019 16:08:28 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x27M8SHF013337;
	Thu, 7 Mar 2019 16:08:28 -0600
Date: Thu, 7 Mar 2019 17:08:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190307220828.GF26081@beryl>
References: <1551460736-16483-1-git-send-email-denys@ti.com>
	<6f775973-d681-4da8-355f-9c3987526a1c@ti.com>
	<20190305005551.GS26081@beryl> <20190305021807.GY26081@beryl>
MIME-Version: 1.0
In-Reply-To: <20190305021807.GY26081@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [EXTERNAL] [master][PATCH] gcc-arm-none-eabi: not supported on any target
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
X-List-Received-Date: Thu, 07 Mar 2019 22:08:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 09:18:08PM -0500, Denys Dmytriyenko wrote:
> On Mon, Mar 04, 2019 at 07:55:52PM -0500, Denys Dmytriyenko wrote:
> > On Mon, Mar 04, 2019 at 11:08:48AM -0500, Jacob Stiffler wrote:
> > > On a different machine, I am seeing the package_qa errors for the nativesdk
> > > package.
> > 
> > Have you tried using the binaries?
> > 
> > 
> > > Should I submit a patch on top of this one to suppress the QA warnings and
> > > errors? Or should I combine this change with that patch?
> > 
> > Not sure what you mean by combining...
> 
> Just realized you are probably looking at rocko and this change hasn't been 
> backported yet:
> http://arago-project.org/git/?p=meta-ti.git;a=commitdiff;h=84b3ff8da8311138e534cfb8930c08aa4b417c3e

Ping. Do we need this change backported to rocko?


> > > Thank you,
> > > 
> > > Jake
> > > 
> > > 
> > > On 3/1/2019 12:18 PM, Denys Dmytriyenko wrote:
> > > >This package is only meant for native and nativesdk usage.
> > > >
> > > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > >---
> > > >  recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > >diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > >index ae3d1d7..d08dd2f 100644
> > > >--- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > >+++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> > > >@@ -14,6 +14,7 @@ S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
> > > >  # only x86_64 is supported
> > > >  COMPATIBLE_HOST = "x86_64.*-linux"
> > > >+COMPATIBLE_HOST_class-target = "null"
> > > >  do_install() {
> > > >      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

