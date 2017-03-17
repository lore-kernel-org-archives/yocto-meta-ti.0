Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 185A1E009CF; Fri, 17 Mar 2017 11:57:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D53FFE009B9
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:57:36 -0700 (PDT)
Received: by mail-wm0-f67.google.com with SMTP id u132so4673098wmg.1
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vBLO2+/pyKIh9MMpY5U7fpmvjyzf7wbWQzVQhq9cNBU=;
	b=nwPh9NaTxVQZU8HCYjfqDvRLRx6dQvfAjjfpddMSjZd6o2EU7Ew3MAyFtTIUTa/nkX
	oPf3B7lwsg1MHN3ETH8iF5INmfMCLvhogStnA43uwwihVcWr34f1ovgfRCpjkZThqGy9
	FmcVFb7u60XiUmqBR9NyI72COzYqazW30pLjfSRrUUkzQofIJL8psQrztF12qg05xzEQ
	rvLqztPOQyxXnRZgJTmUWqcsNuogeCxF8/bLhWdzAp41oNQ9pd2ufL6Y0RMcxKg7hQB1
	DVIuh836Cj8YyRIIKyqdHGpXZrHdpTDlTVSuRdH2R4HaaF4XS07VpJ/Z9vzq8HUKbumg
	gWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vBLO2+/pyKIh9MMpY5U7fpmvjyzf7wbWQzVQhq9cNBU=;
	b=DeZJiJV10wkzACHfZH11aKywdS26m9a6DvxdywblDO2lfWSbkIjZCFTiR2UqvdIjnc
	+MluxgSeu64eVLlDatHCOOsoMEDuZBBHqpjQEZH291rWLw+bnFy367BpBriqI4DSVvYN
	5p7PoABfU4WeDTPE6ti0Z/yUKGltBCoD1TXAqEDK0uZpmakE3W5OxA1A5KtAKh8+CGaY
	3lkwJzT/jiChrSKDtOlko54vBZxajMTM6hAlsfZrKgQQF1FLVqVttYdgbq7fChsZ7q4U
	2IeFgSnHct3hGyqMsLOWfJWlOY+30TMQY2NXnIQdnq8QJsWxl2feD+QSjMsB7z4vD6dM
	xqnQ==
X-Gm-Message-State: AFeK/H1+xgH13+xhHy3SXYC/zQS8IfsaPnCcePhtl3tWNQrNQ0yeHirSw7ijrtYk9BV46pomCZ5SkBkgug9HOQ==
X-Received: by 10.28.199.132 with SMTP id x126mr4022286wmf.37.1489777055654;
	Fri, 17 Mar 2017 11:57:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 17 Mar 2017 11:57:04 -0700 (PDT)
In-Reply-To: <CAGNsrLAFsBYPFbS2Sxb0iKQ=KV2BqD4A+DdoWe3ViufRifRmfw@mail.gmail.com>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
	<CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
	<20170317170617.GS15664@denix.org>
	<CAGNsrLAFsBYPFbS2Sxb0iKQ=KV2BqD4A+DdoWe3ViufRifRmfw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Mar 2017 11:57:04 -0700
Message-ID: <CAMKF1so20TiHmt6Q778jhYoc0CFGWudoHN=VF3TPJo5daQquTA@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
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
X-List-Received-Date: Fri, 17 Mar 2017 18:57:40 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 17, 2017 at 10:14 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> On 17 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:
>> On Fri, Mar 17, 2017 at 07:03:55PM +0200, Fathi Boudra wrote:
>>> On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
>>> > On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
>>> >> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
>>> >> wrote:
>>> >>
>>> >> > libpcap-ng is required to build capabilities tests.
>>> >> >
>>> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>>> >> > ---
>>> >> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>>> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
>>> >> >
>>> >> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
>>> >> > b/recipes-kernel/kselftests/kselftests_4.9.bb
>>> >> > index a7b4ba67..dd94a65b 100644
>>> >> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
>>> >> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
>>> >> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>>> >> >
>>> >> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>> >> >
>>> >> > -DEPENDS = "libcap popt rsync-native"
>>> >> > +DEPENDS = "libcap libcap-ng popt rsync-native"
>>> >>
>>> >>
>>> >> Would ng replace old libcap
>>> >
>>> > Are you asking in general or in this particular case?
>>> >
>>> > kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
>>> > as I mentioned here:
>>> > https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
>>> >
>>> > Fathi's fix is indeed better, even though adding another dependency.
>>>
>>> In this particular case, it doesn't replace libcap.
>>> Upstream managed to use libcap-ng in capabilities test and libpcap in
>>> bpf test...
>>> I'm currently queuing patches for upstream.
>>
>> What the status of the old libcap? Is it being deprecated everywhere?
>
> The traditional libcap is still mainly used. I don't think it's going
> to be deprecated soon, systemd is using it for example.
>

can both libs live together without stepping on each other ?

