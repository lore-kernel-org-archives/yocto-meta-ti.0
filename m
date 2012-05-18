Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F469E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:40:26 -0700 (PDT)
Received: by lagz14 with SMTP id z14so2983089lag.35
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:40:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=RuZEiwcEePV6s11MaU2LieBj3quJ9oBdO6+V1DzWk7s=;
	b=cOircROjU2L9V7OnUdEN4loQOcNafWUqBWsRHb9duJ3yAMNaBozQCUC/qFTmXjnP2t
	IXyF4vvA/+4BT1Y1OKjfN77etd2D5v+UbJYi3sq6vJWMwIW9rHtxU3WkihmuEBivSx1w
	4pHd8zmSdKc+d4sOAyMKL5mIvLkmXrLr0b4sPYAUOuZJawnXRXS5PPFgHlFrH4rdN+zw
	p5JOuhc1QUS7hishwVNgmOTOcT1YDjR4iCtI/+5xhrKnzWDcaUbTvuYoRaz1dLosIIVv
	c52GiSEt+KuRl41x4ZbFH4ZxrDCZqMDYGu9n00T+a7GfQLY003Hd0chvPewRoYPxXizj
	lo/Q==
MIME-Version: 1.0
Received: by 10.152.148.234 with SMTP id tv10mr11276915lab.41.1337352025126;
	Fri, 18 May 2012 07:40:25 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 07:40:25 -0700 (PDT)
In-Reply-To: <331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
Date: Fri, 18 May 2012 16:40:25 +0200
Message-ID: <CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkCEqw0/tdILJLdR+xZHT3iCzyjLL8eK4sXWkssjDBt1jo+5T7z4CjXUdjg/eUgOPvzTHNL
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org
Subject: Re: [oe] ti81xx-psp-linux-2.6.37: broken kernel with gcc > 4.5
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2012 14:40:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>>>>>> affects both projects one way or the other.
>>>>>>
>>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This me=
ans
>>>>>> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.=
7.
>>>>>> However, both compilers break the kernel we're using
>>>>>> (ti81xx-psp-linux-2.6.37).
>>>>>
>>>>> What happens when you disable the mailbox? AIUI you shouldn't need th=
at on
>>>>> Ne/Ce.
>>>>
>>>> How do I disable the mailbox?
>>>
>>> In the .config
>>
>> Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
>> need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
>> bridge. Disabling it would mean cutting off our DSP. No way.
>
> Are you actually using dspbridge? Or are you using dsplink or syslink?

No, I was wrong. OMAP_MBOX_FWK is forced to "Y" in our config and I
thought DSPBRIDGE forced this. But DSPBRIDGE isn't even active in our
configuration. I cannot turn OMAP_MBOX_FWK off, it's forced to Y, and
I'm currently trying to figure out which part of
ti81xx-psp-linux-2.6.37's wicked configuration is causing this.

>>>> What do you mean by Ne/Ce?
>>>
>>> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is call=
ing it nowadays.
>>
>> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
>> C674x DSP.
>
> So a centaurus family SoC.

Thanks for the clarification :) TI didn't approach us with any of the
terms you mentioned. It's just DaVinci for them when they're talking
with us.

>
>> I think the only ones left without DSPs are AM-...
>> processors. So no, the DSP bridge (and therefore mailboxing) must
>> stay.
>
> See what I said above, I doubt you're using dspbridge.

You may be right; I didn't dig into DSP communication so far. Also,
DSPBRIDGE depends on OMAP3, which we don't have (dm8148 is a
"OMAP2PLUS"). So I was wrong with DSPBRIDGE forcing OMAP_MBOX_FWK.
OMAP_MBOX_FWK is just active and I can't switch it off.

Regards,
Thilo

--=20
Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
Tel: +49 (30) 515 932 228 =C2=A0 mailto:fromm@dresearch-fe.de
Fax: +49 (30) 515 932 77 =C2=A0 =C2=A0http://www.dresearch.de
Amtsgericht: Berlin Charlottenburg, HRB 130120 B
Ust.-IDNr. DE273952058
Gesch=C3=A4ftsf=C3=BChrer: Dr. M. Weber, W. M=C3=B6gle

