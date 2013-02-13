Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176]) (using TLSv1 with cipher RC4-SHA (128/128 bits))
	(No client certificate requested)
	by yocto-www.yoctoproject.org (Postfix) with ESMTPS id A0CACE006DE
	for <meta-ti@yoctoproject.org>; Wed, 13 Feb 2013 02:43:35 -0800 (PST)
Received: by mail-ve0-f176.google.com with SMTP id cz10so908188veb.21
	for <meta-ti@yoctoproject.org>; Wed, 13 Feb 2013 02:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=ltU48P8xtYUkkH00YsMSXTNj4Awto55GEjuOkofVp3Y=;
	b=rf+qlLkAqbh9VY5ZTSDIlB/91Y+sCZcDnNIJoTlI1D3NiPNrqgFvI1lvSjG2MYXPqu
	q46Oo3CAoqcFR20XPj+bIapE4h2nj4zVrY6uJYZ8wWs5YSMgtBbCq4WywEH1WQB/vaWd
	lV9U6xNFsjrlWoIrNsyksDAANwyNZZ0QXv7lCfWBccaFAXsxh5sBW3V1EVUPdlh9t8E/
	TkOpBru6HXWV0NX4gX6vkfiCLPmqNN/tUyA4pdLcFaSRGCbcuzdM4EOkjr93IVvENBDq
	kxrCs/vtP2TAvUxoCSVwi3u4ntTIEu2Il5R8I59gDHzl7dKGHYwmFtl4+WwtweiIZDU1
	M2ug==
MIME-Version: 1.0
X-Received: by 10.58.132.170 with SMTP id ov10mr27767261veb.57.1360752214573; 
	Wed, 13 Feb 2013 02:43:34 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 13 Feb 2013 02:43:34 -0800 (PST)
In-Reply-To: <CALbNGRRt7QoifHFqQMDeSY7g2ABt15_KhgBos6ijwGbLAOcpPw@mail.gmail.com>
References: <1360133872-10658-1-git-send-email-fcooper@ti.com>
	<1360133872-10658-2-git-send-email-fcooper@ti.com>
	<CALbNGRR-qnMUwuVNfehbvJRU9MqP5+EZhhhYji48x7UQTkfhJg@mail.gmail.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EEEE@DLEE09.ent.ti.com>
	<CALbNGRTz2rWBf3TCNziVM5dWOB1hMgTV=9O6w+vUZXDm+jd=4Q@mail.gmail.com>
	<CALbNGRQ1+WTt4uekk4rPcnQzhZzwTzpCd_NkZTXfDjQb4Z9N+A@mail.gmail.com>
	<CALbNGRSSsPvC8gRJ6nx0HjjQoPM1NBRoPNQFWBKrbqAz0hN54w@mail.gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C388EA4@DFLE09.ent.ti.com>
	<CALbNGRTnx5Tg8Vcme4eZ77bDSzwkaoHHuTa4C+z6tfM+bB4jwA@mail.gmail.com>
	<CALbNGRRt7QoifHFqQMDeSY7g2ABt15_KhgBos6ijwGbLAOcpPw@mail.gmail.com>
Date: Wed, 13 Feb 2013 11:43:34 +0100
Message-ID: <CALbNGRTbKfetZ3kDUnzFjx+cxM0O-mLob5HcjS4YMLmJ5DVyYA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] omap3-sgx-modules: Add v4.08.00.01 of the SGX modules
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
X-List-Received-Date: Wed, 13 Feb 2013 10:43:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2013 at 12:03 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Feb 7, 2013 at 5:25 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Thu, Feb 7, 2013 at 2:51 PM, Cooper Jr., Franklin <fcooper@ti.com> wr=
ote:
>>> Yes I've got this working for me on danny. However, I do use a non x11 =
build which is most likely the reason why I am not having this problem.
>>>
>>> A related thread about possible issues with x11 distributions
>>> https://lists.yoctoproject.org/pipermail/meta-ti/2012-September/001502.=
html
>>>
>>>
>> Have fixed this - after testing I will send a follow up patch series
>> because I am really burning to see the X11 stuff...
>>
>> Andreas
> Aargh - during tests I ran into other issues with oe-core/meta-oe
> current HEAD so I can not do run-tests. Build-tested results are at
>
> https://gitorious.org/schnitzeltony-oe-meta/meta-ti/commits/sgx-test
>
> As soon as HEADS are back and build working images I'll return on this...
>
OK I managed to build and am testing now. When loading pvr_drv X
complains for wrong ABI (is 10 expected 13). Is there a version of
Graphics SDK available with support for xserver 1.13? I saw
v4.08.00.02 supports xserver 1.12. Are there any other sources for the
userspace-driver part?

Andreas

