Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76733E0027F
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 13:46:33 -0700 (PDT)
Received: by eekd41 with SMTP id d41so4138172eek.35
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 13:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=sTFrjXVV1HfQnyprEV8etYOX8/N2+zSNTIcoNbMXD3U=;
	b=ToD4u9MfzABnFFYxv0T4yYur6oda7ggruwCrH5zN5TUCnx6tP+2dDi70fs27YTgMmA
	ru5IiWtl044DHaCqpKQjEVtVkg1W+shpqoK5ub5mPH5oVCe5mmf/iJHhHROhXU+2Kzzf
	HSyBW/SO6NllnAb8SuBjcya0ZvHlpJKdRds0DAjb/Fu7qj/wPv6WgXztV23EM/zNfPKh
	7g5WUi6gugXC6ObMp9uJPkTdgEli1ji6qmfsqI6J1JIyeQBi15Jpbsui/aCh09k/7oRq
	38JvKkVO4TO9BUAGKOZ37F8C4ghSNrSOrxNsniAdaNxJaYUym0MgbKgQ4IcZwaBbBFf/
	p3fw==
Received: by 10.14.172.193 with SMTP id t41mr14992065eel.25.1347914791986;
	Mon, 17 Sep 2012 13:46:31 -0700 (PDT)
Received: from [172.20.0.4] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id i41sm30674902eem.7.2012.09.17.13.46.30
	(version=SSLv3 cipher=OTHER); Mon, 17 Sep 2012 13:46:31 -0700 (PDT)
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
	<CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
In-Reply-To: <CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <B21EAA42-16D6-48D2-98AC-9DD07DA11FB2@dominion.thruhere.net>
X-Mailer: iPhone Mail (9B206)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Sep 2012 22:42:39 +0200
To: Enrico <ebutera@users.berlios.de>
X-Gm-Message-State: ALoCoQnAVUmKU5f4NV9A9A26sQ98tEBGhEc1E/8VpkhOnGI9V4GJlw7K0RrPEg4fMUDqpV2PiS2m
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: RFC: 2 possible workarounds for recipes-misc dependency on Angstrom
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
X-List-Received-Date: Mon, 17 Sep 2012 20:46:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 17 sep. 2012 om 22:36 heeft Enrico <ebutera@users.berlios.de> het volgend=
e geschreven:

> On Fri, Sep 14, 2012 at 10:06 PM, Maupin, Chase <chase.maupin@ti.com> wrot=
e:
>> So really I think the question is do we have an agreement on "meta-beagle=
" or whatever it should be called, a timeline for it to be created and the r=
ecipes moved?  Let's make meta-ti be the foundation BSP that we can all buil=
d on top of and nothing more or less.
>=20
> Sorry to jump into the discussion but...am i the only one that thinks
> that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?

Beagle is not a TI board=20



>=20
> Enrico
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

