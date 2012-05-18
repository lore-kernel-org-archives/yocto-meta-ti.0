Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D2E0E013B7
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 06:52:58 -0700 (PDT)
Received: by weyr3 with SMTP id r3so2567019wey.35
	for <meta-ti@yoctoproject.org>; Fri, 18 May 2012 06:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=r8MbVnyhOgr+jKLxFT2/3gabzuI4xeRIkad6vCbI8V8=;
	b=lpl3Mr2NzY2NCXXk8z4NROamiZrb9L7f7jtC1V2rymKHuB+DhmsOdxhYYGMfGyJOxe
	bWGLpycSxivm7sy+5GCUk270ZX758ACTv2RBpmhH264IdSt1lWb25GcK0D/gls/aLXB3
	GJk0E2mo+6ITkul8QtPH6ZGoNAKxvOACjpO1KgD0K4DlphTYlvd3shzClaxkMe/E6atR
	5SULX+lNoyKA0ag07ZgayJUn5At7qkMlDaaRmxOYKEfKyMgEFZoKQc8rpRIjN9l5ZAYt
	UjW23Ly8FS7RM6nTqUQ3X1HoMMLvMeknj5h61e+DsJiz4CAC9ZrZ6tXJ4xz8ek0KWTFC
	mPlQ==
Received: by 10.180.80.228 with SMTP id u4mr495402wix.5.1337349177713;
	Fri, 18 May 2012 06:52:57 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id r2sm1795761wif.7.2012.05.18.06.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 06:52:56 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
Date: Fri, 18 May 2012 15:52:36 +0200
Message-Id: <331B3AEF-9CA7-4639-A316-43DBB4A03E0D@dominion.thruhere.net>
References: <CADZ6=avh27wFzfty4h6ntoweX3QrLvkz=8pRgFBp8VQ7YEJ71A@mail.gmail.com>
	<jp5gkp$2ip$1@dough.gmane.org>
	<CADZ6=atDkyHJricwLdNqWv9aYNWXUSBVaGhQB1pC9ZTLqNYQtw@mail.gmail.com>
	<C1FD0ECD-98B9-4D93-8351-2A19519FFF2D@dominion.thruhere.net>
	<CADZ6=aux412Otdnf_YBJdJB1JUx2bD2sDXy7TNyaefHhq_YxtQ@mail.gmail.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl+CT2PSIFttRLWUp+G7PD7+Zp+qS9Q9F/cmpfSRDJwi6AbfTmbLv/QKj/DNnzZwp2TqKBg
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
X-List-Received-Date: Fri, 18 May 2012 13:52:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 mei 2012, om 15:39 heeft Thilo Fromm het volgende geschreven:

> Hello Koen,
>=20
>>>>> sorry for the cross-post (openembedded-devel, meta-ti), I think =
this
>>>>> affects both projects one way or the other.
>>>>>=20
>>>>> Recently, meta-openembedded/toolchain-layer removed gcc-4.5. This =
means
>>>>> with oe-core + meta-oe you now can choose between gcc-4.6 and =
gcc-4.7.
>>>>> However, both compilers break the kernel we're using
>>>>> (ti81xx-psp-linux-2.6.37).
>>>>=20
>>>> What happens when you disable the mailbox? AIUI you shouldn't need =
that on
>>>> Ne/Ce.
>>>=20
>>> How do I disable the mailbox?
>>=20
>> In the .config
>=20
> Wait wait wait, according to drivers/staging/tidspbridge/Kconfig we
> need OMAP_MBOX_FWK (i.e. "the mailbox") in order to use the DSP
> bridge. Disabling it would mean cutting off our DSP. No way.

Are you actually using dspbridge? Or are you using dsplink or syslink?

>=20
>>> What do you mean by Ne/Ce?
>>=20
>> Netra/Centaurus, dm81xx, c6a81xx, am38xx, am39xx or whatever TI is =
calling it nowadays.
>=20
> We're on a "TI DaVinci DM8148", featuring a cortex-a8 combined with a
> C674x DSP.

So a centaurus family SoC.

> I think the only ones left without DSPs are AM-...
> processors. So no, the DSP bridge (and therefore mailboxing) must
> stay.

See what I said above, I doubt you're using dspbridge.=

