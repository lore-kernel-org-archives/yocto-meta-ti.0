Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99AF4E009CE; Fri, 17 Mar 2017 10:06:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37869E00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:06:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BCDA620BAC;
	Fri, 17 Mar 2017 17:06:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LyMAMVvvUk3V; Fri, 17 Mar 2017 17:06:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 971F0208FB;
	Fri, 17 Mar 2017 17:06:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 54C4C1623E8; Fri, 17 Mar 2017 13:06:17 -0400 (EDT)
Date: Fri, 17 Mar 2017 13:06:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Message-ID: <20170317170617.GS15664@denix.org>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
	<CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 17 Mar 2017 17:06:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 17, 2017 at 07:03:55PM +0200, Fathi Boudra wrote:
> On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
> >> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
> >> wrote:
> >>
> >> > libpcap-ng is required to build capabilities tests.
> >> >
> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> >> > ---
> >> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >> >
> >> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
> >> > b/recipes-kernel/kselftests/kselftests_4.9.bb
> >> > index a7b4ba67..dd94a65b 100644
> >> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> >> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
> >> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
> >> >
> >> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> >
> >> > -DEPENDS = "libcap popt rsync-native"
> >> > +DEPENDS = "libcap libcap-ng popt rsync-native"
> >>
> >>
> >> Would ng replace old libcap
> >
> > Are you asking in general or in this particular case?
> >
> > kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
> > as I mentioned here:
> > https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
> >
> > Fathi's fix is indeed better, even though adding another dependency.
> 
> In this particular case, it doesn't replace libcap.
> Upstream managed to use libcap-ng in capabilities test and libpcap in
> bpf test...
> I'm currently queuing patches for upstream.

What the status of the old libcap? Is it being deprecated everywhere?


> >> >  inherit kernel-arch
> >> >
> >> > @@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
> >> >  FILES_${PN}-zram = "${bindir}/kselftests/zram"
> >> >  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
> >> >
> >> > -ALLOW_EMPTY_${PN}-capabilities = "1"
> >> > -
> >> >  RDEPENDS_${PN}-cpu-hotplug += "bash"
> >> >  RDEPENDS_${PN}-efivarfs += "bash"
> >> >  RDEPENDS_${PN}-memory-hotplug += "bash"
> >> > --
> >> > 2.11.0
> >> >
> >> > --
> >> > _______________________________________________
> >> > meta-ti mailing list
> >> > meta-ti@yoctoproject.org
> >> > https://lists.yoctoproject.org/listinfo/meta-ti
> >> >
> 

