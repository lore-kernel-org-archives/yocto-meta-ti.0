Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B31A7E00C46; Mon, 30 Sep 2019 17:07:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DFBD8E006D2
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 17:07:28 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id x134so9559263qkb.0
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2019 17:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UvPZkrd+g/e+uWRTHJiYvgY0mA5r7+6cdMzrVHsTijQ=;
	b=V5pFfoRJzAwCxYsH27y95spfq2hPmXxfWhIQBfFHJsNe+BwuHEKLckYMZvL+GBjbvn
	ityo5xcBT4Qbzm0oLTnRdtU1x5UUxHkLXjgpcF8x2CRVKeIzzPGlfqIBJ4fd0wScNet9
	GDC7+ep0HNKCwhJIo3Bvxg2fhoevhRPtl5vUp36zwOhB3Oo2JzNnVx3EfxOT6PpUbWGd
	dbaJfMyNqQRi5zuiAYD6937NbV+mbk6TjpmBTCiD8YQhRZbmrdtnDYpHDZuKGszNWSeo
	AYBcGdqHyZiphtIRGaN2sXjEzbXJ7UX3n2ixonG17nAc1uh1mTK2QliozX1+XZrYabsA
	z1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UvPZkrd+g/e+uWRTHJiYvgY0mA5r7+6cdMzrVHsTijQ=;
	b=OImO3BvgXor8DjYMieKdF5Zao8CeK8R9eoGssrJI3KDX8pPXrrYszONlswaFN67h6S
	v5wYKDMLIX0805PKlIwiURyPymXD28kht2fVvZyBXiTWOq3QJO6gYSvLXeorm0ZE14u0
	Q2YHN7IR1VwF6xhzw4rgSvyWMbc3EYoQPP4nUdvAaN3s/hdf3a40TQ9I25AqmQpcXW9t
	ks6raAfPfUpji383o50zffbKCwo2f3PPv2yHqyyd2xVDJgqSpZqz2BVjN41DrLM97Tfz
	xbu0tcfnUXIRgtVGTPi8t69jvdIWm1fRdkZlel9wd36IxTrl2m0Wj2qRlQKzc+4Moh3r
	S6RQ==
X-Gm-Message-State: APjAAAXwalomJgJEB6sSbeuy06aZZMV6EbSZXz8d56LooCOZYuIe3eKs
	1Hxxy1OK3E3LCfFHaUZzxwW3BroReQWqVkuSrDQ=
X-Google-Smtp-Source: APXvYqzzv8QgGGkTj0vwfekDoxiOAL+J01KntgAQ2LeQ6ApgvFC2+SKyjHUubja3ApuxgZqbFMtsvTKA4EsMXH3twmI=
X-Received: by 2002:a37:6651:: with SMTP id a78mr3224024qkc.474.1569888447894; 
	Mon, 30 Sep 2019 17:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190929154335.2646732-1-raj.khem@gmail.com>
	<20190929154335.2646732-3-raj.khem@gmail.com>
	<20190930183244.GB12684@beryl>
	<83d37389-25a3-bc84-1a98-3e5670dc25f6@gmail.com>
	<20190930204356.GA15230@beryl> <20191001000014.GE15230@beryl>
In-Reply-To: <20191001000014.GE15230@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Sep 2019 17:07:01 -0700
Message-ID: <CAMKF1sokASu7UjG2nP5B+h0Xu8CfLpZXW950vWBiUcA=bYYOEg@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Tue, 01 Oct 2019 00:07:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 30, 2019 at 5:00 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Mon, Sep 30, 2019 at 04:43:56PM -0400, Denys Dmytriyenko wrote:
> > On Mon, Sep 30, 2019 at 01:40:23PM -0700, Khem Raj wrote:
> > >
> > >
> > > On 9/30/19 11:32 AM, Denys Dmytriyenko wrote:
> > > > On Sun, Sep 29, 2019 at 08:43:35AM -0700, Khem Raj wrote:
> > > >> This is as per
> > > >> https://github.com/jadonk/beaglebone-getting-started/blob/master/LICENSE.txt
> > > >
> > > > You are looking at the latest LICENSE file, while the recipe hasn't updated
> > > > its SRCREV since early 2012, back when beagleboard.org was still active in OE.
> > > > Specifically, GPLv3+ was added in 2013:
> > > > https://github.com/jadonk/beaglebone-getting-started/commits/master/LICENSE.txt
> > > >
> > > > We don't use this package, but I kept it in case someone still needs it. I did
> > > > put a README with a note in that directory:
> > > > http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README
> > > >
> > > > Probably, this can be updated to the latest, as part of fixing the LICENSE? :)
> > > >
> > >
> > > The README should be specific about which recipes are not maintained, it
> > > has a general statement which gives a scare, if the recipe is not
> > > maintained then this should be removed or atleast blacklisted if you
> > > still want to keep it around.
> > >
> > > I was trying to help clearing up license warnings, other than that I
>
> BTW, the only warning I see for this recipe, is that "others" license is
> unknown. Your patch was not addressing it - should I just remove "others"
> from the list, as this was back from the days when the list wasn't checked
> so strictly?
>

Yes, go ahead.

>
> > > dont have any interest in this recipe.
> > >
> > > I can send a patch to blacklist it if thats fine with you.
> >
> > Fair enough, let me take a look at it myself.
> >
> >
> > > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > >> ---
> > > >>  recipes-ti/beagleboard/beaglebone-getting-started.bb | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/recipes-ti/beagleboard/beaglebone-getting-started.bb b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > >> index 6c61a4e9..c86e3518 100644
> > > >> --- a/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > >> +++ b/recipes-ti/beagleboard/beaglebone-getting-started.bb
> > > >> @@ -4,7 +4,7 @@ PR = "r21"
> > > >>
> > > >>  inherit allarch
> > > >>
> > > >> -LICENSE = "GPLv2+ & MIT & PD & others"
> > > >> +LICENSE = "CC-BY-SA-3.0 & GPLv3+ & MIT & PD & others"
> > > >>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
> > > >>
> > > >>  SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
> > > >> --
> > > >> 2.23.0
> > > >>
> > > >> --
> > > >> _______________________________________________
> > > >> meta-ti mailing list
> > > >> meta-ti@yoctoproject.org
> > > >> https://lists.yoctoproject.org/listinfo/meta-ti
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti

