Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A48AEE00D24; Mon,  4 Mar 2019 16:55:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D40CE00D11
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2019 16:55:53 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x250tqf7035793
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:55:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551747352;
	bh=Au/K7F0BEtiVJYNTERRlA8xYmRoYW44v6Boiqok036k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=P3CgKBhaFhipqgr50N+3/myyxbLN9Fr6prZ8CT+cewyagfjmJZmR3SOuJ/95JHojr
	2bl/XXiYUu5ogEhCAyUJQF3hP59O3V5u/6sd0kF939eSI4zrMCK0uoHJZxs9whN6eW
	OygHdu4rV6k5Sv9vVVFYgJE0XempgY8W2fUXVRnc=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x250tqQt040843
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 4 Mar 2019 18:55:52 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 4 Mar 2019 18:55:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 4 Mar 2019 18:55:52 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x250tqvV010329;
	Mon, 4 Mar 2019 18:55:52 -0600
Date: Mon, 4 Mar 2019 19:55:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190305005551.GS26081@beryl>
References: <1551460736-16483-1-git-send-email-denys@ti.com>
	<6f775973-d681-4da8-355f-9c3987526a1c@ti.com>
MIME-Version: 1.0
In-Reply-To: <6f775973-d681-4da8-355f-9c3987526a1c@ti.com>
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
X-List-Received-Date: Tue, 05 Mar 2019 00:55:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 04, 2019 at 11:08:48AM -0500, Jacob Stiffler wrote:
> On a different machine, I am seeing the package_qa errors for the nativesdk
> package.

Have you tried using the binaries?


> Should I submit a patch on top of this one to suppress the QA warnings and
> errors? Or should I combine this change with that patch?

Not sure what you mean by combining...


> Thank you,
> 
> Jake
> 
> 
> On 3/1/2019 12:18 PM, Denys Dmytriyenko wrote:
> >This package is only meant for native and nativesdk usage.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> >index ae3d1d7..d08dd2f 100644
> >--- a/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> >+++ b/recipes-ti/devtools/gcc-arm-none-eabi_6-2017-q1-update.bb
> >@@ -14,6 +14,7 @@ S = "${WORKDIR}/gcc-arm-none-eabi-6-2017-q1-update"
> >  # only x86_64 is supported
> >  COMPATIBLE_HOST = "x86_64.*-linux"
> >+COMPATIBLE_HOST_class-target = "null"
> >  do_install() {
> >      install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}

