Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61F44E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 06:39:43 -0700 (PDT)
Received: by lboj14 with SMTP id j14so2926233lbo.35
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 06:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=BcagSHV8Hf3tmi60tZK25jfJYli+rAudSlzhR0Ev4GE=;
	b=QLX7Zp6EuHu1EwMtRBOVp6dCWIwJLDNOLGxWXEbe779y9sgKMmvqT7XLios+N7jym8
	WjaDxAbS5ThR1G4YuqeupC7OEFd/fTfSFGCUuFPiOpkGV2ct8/hCT1cUnTzwk4yJ0Rzt
	HmHtsHtigKh9gSC1kcXjj2yYTPqu2/5F76Lh32JZZBs+rtceHLSCfKHoovvLtxI5UeyG
	p9Fliyz5ujeLMVlR6YTsUNjBO1PCAHASjKCZuoCjTlQju956V3H/HcpuhsiLCDca+B6t
	qrkOCkW1nNTnNTmjm4T0wPUBCUc9IgMWj6jZ9YfcyS+OINOwwa9zLVMo166MNrmN0Rki
	3IyA==
MIME-Version: 1.0
Received: by 10.112.86.132 with SMTP id p4mr4793582lbz.22.1337348381813; Fri,
	18 May 2012 06:39:41 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 06:39:41 -0700 (PDT)
In-Reply-To: <C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
Date: Fri, 18 May 2012 15:39:41 +0200
Message-ID: <CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkIMFlT9GqaGktgq2FQMd2r79M7Qte0F2YDFlM7EnbuTBKQVKsLcyP4sBs6UluvKAZPZzX+
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
X-List-Received-Date: Fri, 18 May 2012 13:39:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Koen,

>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think this
>>>> affects both projects one way or the other.
>>>>
>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This mean=
s
>>>> with oe-core + meta-oe you now can choose between gcc-4.6 and gcc-4.7.
>>>> However, both compilers break the kernel we're using
>>>> (ti81xx-psp-linux-2.6.37).
>>>
>>> What happens when you disable the mailbox? AIUI you shouldn't need that=
 on
>>> Ne/Ce.
>>
>> How do I disable the mailbox?
>
> In the .config

Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
bridge. Disabling it would mean cutting off our DSP. No way.

>> What do you mean by Ne/Ce?
>
> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is callin=
g it nowadays.

We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
C674x DSP. I think the only ones left without DSPs are AM-...
processors. So no, the DSP bridge (and therefore mailboxing) must
stay.

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

