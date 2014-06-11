Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 13E3DE00BE1; Tue, 10 Jun 2014 19:56:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1407E00B83
	for <meta-ti@yoctoproject.org>; Tue, 10 Jun 2014 19:56:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5B2udL0014125;
	Tue, 10 Jun 2014 21:56:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5B2udKE026249;
	Tue, 10 Jun 2014 21:56:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Jun 2014 21:56:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5B2uddD021171;
	Tue, 10 Jun 2014 21:56:39 -0500
Date: Tue, 10 Jun 2014 22:56:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ash Charles <ashcharles@gmail.com>
Message-ID: <20140611025637.GK18034@edge>
References: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK8F28kqBnnWBgdk3TXHqBLVW25sVchmQ-eUVf5ujbh=6Dcwtw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: DSP packages for OMAP3
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
X-List-Received-Date: Wed, 11 Jun 2014 02:56:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jun 10, 2014 at 04:04:43PM -0700, Ash Charles wrote:
> Hi,
> 
> I was stepping through the meta-ti layer to assess support for the DSP
> on OMAP3[57].
> 
> Two questions:
> 1.  It looks like there are more recent versions of the code
> generation tools [1] (either 7.6.0 or 7.4.8) than 7.2.7.  Is there any
> reason not to use these newer version? (Apologies if this is a dumb
> question---I just don't know enough about the DSP ecosystem)
> 
> 2. It seems like ti-dsplink and ti-linuxutils (among others I suspect)
> have hardcoded compiler paths and flags that supersede those provided
> by bitbake.  This is causing me headaches when trying to build with a
> hardfp compiler (as recent SGX binaries are provided in hardfp mode).
> Is there a technical limitation to compiling DSP support code with a
> hard float compiler?  I don't mind taking a stab at making the
> makefiles a little more flexible but if the code itself relies on
> non-hardfp, I'll need to rethink.

Unfortunately, DSP support in meta-ti is not maintained currently, as 
explained in the corresponding README file.

-- 
Denys

