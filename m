Return-Path: <fathi.boudra@linaro.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AD276E009CE; Fri, 17 Mar 2017 10:14:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.128.171 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.128.171 listed in dnsbl.sorbs.net]
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com
	[209.85.128.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1E005E00985
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:14:57 -0700 (PDT)
Received: by mail-wr0-f171.google.com with SMTP id u48so56152273wrc.0
	for <meta-ti@yoctoproject.org>; Fri, 17 Mar 2017 10:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XD1Ufnw3Wa4YK9t9rTpGvI4VukBS3A5fH+oGX6BMxQM=;
	b=hq0Vfwh54QzrcnC8TqTPI6/0k5kc8sQZ9652YgYK1HWn9TRRc549odUqFfV/4bBIuR
	mSDvGsP9l4b9bPtXFvf5oOKv4mrv9bqvJ/5/+v1v4dGU0KvOhbkDd9oKfxf4t5Jr11Oo
	Xtj55sFQUOoMNGkEZa0ywNlfZAEENEcknMe1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XD1Ufnw3Wa4YK9t9rTpGvI4VukBS3A5fH+oGX6BMxQM=;
	b=L4+KA12PXfDkjKvbCu/9OwScOfJZe1dsynMFIQLsOScPEPn4OffV0ebYv9aJeJ2N7n
	gdTsGnByq8WhGIzxa+SsV58vSGmkzc3g/xDwaTFI1+BPWrECaLf83+NCSvmelGw7RJr2
	z4v73gI2pYGbRkW6VO1hXWPAw1Qfi5VFnTmSBEjj+G5ZW28JFf7bbEFYjTEHgoMrxeMP
	Ilex2xsa8TcE859rv/biW+aWeN4EN1zM4kTUpJqWeBrEBKlUhCvVfvdEfLTgn/KReV/z
	fnxLV1CCKA5VPXQGaN3kx7eF8fpab9ERheP3DVjlT2+G1Z4f+Xk/v/8rvqAXfd9VlX2Y
	DeFA==
X-Gm-Message-State: AFeK/H3wCI/6cgDFCoYxRcGYNaEFK6dKJ0+RKAPPcqog22Sg2CP+zAponJVyQaol2UHVTRVU9ZOVf5W5ofXr0dMz
X-Received: by 10.223.163.70 with SMTP id d6mr13634794wrb.71.1489770896878;
	Fri, 17 Mar 2017 10:14:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.54.90 with HTTP; Fri, 17 Mar 2017 10:14:56 -0700 (PDT)
In-Reply-To: <20170317170617.GS15664@denix.org>
References: <20170317163653.13127-1-fathi.boudra@linaro.org>
	<CAMKF1soj5A0YKTiJOJZb2sB2ZaepsabPAQr=MAd6zdS8JS_=HA@mail.gmail.com>
	<20170317165916.GQ15664@denix.org>
	<CAGNsrLCTqVJ0ehfG6nMmwbfac2ZWjAdRO8m3yxtybdYgMm8zWw@mail.gmail.com>
	<20170317170617.GS15664@denix.org>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Fri, 17 Mar 2017 19:14:56 +0200
Message-ID: <CAGNsrLAFsBYPFbS2Sxb0iKQ=KV2BqD4A+DdoWe3ViufRifRmfw@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Mar 2017 17:14:59 -0000
Content-Type: text/plain; charset=UTF-8

On 17 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Mar 17, 2017 at 07:03:55PM +0200, Fathi Boudra wrote:
>> On 17 March 2017 at 18:59, Denys Dmytriyenko <denis@denix.org> wrote:
>> > On Fri, Mar 17, 2017 at 04:47:59PM +0000, Khem Raj wrote:
>> >> On Fri, Mar 17, 2017 at 9:37 AM Fathi Boudra <fathi.boudra@linaro.org>
>> >> wrote:
>> >>
>> >> > libpcap-ng is required to build capabilities tests.
>> >> >
>> >> > Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>> >> > ---
>> >> >  recipes-kernel/kselftests/kselftests_4.9.bb | 4 +---
>> >> >  1 file changed, 1 insertion(+), 3 deletions(-)
>> >> >
>> >> > diff --git a/recipes-kernel/kselftests/kselftests_4.9.bb
>> >> > b/recipes-kernel/kselftests/kselftests_4.9.bb
>> >> > index a7b4ba67..dd94a65b 100644
>> >> > --- a/recipes-kernel/kselftests/kselftests_4.9.bb
>> >> > +++ b/recipes-kernel/kselftests/kselftests_4.9.bb
>> >> > @@ -11,7 +11,7 @@ S = "${WORKDIR}/linux-${PV}"
>> >> >
>> >> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
>> >> >
>> >> > -DEPENDS = "libcap popt rsync-native"
>> >> > +DEPENDS = "libcap libcap-ng popt rsync-native"
>> >>
>> >>
>> >> Would ng replace old libcap
>> >
>> > Are you asking in general or in this particular case?
>> >
>> > kselftests-capabilities does use libcap-ng and includes cap-ng.h header file,
>> > as I mentioned here:
>> > https://lists.yoctoproject.org/pipermail/meta-ti/2017-March/009766.html
>> >
>> > Fathi's fix is indeed better, even though adding another dependency.
>>
>> In this particular case, it doesn't replace libcap.
>> Upstream managed to use libcap-ng in capabilities test and libpcap in
>> bpf test...
>> I'm currently queuing patches for upstream.
>
> What the status of the old libcap? Is it being deprecated everywhere?

The traditional libcap is still mainly used. I don't think it's going
to be deprecated soon, systemd is using it for example.

>> >> >  inherit kernel-arch
>> >> >
>> >> > @@ -139,8 +139,6 @@ FILES_${PN}-x86 = "${bindir}/kselftests/x86"
>> >> >  FILES_${PN}-zram = "${bindir}/kselftests/zram"
>> >> >  FILES_${PN}-dbg += "${bindir}/kselftests/*/.debug"
>> >> >
>> >> > -ALLOW_EMPTY_${PN}-capabilities = "1"
>> >> > -
>> >> >  RDEPENDS_${PN}-cpu-hotplug += "bash"
>> >> >  RDEPENDS_${PN}-efivarfs += "bash"
>> >> >  RDEPENDS_${PN}-memory-hotplug += "bash"
>> >> > --
>> >> > 2.11.0
>> >> >
>> >> > --
>> >> > _______________________________________________
>> >> > meta-ti mailing list
>> >> > meta-ti@yoctoproject.org
>> >> > https://lists.yoctoproject.org/listinfo/meta-ti
>> >> >

