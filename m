Return-Path: <marek.belisko@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E225E0049F
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 12:29:13 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id 13so1463913iea.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 12:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R94Wwh7uibHt1RI6p6L5XrnyEYfeyKKWE8IqVz+vnhY=;
	b=YrhV+RAFeFG1dKCNB4rEUgFBLO5omYknJQ4bTMbwHNJ2fCs1G4ThdGQhkjbZ+Scudg
	kRTtDQB2Is6sQewoBcCME/L0+HGLoLcOgoVUGvOqZ44MfD6/+NOPht2aW2DypvWJoUUX
	8lXrzeGPSnRfNJKGomHwQXhHHWHwCYGUqgsrSiSng5vTjdlInkgrI55lScBjks13DeGE
	h7EZgwC3sEfDfbXzkYhCd/xIpqhtnKhZLgXYpqq7l3hMjk05YOr6AYKsH5vy2gVtl0GB
	fSUGcE6sQw6MMyeiG7EBGIpJgDA7uU7DOrOuYGN6Qe+kgnvhoqaS+ozNjM0xwP+/jvun
	eG0A==
MIME-Version: 1.0
Received: by 10.50.85.170 with SMTP id i10mr7448210igz.14.1353356952581; Mon,
	19 Nov 2012 12:29:12 -0800 (PST)
Received: by 10.64.171.82 with HTTP; Mon, 19 Nov 2012 12:29:12 -0800 (PST)
In-Reply-To: <CAOd_LFwQKyo4Fggo=+WmokUFQPX=HSjuGhA66WpbL3YJrnLAPw@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
	<CAOd_LFxPVW1Sx-4H4jhbu=40HB6_uZe6CvUOCPQe_xKTd-NsLQ@mail.gmail.com>
	<CAOd_LFwQKyo4Fggo=+WmokUFQPX=HSjuGhA66WpbL3YJrnLAPw@mail.gmail.com>
Date: Mon, 19 Nov 2012 21:29:12 +0100
Message-ID: <CAAfyv373JT1hXJTSxL8CxmoyMLFzqRREk-Bha+ahEQPL+UwVgw@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
To: Cliff Brake <cliff.brake@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: which kernel for pandaboard?
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
X-List-Received-Date: Mon, 19 Nov 2012 20:29:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Nov 19, 2012 at 8:21 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Mon, Nov 19, 2012 at 11:42 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
>> On Sun, Nov 18, 2012 at 7:06 AM, Enrico <ebutera@users.sourceforge.net> wrote:
>>
>>> From the boot log you attached it seems that the kernel hanged far
>>> before the login prompt.
>>>
>>> I can send you an uImage i'm using with a similar setup to test, the
>>> only difference i can see is that i have a pandabord ES.
>>
>> Yes, I'd be interested in trying your kernel.
>>
>> I tried the validation image from pandaboard.org, and that seems to boot fine.
>
> mainline linux kernel + a few config tweaks now boots my systemd image
> just fine.
Can you please share how to build mainline kernel in yocto. I try
build meta-ti pandaboard kernel
but there was an issue with fetching git kernel tree.
>
> I have a non-ES rev EA1 board, so not sure if there is anything
> different about it ...
>
> Now, trying to sort the kernel params required to get the display working ...
>
> Thanks,
> Cliff
>
> --
> =================
> http://bec-systems.com
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

Cheers,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

