Return-Path: <cliff.brake@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CBFAE0051E
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 06:02:14 -0800 (PST)
Received: by mail-vc0-f176.google.com with SMTP id fl13so7418760vcb.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 06:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ofTQdTf6P44jyIc9ohDHNOndPFcIWhIsSbHMYjYMooE=;
	b=iY6Zs2t+hnIFGnPvFFBsqDKDee+86LkpG5xeOp/ZetvtzENy3KeSTQgl4lcPc3SJHH
	N4onMtZekkndPYKAXX21zo3N4dQBvf8XrcF+11v2pT1qF4SSW/3fGSBhRCpUAY9n0CbG
	nd9dss6YXiJCaTLTp+vzYDakKBGkkmKncH+U6vK4VnM7OJnmBEwuWe7zQjCUz+f2Wrcv
	i2b8Scw2NatfbPK7MTs2F7BGYqmK/m+OxDPbXTCvFhf8x+xkh+trGmlMlNfRx3b7l/+I
	ptaJk0a7J/2HnzaO00u1knYymljJGym3ALPiXyjGE0bf2fFpfAsE3wDjLF/2SePvY21v
	M4MQ==
MIME-Version: 1.0
Received: by 10.220.225.132 with SMTP id is4mr23504086vcb.47.1353420133947;
	Tue, 20 Nov 2012 06:02:13 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Tue, 20 Nov 2012 06:02:13 -0800 (PST)
In-Reply-To: <CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
Date: Tue, 20 Nov 2012 09:02:13 -0500
Message-ID: <CAOd_LFwhgJNzxpRYjX+w32PemaqRZCOPFop0QXeiVSLqMHBhjA@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Enrico <ebutera@users.sourceforge.net>
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
X-List-Received-Date: Tue, 20 Nov 2012 14:02:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 18, 2012 at 7:06 AM, Enrico <ebutera@users.sourceforge.net> wrote:
> On Sat, Nov 17, 2012 at 8:34 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>> copying mail list ...
>>
>> On Sat, Nov 17, 2012 at 2:33 PM, Cliff Brake <cliff.brake@gmail.com> wrote:
>>>
>>> On Fri, Nov 16, 2012 at 7:05 PM, Denys Dmytriyenko <denys@ti.com> wrote:
>>>>
>>>> On Fri, Nov 16, 2012 at 04:56:53PM -0500, Cliff Brake wrote:
>>>> > I'm trying to boot a recent oe-core+meta-oe+meta-angstrom+meta-ti on a
>>>> > pandaboard.  With 3.4, I get the attached.  With 3.1, I get the below:
>>>>
>>>> 3.4 should work. With 3.1 there were some reports that it didn't boot,
>>>> when
>>>> built with recent toolchain from oe-core... What problems do you have
>>>> with
>>>> 3.4? Does it boot?
>>>
>>>
>>> I don't get to a log-in prompt:
>
> From the boot log you attached it seems that the kernel hanged far
> before the login prompt.
>
> I can send you an uImage i'm using with a similar setup to test, the
> only difference i can see is that i have a pandabord ES.

Enrico sent me a uImage which I tried and it does the same thing:

....
[    0.000000] OMAP4430 ES2.0
....
[    2.950775] asoc: omap-hdmi-hifi <-> omap-hdmi-audio-dai mapping ok
[    2.958465] u32 classifier
[    2.961364]     Actions configured
[    2.965332] TCP: cubic registered
[    2.969390] NET: Registered protocol family 10
[    2.974975] NET: Registered protocol family 17
[    2.979858] lib80211: common routines for IEEE802.11 drivers
[    2.986053] Registering the dns_resolver key type
[    2.991271] VFP support v0.3: implementor 41 architecture 3 part 30
variant 9 rev 1
[    2.999572] ThumbEE CPU extension supported.
[    3.004211] Registering SWP/SWPB emulation handler

(stops here)

As mentioned before, mainline kernels boot fine on this board, so it
appears the meta-ti kernel has problems with at least some non-ES
Panda boards.

Enrico, can you send me a complete boot log from your system?  Perhaps
if I can see which drivers are being initialized after the above
message, then we can more easily narrow it down.

Also, do you have the display working on your system?  If so, did you
have to add any special kernel command line args to select the display
format, etc?

Thanks,
Cliff

-- 
=================
http://bec-systems.com

