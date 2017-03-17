Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ED607E009CF; Fri, 17 Mar 2017 12:12:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.67 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 626BFE009B9
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 12:12:55 -0700 (PDT)
Received: by mail-wm0-f67.google.com with SMTP id u132so4724268wmg.1
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 12:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0o9KZKhKMqMPd/IcOGhmh1oE86A2SSJX5UdCWuply6g=;
	b=YLowjRHYEs166al1rRh8TPhm6kfTF3BWab7a5OJTB+Run6y/GdzifKIYl5PspW38kX
	Lk/M3RJX4o7QTONbfidUXk//CTh4sgNVtJdXdMeicSEElJ2vtZsZCQ2bhvbs0kQjsak4
	/0A6YipnSVqCqqn5o+6jCtgAF8RKESMOQ95gz3CpQ+JuTJZPxeamJr32JmaDFfLMUWPR
	dMQR2jTUekFCNegfJCAp7gKE++9WnYJabFeRaUPpCIubNJVHcFCN2QpJWl8jPQZFiqBh
	qAckTVG51ccCiYU7MNchjr7qMULhcvLf7t7a09gYWM/7MpRACj8corwHit/n/Xoxv6IP
	uAyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0o9KZKhKMqMPd/IcOGhmh1oE86A2SSJX5UdCWuply6g=;
	b=PooiTwOjwVrktOlJhy6I4x6kuDhBOG7Hvbo1pkH/p8gaTWIppq4VEeYUL/ciVJsxHp
	yQaA8kTRQ6zeO+85Lrg7u17Wsiw7Ibevq1/kDlDPwEgOPawhD72oo4g+Z8LCLLebSkiR
	yEVpSZVwGXvjb8Vw08NfvLQdHpXu0al2RJVgsUaWoR6HXiyt+lmFs7uoYArIC00loTTC
	tXjVPJfjsLiU43GnLFIdHXC097Se6i5qlK2QdEaDufTIdEi5kZp4FfOdNLKMzA4HvYB4
	A56R31V/LX6MDUrN+NgkcgWYgThU8VrW1IKxrkFgkttHTdVomPukqtovA4uKVd5QFvVC
	FWiQ==
X-Gm-Message-State: AFeK/H35G1J3sybhftVCfbynQqxiTW2f7beZkmiNQ6Y+cTTWxP8WlniVzlDTnSfr5ZK52t/v9VmV3m4ZbdBh1w==
X-Received: by 10.28.103.194 with SMTP id b185mr4444451wmc.13.1489777975152;
	Fri, 17 Mar 2017 12:12:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Fri, 17 Mar 2017 12:12:24 -0700 (PDT)
In-Reply-To: <20170317190405.GC14484@edge>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
	<CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
	<20170317170617.GS15664@denix.org>
	<CAGNsrLAFsBYPFbS2Sxb0iKQ=KV2BqD4A+DdoWe3ViufRifRmfw@mail.gmail.com>
	<CAMKF1so20TiHmt6Q778jhYoc0CFGWudoHN=VF3TPJo5daQquTA@mail.gmail.com>
	<20170317190405.GC14484@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 17 Mar 2017 12:12:24 -0700
Message-ID: <CAMKF1sp9KOiUuvwx-RJ0B65CgAXodyEG1VezqTPFOfS6EPPbVQ@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Fri, 17 Mar 2017 19:12:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 17, 2017 at 12:04 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Fri, Mar 17, 2017 at 11:57:04AM -0700, Khem Raj wrote:
>> On Fri, Mar 17, 2017 at 10:14 AM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>> > On 17 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:
>> >> On Fri, Mar 17, 2017 at 07:03:55PM +0200, Fathi Boudra wrote:
>> >>> On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
>> >>> > On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
>> >>> >> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
>> >>> >> wrote:
>> >>> >>
>> >>> >> > libpcap-ng is required to build capabilities tests.
>> >>> >> >
>> >>> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> >>> >> > ---
>> >>> >> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>> >>> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
>> >>> >> >
>> >>> >> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
>> >>> >> > b/recipes-kernel/kselftests/kselftests_4.9.bb
>> >>> >> > index a7b4ba67..dd94a65b 100644
>> >>> >> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
>> >>> >> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
>> >>> >> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>> >>> >> >
>> >>> >> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> >>> >> >
>> >>> >> > -DEPENDS = "libcap popt rsync-native"
>> >>> >> > +DEPENDS = "libcap libcap-ng popt rsync-native"
>> >>> >>
>> >>> >>
>> >>> >> Would ng replace old libcap
>> >>> >
>> >>> > Are you asking in general or in this particular case?
>> >>> >
>> >>> > kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
>> >>> > as I mentioned here:
>> >>> > https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
>> >>> >
>> >>> > Fathi's fix is indeed better, even though adding another dependency.
>> >>>
>> >>> In this particular case, it doesn't replace libcap.
>> >>> Upstream managed to use libcap-ng in capabilities test and libpcap in
>> >>> bpf test...
>> >>> I'm currently queuing patches for upstream.
>> >>
>> >> What the status of the old libcap? Is it being deprecated everywhere?
>> >
>> > The traditional libcap is still mainly used. I don't think it's going
>> > to be deprecated soon, systemd is using it for example.
>> >
>>
>> can both libs live together without stepping on each other ?
>
> FWIW, I haven't tested on all platforms yet (still crunching), but the initial
> results I'm getting here show no build, stage or run-time issues with images
> that include both kselftests and systemd...
>

OK you might want to compare the contents of both packages
and see if there are any changes that can have effect on behavior subtly.

> --
> Denys

