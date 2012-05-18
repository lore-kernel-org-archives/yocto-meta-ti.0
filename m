Return-Path: <fromm@dresearch-fe.de>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E3B3E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:55:37 -0700 (PDT)
Received: by lboj14 with SMTP id j14so3019385lbo.35
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 07:55:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=1auNEPNNxkQhcH+BKv9LVp99DYnseNevU4GmyaZZtU8=;
	b=JispREYe5JZAjh17EmWqC7VSRlp3QncYrCBV5PrAaSCr+KmHImXwZAdl1NRehVbDbR
	Xvga+w0EMM62vsUvAhqsK8yvHXsw43A3dLr/MfxBE5kZQ576KaQWMK2f2K4fUAeGRBCs
	mcPB83UN0pYWxeCk8qV/VtuKKR4kWhfCYkN5u1XhGUjV7MqzCDFj3LP2YPP1xf+ku5Ld
	5e1KBtJxGwO1QNTCizKKQ7eS8NtEA1n9qs2Th/Yc2Ynl4+xu/C5AtS0m434COy4irIja
	ORLFjdAA4zYek3usXgxaAHfhtoFIVI6alB3bdUAs0mD4nW68tLCItWMAd71AqeLwjG9g
	VLZw==
MIME-Version: 1.0
Received: by 10.152.48.6 with SMTP id h6mr11376536lan.30.1337352936974; Fri,
	18 May 2012 07:55:36 -0700 (PDT)
Received: by 10.112.100.132 with HTTP; Fri, 18 May 2012 07:55:36 -0700 (PDT)
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
	<331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
	<4C82F39BABFE6A429733A300DEBF52240B76E4EE@DNCE05.ent.ti.com>
Date: Fri, 18 May 2012 16:55:36 +0200
Message-ID: <CADZ6=avtEDxL1jHTyc218+1Qzf79w0p+YLwPiLOibN6KgC1jsQ@mail.gmail.com>
From: Thilo Fromm <fromm@dresearch-fe.de>
To: "Monk, Roger" <r-monk@ti.com>
X-Gm-Message-State: ALoCoQloZR/PhCKIZapKEWKc110Vdpz+6nHkTC97Dyneo0k5HVw1dd2dD/TaYkn8OStLeUkkORwu
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 18 May 2012 14:55:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Roger,

>> >>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think
>> >>>>> this affects both projects one way or the other.
>> >>>>>
>> >>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5.
>> >>>>> This means with oe-core + meta-oe you now can choose between
>> >>>>> gcc-4.6 and gcc-4.7.
>> >>>>> However, both compilers break the kernel we're using
>> >>>>> (ti81xx-psp-linux-2.6.37).
>> >>>>
>> > We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with
>> > a C674x DSP.
>>
>> So a centaurus family SoC.
>
> Can you put some printk's in omap_mbox_register (plat-omap/mailbox.c) to =
print the list objects, in particular the mbox->name?

What are you trying to do? printk-debugging? Via E-Mail? Are you
serious? I provided a simple procedure to reproduce the issue. Please
reproduce and fix the problem.

> Would also be useful to see the same in omap_mbox_get() before the call t=
o strcmp().

Please do that, go there and take a look.

We'll be using gcc-4.5 in the HidaV layer until TI fixes this mess.

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

