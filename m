Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C965E009CE; Fri, 17 Mar 2017 10:04:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.53 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36A12E00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:03:57 -0700 (PDT)
Received: by mail-wm0-f53.google.com with SMTP id u132so20441412wmg.0
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2/iIFF6YnMHusE0ElctZcBrKPuWd8QRB5zR2NO4bvh4=;
	b=OYUPov0pzfYL9RoQy5TzJi+H+AzZz+MWRklspacsdN+mKtq558T7cA1lk/lUbcjFtj
	cykFhhd2gOGjh6NGWWjyy5SnO5TXxrUJwnjXhNkW0eFjvo6OdoOryfLZaLk+RT/DQQaU
	mksIfGYVDXBauohmafTGKIer68rDmJUPiM1js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2/iIFF6YnMHusE0ElctZcBrKPuWd8QRB5zR2NO4bvh4=;
	b=scpzdkirgl9d/+2Fq963up171QUhy8P20d6r+gL/vEOfOF6ToN90O9AZ4ZktwjXLHs
	U7BDegXNs7yFG74qZGq3bDBta/BSOOx+ijzVg9aP9Xx9pK4nnT3R1YNcb7XzFC/Lq92a
	7wTtM40PtQluaxAMGEhCVaIua6xp9P+esUiNcNKB3U48M26JcAkwLYiXIGRFjDQiSr/U
	z5D8imMGsihsmYLFrjbjZBUm5VKLuxXSar1+IhMKrY48JVMOBqpZCNYcQrAUCcaPDMcl
	+FatP+bkgBzlEFLePQpw5QvNMkUNxFBV7AAhVdBhNEZ/peRUopQY+bTvBXFtZRQpzV+o
	Z2Bw==
X-Gm-Message-State: AFeK/H0toMtRyXD14skDEbBVyINyluxNGemLSJa5Up9NNLuzs3oqAGjWHfhxAimMs/1yHju4VdmsqLZ5Tg82E9Xc
X-Received: by 10.28.212.85 with SMTP id l82mr3752174wmg.45.1489770236232;
	Fri, 17 Mar 2017 10:03:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Fri, 17 Mar 2017 10:03:55 -0700 (PDT)
In-Reply-To: <20170317165916.GQ15664@denix.org>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Fri, 17 Mar 2017 19:03:55 +0200
Message-ID: <CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
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
X-List-Received-Date: Fri, 17 Mar 2017 17:04:00 -0000
Content-Type: text/plain; charset=UTF-8

On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
>> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
>> wrote:
>>
>> > libpcap-ng is required to build capabilities tests.
>> >
>> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> > ---
>> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>> >  1 file changed, 1 insertion(+), 3 deletions(-)
>> >
>> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
>> > b/recipes-kernel/kselftests/kselftests_4.9.bb
>> > index a7b4ba67..dd94a65b 100644
>> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
>> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
>> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>> >
>> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> >
>> > -DEPENDS = "libcap popt rsync-native"
>> > +DEPENDS = "libcap libcap-ng popt rsync-native"
>>
>>
>> Would ng replace old libcap
>
> Are you asking in general or in this particular case?
>
> kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
> as I mentioned here:
> https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
>
> Fathi's fix is indeed better, even though adding another dependency.

In this particular case, it doesn't replace libcap.
Upstream managed to use libcap-ng in capabilities test and libpcap in
bpf test...
I'm currently queuing patches for upstream.

>> >  inherit kernel-arch
>> >
>> > @@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
>> >  FILES_${PN}-zram = "${bindir}/kselftests/zram"
>> >  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>> >
>> > -ALLOW_EMPTY_${PN}-capabilities = "1"
>> > -
>> >  RDEPENDS_${PN}-cpu-hotplug += "bash"
>> >  RDEPENDS_${PN}-efivarfs += "bash"
>> >  RDEPENDS_${PN}-memory-hotplug += "bash"
>> > --
>> > 2.11.0
>> >
>> > --
>> > _______________________________________________
>> > meta-ti mailing list
>> > meta-ti@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-ti
>> >

