Return-Path: <ebutera@gmail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A744E0073F
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 08:34:45 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so1308886bkc.35
	for <meta-ti@yoctoproject.org>; Wed, 27 Jun 2012 08:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=/juwhGJ5SNdw03Y8ya9c6G+3c+O/ryPw4t5qx6OKsQI=;
	b=fxlv3HnfZ6XQn99SX4OqMHGgjDDz4mdPXGRk71saHwQ7qR/qayCESLSHx42mH2Ca6n
	99R6zWVMYiAnRXpnXjiqtVU8hWI4dLJh8/mtVt88VNMojDkoVX2iOgRkctnTnKMQutxQ
	7GsGRW9TbGHeCAravkUr0vCBFUm2ZCc9tmlHCyYR5AP0mWNq/iYZzhTMq8sh1BoJ09i+
	A3o0DCE+eg6h1T36RUBRrwsJOylOqnD7E6taef1OlxEF4PQcbJblRO6MBDxJtQytN3Lh
	0N9YVGobfSK6QkMyvNF5qnemqfMOAKpOgDelMWZ+7OZlxthJ4LS7pV5RiNC+AU5qFLsW
	c3BA==
MIME-Version: 1.0
Received: by 10.204.151.130 with SMTP id c2mr7726129bkw.125.1340811284554;
	Wed, 27 Jun 2012 08:34:44 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.204.18.143 with HTTP; Wed, 27 Jun 2012 08:34:44 -0700 (PDT)
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B8056E2@DNCE05.ent.ti.com>
References: <CADZ6=asseEZTzS6dz0we4-Czbr_n2Y6Pps5UsfGagh7NV04BqQ@mail.gmail.com>
	<CA+2YH7vu646k8kMUS9pYfJQ6+6s5PdvTdyxJSQewztRAaFEomg@mail.gmail.com>
	<CADZ6=au5b5fKuhUm=4Nrsq2es66+u=X1aorgUgDLK8AZDA3mEg@mail.gmail.com>
	<7B98F5B8-3C44-4919-B826-36C3A3B75319@ti.com>
	<4C82F39BABFE6A429733A300DEBF52240B8056E2@DNCE05.ent.ti.com>
Date: Wed, 27 Jun 2012 17:34:44 +0200
X-Google-Sender-Auth: iCBI0BAltdc9T4Myp8IcmTyCIoY
Message-ID: <CA+2YH7vyMKhpbefJRWN7CBWqj_xgkxN=LPVLjq5m1ZO0n_2s5Q@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: "Monk, Roger" <r-monk@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: gstreamer / ti-dmai component does not build for ti8148-evm
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
X-List-Received-Date: Wed, 27 Jun 2012 15:34:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 27, 2012 at 5:06 PM, Monk, Roger <r-monk@ti.com> wrote:
> On Wed, Jun 27, 2012 at 15:44:48, Dmytriyenko, Denys wrote:
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] gstreamer / ti-dmai component does not build
>> for ti8148-evm
>>
>> Sorry for top post.
>>
>> gst-ducati is not part of meta-ti and it wasn't integrated yet.
>> Although someone (was it Enrico?) had previously sent unfinished
>> patches for it - you can check the archives. It didn't work for me on
>> the first try and I had no time debugging it further, so the patches
>> got postponed for now - I still have them in my Todo list though...

When i did it there was the problem that HDVICP2 sources (required to
build the stack) disappeared from TI (public) site, will they ever
come back?

> But either way... DM814x doesn't use gst-ducati. =A0 It uses gstreamer-ti=
, (on TI81xx branch) which is basically a gst-openmax interface.

Out of curiosity, can the same version be used for the pandaboard?

Enrico

