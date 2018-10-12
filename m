Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CA60E00B92; Fri, 12 Oct 2018 13:49:36 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9E51E00B6C
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 13:49:32 -0700 (PDT)
Received: by mail-qk1-f195.google.com with SMTP id m8-v6so8465294qka.12
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2018 13:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qBtaN5RH3Z3nxlR058+YMQnFuM7TWTrpszdhNzc2UeA=;
	b=WQm/JwaZgByA80DdZFIWB7qcizDCqug2557qcnnZXcDvekX79gkYyb71Z7bGMuP9SZ
	tPte+CYJMccYBFRgtq8ZiiaWXpoFaYsi+zow/JIqQl42UJr/nUDOcQGd6Cvp8vvqaQET
	LIwubofbEzzkRRt2biUv6DSVwaLbQiAEE0y1y/HXCbsfygEletoS+E/Ze1Y7AmIR+aQU
	LvUaygwKuyj4QLXMdrXMsS6AITvJkQXVZmq6dVUTnFOQ/TMmbn5qsgfhgp47BcShc0SR
	qwb0OTmR4YMRtPiHzoC4GKH/JsTNwfZ4OEhPOv1NOwCsgPT35bxP2HTwI63Z1Le2Ikv9
	EHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qBtaN5RH3Z3nxlR058+YMQnFuM7TWTrpszdhNzc2UeA=;
	b=DcXOcOr9RrVBQr2kIiErF29x7gJlHH4gic4LVwLJqF+RFoa8fczIXLlbZDJxezogt1
	QPBxaNFOOW+y9PLaDjXOOaVSUAk5P51xiCXqGGwXnk1RG3EEJxVyDWwYSHGIumY2nitT
	nbZl3vFf+CUQ1tfW7pjWaShE/eajnvC9o8ZgAx2XVwmkcV/9uDhsr1tL/Yu8YTXoTU72
	oMnHpE17f19QAo65HhDpD5Eu4rFpjCdcrhv4n6PvLksrnkOou/zXZ0Z+CJ6v8khpQV/e
	N4mcHqVv2vShcR92xHx8OvG0hn4hXX2gImP/QY395Vp/hTsIc6CrbL7nPP52h8pHLOCX
	cwJg==
X-Gm-Message-State: ABuFfohEH08eYah+OB0ViV+DCUrj7HLwbgUDGyu2O7hjBdD+4ZFd3bt4
	ygkCBaiGkx75A+4nlZVbwwA7BK3lLo2i5Eq3pmI=
X-Google-Smtp-Source: ACcGV627e4hrWu6zAqdPimOgabdAowoFaXaDv5DGAnW5689tWnUPh84LoK5dzjISwHaxsPnAd7AgG+QdPosamFzW21I=
X-Received: by 2002:a37:655:: with SMTP id 82-v6mr7119301qkg.223.1539377371792;
	Fri, 12 Oct 2018 13:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20181012195000.4545-1-raj.khem@gmail.com>
	<20181012195801.GV19188@beryl>
	<CAMKF1spE0fJTErUNg=ifQx9s2T-UybjAL++GFwZM+Pyi77pJwg@mail.gmail.com>
	<20181012203149.GW19188@beryl>
	<CAMKF1sqh743UGN0DeWEoR1jX=2NQYGtwh+ONEg+q0MTXkkx3aA@mail.gmail.com>
	<20181012203700.GY19188@beryl>
In-Reply-To: <20181012203700.GY19188@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Oct 2018 13:49:05 -0700
Message-ID: <CAMKF1sr48=qWuYYGA4DBbA7Mz+SeOquVfv8iLCWXh66+_pfYQw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] beaglebone-getting-started: Use cp options to not alter file mode
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
X-List-Received-Date: Fri, 12 Oct 2018 20:49:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 12, 2018 at 1:37 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Fri, Oct 12, 2018 at 01:34:13PM -0700, Khem Raj wrote:
> > On Fri, Oct 12, 2018 at 1:31 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > >
> > > On Fri, Oct 12, 2018 at 01:01:41PM -0700, Khem Raj wrote:
> > > > On Fri, Oct 12, 2018 at 12:58 PM Denys Dmytriyenko <denys@ti.com> wrote:
> > > > >
> > > > > Are you still trying to do world builds? :)
> > > > >
> > > >
> > > > yes. with the patches I send in this week meta-ti seems to behave in
> > > > multi-BSP setup
> > > > I will soon add it to bblayers.conf for Yoe distro and it will start
> > > > testing on meta-openembedded CI builds, atleast for not nosing other
> > > > BSPs, I dont have infra to do world build for all the machines
> > > >
> > > > but if you were to pick Yoe distro and run with it for machines you
> > > > are interested in
> > > > that would be awesome.
> > > >
> > > > See. https://github.com/YoeDistro/yoe-distro, everyone having interesting boards
> > > > is welcome to run world builds using that and report problems.
> > >
> > > I can probably add it to my CI loop as well - I already do extensive builds
> > > and tests on Arago, Poky and distroless.
> >
> > Cool thanks. Although you wont need all of above
> > after this :)
>
> Meaning?

Yoe is a superset

