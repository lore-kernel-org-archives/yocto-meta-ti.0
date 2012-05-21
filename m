Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 668DEE0142F
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 01:00:58 -0700 (PDT)
Received: by lagz14 with SMTP id z14so4602425lag.35
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 01:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=zlvM2sswxwkKCK9Ni1Ntk2I2Zimc+yWtSyjTPNoWECY=;
	b=FQrOql3kdA7WoL0yISb+VklluHc3ir2wmGAwTqPpGKKWiCeiTpwRsDuRs46xIJDaXk
	eYq8gtx7IWFwVA9BkDZdb9g6ZpmtZys+AiXpGhjP1TJgIkYo4W1vX+iutXkYjkjEzl8X
	mVjtDAwpuXJLwLlwaOVZ3Z2pRrVQZ3m+Ms8nESWOMMQWZyZXTCePorly4OUfgSnei8lo
	td9zEG5pEE0t5j3QBSuprsePtn9zyTM1IUdDcKHs48Rr+Uq+iYjbJfSbPSKwOmmdkHpX
	9SgDi0EgUYXgp+hxjsJzFmMqeBis6Q6Y6PNC+IOqyKB48L+bi5WiaZhFyGu9eUWu5NQZ
	0lTw==
MIME-Version: 1.0
Received: by 10.152.148.234 with SMTP id tv10mr18857272lab.41.1337587257582;
	Mon, 21 May 2012 01:00:57 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Mon, 21 May 2012 01:00:57 -0700 (PDT)
In-Reply-To: <20120519102215.0b8edf4e@eb-e6520>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<CADZ6=atZrjgogV7zopSvXEvev6kucn524KG-s3Au7ocQ-+Eyyw@mail.gmail.com>
	<20120518214833.GB4208@denix.org>
	<20120519102215.0b8edf4e@eb-e6520>
Date: Mon, 21 May 2012 10:00:57 +0200
Message-ID: <CADZ6=auCvXJPcD+fRA3HSfyK76B_Ur=i2GNSq=z2F4wd55Up=Q@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQmxgiOOhZQPlGLeknILKRmqwaOiYbkqUCT8HTCRusi3J7AChptzGzPMmETypDygNX3iy7Vj
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
X-List-Received-Date: Mon, 21 May 2012 08:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Eric,

>> Netra and Centaurus are internal codenames for the SoC families behind t=
hose
>> part numbers Koen mentioned above. Those codenames are not publicly adve=
rtised
>> and Koen is just showing off after being on the inside... :) :-P
>>
> these names were already dislosed on TI's website, for example :
> http://focus.ti.com/asia/download/1105-techday-abstracts-tw.pdf
> http://processors.wiki.ti.com/index.php/DM814x_AM387x_PSP_Flashing_Tools_=
Guide
>
> and are even in your slides where I first saw them ;-)
> https://wiki.yoctoproject.org/wiki/images/b/b3/Meta-ti.pdf

I guess Denys just wanted to show off a bit there by dropping code
names not publicly advertised, with him being on the inside, you know
>;)

Regars,
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

