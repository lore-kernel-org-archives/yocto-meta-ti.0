Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A27FAE009B9; Fri, 17 Mar 2017 13:08:11 -0700 (PDT)
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
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC610E009B9
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 13:08:09 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2HK88bX002435;
	Fri, 17 Mar 2017 15:08:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489781288;
	bh=igl0IxZpFqz909RIctmemh0hZStSS1z95rq0z0Nvlb0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=db2DZ5kkJIt20a31ZpKd8hJHQnJfNRFEPIGBkHhrLM4uMhMpukgoOZCiQlGPNTtE7
	6B48mZr6+zZpNi2VYLQLIFr9waqnMqFQj72fyBGbS1bcIXKZWmvWEMXBKeGnI+iyru
	AsqNIaHiV4D6xKP6hKFJCWC0W7eQMTPWgWOLBzcY=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HK8883029693;
	Fri, 17 Mar 2017 15:08:08 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Mar 2017 15:08:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HK87wv032248;
	Fri, 17 Mar 2017 15:08:07 -0500
Date: Fri, 17 Mar 2017 16:08:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170317200806.GF14484@edge>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
	<CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
	<20170317170617.GS15664@denix.org>
	<CAGNsrLAFsBYPFbS2Sxb0iKQ=KV2BqD4A+DdoWe3ViufRifRmfw@mail.gmail.com>
	<CAMKF1so20TiHmt6Q778jhYoc0CFGWudoHN=VF3TPJo5daQquTA@mail.gmail.com>
	<20170317190405.GC14484@edge>
	<CAMKF1sp9KOiUuvwx-RJ0B65CgAXodyEG1VezqTPFOfS6EPPbVQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sp9KOiUuvwx-RJ0B65CgAXodyEG1VezqTPFOfS6EPPbVQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Mar 2017 20:08:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 17, 2017 at 12:12:24PM -0700, Khem Raj wrote:
> On Fri, Mar 17, 2017 at 12:04 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> > On Fri, Mar 17, 2017 at 11:57:04AM -0700, Khem Raj wrote:
> >> On Fri, Mar 17, 2017 at 10:14 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> >> > On 17 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:
> >> >> On Fri, Mar 17, 2017 at 07:03:55PM +0200, Fathi Boudra wrote:
> >> >>> On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
> >> >>> > On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
> >> >>> >> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
> >> >>> >> wrote:
> >> >>> >>
> >> >>> >> > libpcap-ng is required to build capabilities tests.
> >> >>> >> >
> >> >>> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> >> >>> >> > ---
> >> >>> >> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
> >> >>> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >> >>> >> >
> >> >>> >> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
> >> >>> >> > b/recipes-kernel/kselftests/kselftests_4.9.bb
> >> >>> >> > index a7b4ba67..dd94a65b 100644
> >> >>> >> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
> >> >>> >> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
> >> >>> >> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
> >> >>> >> >
> >> >>> >> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >> >>> >> >
> >> >>> >> > -DEPENDS = "libcap popt rsync-native"
> >> >>> >> > +DEPENDS = "libcap libcap-ng popt rsync-native"
> >> >>> >>
> >> >>> >>
> >> >>> >> Would ng replace old libcap
> >> >>> >
> >> >>> > Are you asking in general or in this particular case?
> >> >>> >
> >> >>> > kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
> >> >>> > as I mentioned here:
> >> >>> > https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
> >> >>> >
> >> >>> > Fathi's fix is indeed better, even though adding another dependency.
> >> >>>
> >> >>> In this particular case, it doesn't replace libcap.
> >> >>> Upstream managed to use libcap-ng in capabilities test and libpcap in
> >> >>> bpf test...
> >> >>> I'm currently queuing patches for upstream.
> >> >>
> >> >> What the status of the old libcap? Is it being deprecated everywhere?
> >> >
> >> > The traditional libcap is still mainly used. I don't think it's going
> >> > to be deprecated soon, systemd is using it for example.
> >> >
> >>
> >> can both libs live together without stepping on each other ?
> >
> > FWIW, I haven't tested on all platforms yet (still crunching), but the initial
> > results I'm getting here show no build, stage or run-time issues with images
> > that include both kselftests and systemd...
> >
> 
> OK you might want to compare the contents of both packages
> and see if there are any changes that can have effect on behavior subtly.

Looked at all the packaged stuff - cap-ng is very careful to maintain separate 
namespace. There are no conflicts in packaged files - headers, libraries, 
aclocal, pkgconfig, etc. all have cap-ng in the name. Even the new API in the 
header file uses CAPNG_* enums and capng_*() functions:
https://sourcecodebrowser.com/libcap-ng/0.6.5/cap-ng_8h.html

-- 
Denys

