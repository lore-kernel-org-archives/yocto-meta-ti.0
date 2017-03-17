Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A81D5E009CF; Fri, 17 Mar 2017 12:04:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A2EDE009B9
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 12:04:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2HJ46dr031838;
	Fri, 17 Mar 2017 14:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489777446;
	bh=2q5nnURtagFBV7ECF8YC++ThbCgskrK35a9tF3vjj1k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LFYYqjxtj4ug6FQucm2IbH+IYZGHBmQkyNBHIjVCPFUJ1ALAS93IqtTpjs0rKWxaX
	1755QNlpckT0wwRk/9ciCVnsaV3Jf1+2vgsJPltNj1QTZQWcdPKLAWBQ3uTkBjO3LX
	VK9sjPWT+2aw0W7tguNcXTn0wyzJMkiUJnQtQFBs=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HJ46wG024306;
	Fri, 17 Mar 2017 14:04:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Mar 2017 14:04:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HJ45cB024771;
	Fri, 17 Mar 2017 14:04:05 -0500
Date: Fri, 17 Mar 2017 15:04:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170317190405.GC14484@edge>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
	<CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
	<20170317170617.GS15664@denix.org>
	<CAGNsrLAFsBYPFbS2Sxb0iKQ=KV2BqD4A+DdoWe3ViufRifRmfw@mail.gmail.com>
	<CAMKF1so20TiHmt6Q778jhYoc0CFGWudoHN=VF3TPJo5daQquTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1so20TiHmt6Q778jhYoc0CFGWudoHN=VF3TPJo5daQquTA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty-next][PATCH 1/2] kselftests: add libpcap-ng dependency
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
X-List-Received-Date: Fri, 17 Mar 2017 19:04:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 17, 2017 at 11:57:04AM -0700, Khem Raj wrote:
> On Fri, Mar 17, 2017 at 10:14 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> > On 17 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:
> >> On Fri, Mar 17, 2017 at 07:03:55PM +0200, Fathi Boudra wrote:
> >>> On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
> >>> > On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
> >>> >> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
> >>> >> wrote:
> >>> >>
> >>> >> > libpcap-ng is required to build capabilities tests.
> >>> >> >
> >>> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> >>> >> > ---
> >>> >> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
> >>> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >>> >> >
> >>> >> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
> >>> >> > b/recipes-kernel/kselftests/kselftests_4.9.bb
> >>> >> > index a7b4ba67..dd94a65b 100644
> >>> >> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> >>> >> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
> >>> >> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
> >>> >> >
> >>> >> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >>> >> >
> >>> >> > -DEPENDS = "libcap popt rsync-native"
> >>> >> > +DEPENDS = "libcap libcap-ng popt rsync-native"
> >>> >>
> >>> >>
> >>> >> Would ng replace old libcap
> >>> >
> >>> > Are you asking in general or in this particular case?
> >>> >
> >>> > kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
> >>> > as I mentioned here:
> >>> > https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
> >>> >
> >>> > Fathi's fix is indeed better, even though adding another dependency.
> >>>
> >>> In this particular case, it doesn't replace libcap.
> >>> Upstream managed to use libcap-ng in capabilities test and libpcap in
> >>> bpf test...
> >>> I'm currently queuing patches for upstream.
> >>
> >> What the status of the old libcap? Is it being deprecated everywhere?
> >
> > The traditional libcap is still mainly used. I don't think it's going
> > to be deprecated soon, systemd is using it for example.
> >
> 
> can both libs live together without stepping on each other ?

FWIW, I haven't tested on all platforms yet (still crunching), but the initial 
results I'm getting here show no build, stage or run-time issues with images 
that include both kselftests and systemd...

-- 
Denys

