Return-Path: <raj.khem@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63CE6E01304
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 13:55:00 -0700 (PDT)
Received: by eekd41 with SMTP id d41so93299eek.35
	for <meta-ti@yoctoproject.org>; Tue, 21 Aug 2012 13:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HW7NXxHS/6m7bM8OY4yB51hre4hOchr+2sAkr1yIMJU=;
	b=AF4xnr7vRyTzJnH5Ybe8KlhH4BAGnCR6MI4DcKru1q4Gkmmtmhm/Md/u1SURbmNhri
	FpbBPeC5cofaUxjYb+wKP4qA2pe8UplxWO2A5hwZbobVBNUUK5uidWA3cVCbVgVbT4/5
	jLLlr2VosPJh1odE5tqaEPxKhylAbxvOH3fVtxSQbD7JOHFA6y32lh+nGARCwvo7nZ3X
	8yPrjdvaQko8PQ5UgSgZNKEuWfojnR44DB7RtFy8qAr89kwN63dDsb7YTXgZhPXKS90Z
	PZSmvbBJNk4Zz9Vaa7jw4vfiCmcjdkcfZhaD2hu/VJs/Xmxh/AtGgd9ioMnbgBPE0njg
	Q8nA==
Received: by 10.14.5.67 with SMTP id 43mr15158319eek.15.1345582499222; Tue, 21
	Aug 2012 13:54:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 21 Aug 2012 13:54:28 -0700 (PDT)
In-Reply-To: <20120821195359.GC7636@edge>
References: <1345535127.49985.YahooMailNeo@web121206.mail.ne1.yahoo.com>
	<20120821180942.GB7636@edge>
	<CAMKF1sqpM+wVj_EGAqojAUbknH_WnBb4L9nZh3-fH2uDhEx4RA@mail.gmail.com>
	<20120821195359.GC7636@edge>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Aug 2012 13:54:28 -0700
Message-ID: <CAMKF1sobc2Xu1Ti-CyOP3PELRXst2WRXB3z3+_FDTgFGfGjm3Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Linaro and CS ABI compatibility
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
X-List-Received-Date: Tue, 21 Aug 2012 20:55:00 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 21, 2012 at 12:54 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Tue, Aug 21, 2012 at 11:39:07AM -0700, Khem Raj wrote:
>> On Tue, Aug 21, 2012 at 11:09 AM, Denys Dmytriyenko <denys@ti.com> wrote:
>> >
>> > BTW, Yocto Project prefers self-built toolchain, although you can easily add
>> > Linaro toolchain with meta-linaro layer.
>>
>> There are no ABI differences even though its built separately.
>
> Linaro's external (i.e. pre-built) toolchain now defaults to hardfp, so still
> need to pay attention to possible ABI mismatch...

you would use callconvention-hard TUNE_FEATURE in such a case which
would configure
internal toolchain to do hardfp call convention. But yes when it comes
to prebuilt
toolchains a bit of extra care is always good.

>
> --
> Denys

