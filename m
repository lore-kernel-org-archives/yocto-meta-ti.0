Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A66EAE002AB
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 16:27:55 -0700 (PDT)
Received: by vbme21 with SMTP id e21so8019362vbm.35
	for <meta-ti@yoctoproject.org>; Mon, 17 Sep 2012 16:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=XFVwk0q8zG/YA1mqo+5TkbNYJbJoQvDVqwGLGMaQ+q8=;
	b=qrpr6EKMfYVv6ERCR3v2glCOePNWsx1SVch/6TQgSdY/XF/g4Yr8Pf/kzgWtSKMzZV
	Y7F9wrj7wA0TTQuyXZX287HizbTpHsD3mbo53JvefT8Nx28DJZgX3a+kuMLHZugO9J46
	8Tj85+Z6pigM+6u/o41Ur+YDZ5iCQksAOEi/VQJNTkkHXl1rn5pBw0p9S/ADRIP43Npk
	gQ90wJ8C7ZSeKLL+sEW5BUDXorRjSqITLi2go+V7XXaYjiI701sw9j3FPhNfKih6y1up
	S0mgqiXuDBlituH8M31xLaiwvLvKFILjQ29PzxTHeW7nPR7eLEO24DnKM0clCVp3dz7g
	mwaA==
MIME-Version: 1.0
Received: by 10.58.58.144 with SMTP id r16mr8648842veq.52.1347924471332; Mon,
	17 Sep 2012 16:27:51 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Mon, 17 Sep 2012 16:27:51 -0700 (PDT)
In-Reply-To: <B21EAA42-16D6-48D2-98AC-9DD07DA11FB2@dominion.thruhere.net>
References: <20120914064306.GC26968@edge>
	<7D46E86EC0A8354091174257B2FED101591F5F33@DLEE12.ent.ti.com>
	<CA+2YH7vzOwfqcfhM1xu8W=LmD-UV58zLQ6=XvokrCTh1AUvMnA@mail.gmail.com>
	<B21EAA42-16D6-48D2-98AC-9DD07DA11FB2@dominion.thruhere.net>
Date: Tue, 18 Sep 2012 01:27:51 +0200
X-Google-Sender-Auth: p6e2E-aX2p2Rj7ICneYB7yB4H2w
Message-ID: <CA+2YH7ucYnJ6oEe6PtaSUh9iODUZo-qXMrrN2SNy5+bYQBfTeQ@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Mon, 17 Sep 2012 23:27:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 17, 2012 at 10:42 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
>
> Op 17 sep. 2012 om 22:36 heeft Enrico <ebutera@users.berlios.de> het volg=
ende geschreven:
>
>> On Fri, Sep 14, 2012 at 10:06 PM, Maupin, Chase <chase.maupin@ti.com> wr=
ote:
>>> So really I think the question is do we have an agreement on "meta-beag=
le" or whatever it should be called, a timeline for it to be created and th=
e recipes moved?  Let's make meta-ti be the foundation BSP that we can all =
build on top of and nothing more or less.
>>
>> Sorry to jump into the discussion but...am i the only one that thinks
>> that having meta-beagle, meta-panda, meta-whateverTIboard is crazy?
>
> Beagle is not a TI board

Oh come on you got my point ;)

Enrico

