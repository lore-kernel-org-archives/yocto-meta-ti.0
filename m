Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BC37E0132F
	for <meta-ti@yoctoproject.org>; Tue, 24 Apr 2012 23:19:36 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1155419wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 24 Apr 2012 23:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=QADF/JMHZCkAG0uuiLHXfiDBusYB3BDB8HGioYL3sLs=;
	b=VQ0Gu+LO0FVcKecaerhawENVkhF5dwkMzOvEFlHrz+KDRP8Im9HiN/C1klq5Bmru4g
	Iyc07bf47eBp5vV3HRINAtqqQanQR1urqIwcCENbWfHDzgMnLBYaOgV8q1OeBD//A33B
	wyxdUaIw/qBxRYJOMzeGStSC1rWw/eX0oZMqnGPuheIbqowxlILor2bg8Pr+0Vo8VLvv
	IANrmv0fki3YjBUdjDPHmaX6n9bWtveuqQRYOrczFtld5Yzep5GTPf8DKhUnN1A6Fft1
	Fz1F+Iam/BJxjPA+bsCOjbU4txUZ0SzCBUPbQ7Ym18eBO1ZRoaDWLFXEVsdlfJtUkA5J
	ksyA==
Received: by 10.181.12.82 with SMTP id eo18mr38264079wid.2.1335334775970;
	Tue, 24 Apr 2012 23:19:35 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm35095703wib.2.2012.04.24.23.19.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Apr 2012 23:19:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F9794F0.20706@dresearch-fe.de>
Date: Wed, 25 Apr 2012 08:19:32 +0200
Message-Id: <17B574FF-1E81-4D65-8C70-439CCC24974D@dominion.thruhere.net>
References: <4F910E4F.9000800@dresearch-fe.de>
	<20120420132050.GA3783@denix.org> <4F9168F4.50306@dresearch-fe.de>
	<4F9794F0.20706@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk7EUaa1yDwvd7/TG8vs8GcEwB8+nmZs85+wdHQJVCHBKpPl78vXsujSOEN1YkUq9FvMbGk
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti layer confusion
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
X-List-Received-Date: Wed, 25 Apr 2012 06:19:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 25 apr. 2012, om 08:08 heeft Steffen Sledz het volgende geschreven:

> On 20.04.2012 15:47, Steffen Sledz wrote:
>> On 20.04.2012 15:20, Denys Dmytriyenko wrote:
>>> On Fri, Apr 20, 2012 at 09:20:47AM +0200, Steffen Sledz wrote:
>>>> Our company is working on a new TI DM814x based hardware currently.
>>>>=20
>>>> That's a really hard job, because the TI linux support is not =
really "optimal". But that's not the primary cause for my message.
>>>>=20
>>>> [1] lists two TI BSP layers [2],[3] each one claiming to be "The =
official OpenEmbedded/Yocto BSP layer for Texas Instruments platforms.".
>>>>=20
>>>> A look into them shows that they are not identically. At the moment =
they differ in two commits ([3] is ahead of [2]). In the last days these =
differences where much bigger.
>>>>=20
>>>> So what is the intention for these two "offical" layers?
>>>>=20
>>>> Which one should we use? And why?
>>>>=20
>>>> BTW: Is anyone else out there working on a TI DM814x/DM816x =
hardware?
>>>>=20
>>>> Regards,
>>>> Steffen
>>>>=20
>>>> [1] <http://www.openembedded.org/wiki/LayerIndex>
>>>> [2] <http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/>
>>>> [3] <https://github.com/Angstrom-distribution/meta-ti>
>>>=20
>>> They are the same. Or more appropriately, there is just one official =
meta-ti=20
>>> layer, it's just mirrored in several places. The one on =
yoctoproject.org[2] is=20
>>> considered the official mirror and that's what you should use. If =
you are=20
>>> subscribed to this list, you should have seen Koen posting 2 patches =
for=20
>>> review yesterday, which he has staged to his working copy on =
github[3] -=20
>>> that's the difference in 2 commits. They shouldn't have been pushed =
to the=20
>>> master branch though, until they are accepted...
>>=20
>> Why are they both listed in [1]?
>=20
> Any objections if i remove [3] from the LayerIndex?

Yes

>=20
> After your comments i think that this one is just a kind of a staging =
area.

And you're thinking wrong=

