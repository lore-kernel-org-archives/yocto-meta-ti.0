Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 14F96E00C46; Mon, 30 Sep 2019 17:22:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25C69E00972
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 17:22:58 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x910MvgC061787;
	Mon, 30 Sep 2019 19:22:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569889377;
	bh=VY1gNEP95H7MoiXh4V3qL2P1xi9b8XSkwGGAGp7hS3c=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VgyRo9V884P5mvBIcgHkeMsbD+cqggwl6M0nOgh4vR88b4Y8sb7l05k+eb7eme1sz
	HJ0ypFcwatWtR5YZuXD6FvS/PeFhaCz6vzuKCFdbK8ozBXYtVIBkx74QPeQxdPrcET
	onGbBwndIVCiIL5Mzr+tGyP8Ago2WlSTYid38hTk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x910Mv4o097173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Sep 2019 19:22:57 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 19:22:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 19:22:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x910Mud0018919;
	Mon, 30 Sep 2019 19:22:56 -0500
Date: Mon, 30 Sep 2019 20:22:56 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191001002256.GF15230@beryl>
References: <20190929154335.2646732-1-raj.khem@gmail.com>
	<20190929154335.2646732-3-raj.khem@gmail.com>
	<20190930183244.GB12684@beryl>
	<83d37389-25a3-bc84-1a98-3e5670dc25f6@gmail.com>
	<20190930204356.GA15230@beryl> <20191001000014.GE15230@beryl>
	<CAMKF1sokASu7UjG2nP5B+h0Xu8CfLpZXW950vWBiUcA=bYYOEg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sokASu7UjG2nP5B+h0Xu8CfLpZXW950vWBiUcA=bYYOEg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 3/3] beaglebone-getting-started: Mention CC-BY-SA-3.0 and correct GPL version
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
X-List-Received-Date: Tue, 01 Oct 2019 00:22:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Sep 30, 2019 at 05:07:01PM -0700, Khem Raj wrote:
> On Mon, Sep 30, 2019 at 5:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Mon, Sep 30, 2019 at 04:43:56PM -0400, Denys Dmytriyenko wrote:
> > > On Mon, Sep 30, 2019 at 01:40:23PM -0700, Khem Raj wrote:
> > > >
> > > >
> > > > On 9/30/19 11:32 AM, Denys Dmytriyenko wrote:
> > > > > On Sun, Sep 29, 2019 at 08:43:35AM -0700, Khem Raj wrote:
> > > > >> This is as per
> > > > >> https://github.com/jadonk/beaglebone-getting-started/blob/master/LICENSE.txt
> > > > >
> > > > > You are looking at the latest LICENSE file, while the recipe hasn't updated
> > > > > its SRCREV since early 2012, back when beagleboard.org was still active in OE.
> > > > > Specifically, GPLv3+ was added in 2013:
> > > > > https://github.com/jadonk/beaglebone-getting-started/commits/master/LICENSE.txt
> > > > >
> > > > > We don't use this package, but I kept it in case someone still needs it. I did
> > > > > put a README with a note in that directory:
> > > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README
> > > > >
> > > > > Probably, this can be updated to the latest, as part of fixing the LICENSE? :)
> > > > >
> > > >
> > > > The README should be specific about which recipes are not maintained, it
> > > > has a general statement which gives a scare, if the recipe is not
> > > > maintained then this should be removed or atleast blacklisted if you
> > > > still want to keep it around.
> > > >
> > > > I was trying to help clearing up license warnings, other than that I
> >
> > BTW, the only warning I see for this recipe, is that "others" license is
> > unknown. Your patch was not addressing it - should I just remove "others"
> > from the list, as this was back from the days when the list wasn't checked
> > so strictly?
> >
> 
> Yes, go ahead.

https://lists.yoctoproject.org/pipermail/meta-ti/2019-September/012292.html


> > > > dont have any interest in this recipe.
> > > >
> > > > I can send a patch to blacklist it if thats fine with you.
> > >
> > > Fair enough, let me take a look at it myself.
> > >
> > >
> > > > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > >> ---
> > > > >>  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
> > > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >>
> > > > >> diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > > >> index 6c61a4e9..c86e3518 100644
> > > > >> --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > > >> +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > > >> @@ -4,7 +4,7 @@ PR = "r21"
> > > > >>
> > > > >>  inherit allarch
> > > > >>
> > > > >> -LICENSE = "GPLv2+ & MIT & PD & others"
> > > > >> +LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD & others"
> > > > >>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
> > > > >>
> > > > >>  SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
> > > > >> --
> > > > >> 2.23.0
> > > > >>
> > > > >> --
> > > > >> _______________________________________________
> > > > >> meta-ti mailing list
> > > > >> meta-ti@yoctoproject.org
> > > > >> https://lists.yoctoproject.org/listinfo/meta-ti
> > > --
> > > _______________________________________________
> > > meta-ti mailing list
> > > meta-ti@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-ti

