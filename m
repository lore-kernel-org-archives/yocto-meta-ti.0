Return-Path: <cliff.brake@gmail.com>
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9C92AE0032E
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 11:21:36 -0800 (PST)
Received: by mail-vc0-f176.google.com with SMTP id fl13so6446581vcb.35
	for <meta-ti@yoctoproject.org>; Mon, 19 Nov 2012 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=b/WBsEC9ERBtAHHPX+lADcmB6n5WeNZNIzfV4EBa0sM=;
	b=1GOw80l/zdZY4Or5lyroTEqOGhQkhw7tVwzLOc0+Sk6k4GRPetHwG2mvVkYwwIO9Ft
	tLGF5t7JQ5mYA5Lbgl5F/Y9qWamoE9GkujtCNqIqlr5zEijgU95mKqIHSpxhraVQlUD7
	Demr5Y/FHuo/zRJYGPcpWp9E46PL7BXGNf1F8WD29Kj7WHeHursz4HqVS78e3w0nAlyu
	wISl9Hvf42YiQ+6y1USEWNVYgMzvJGSP2ZPHcCPwgiSLrtSc4zFseTqDRGxY4DswFQc2
	yMr1b6l20r5SbMWKzI5Ie520t/TrTWqUtlUdbPgCA/2LlbLbHboojFX7iWU2tcrrdyzW
	VUPw==
MIME-Version: 1.0
Received: by 10.220.16.12 with SMTP id m12mr20585111vca.14.1353352895527; Mon,
	19 Nov 2012 11:21:35 -0800 (PST)
Received: by 10.58.155.199 with HTTP; Mon, 19 Nov 2012 11:21:35 -0800 (PST)
In-Reply-To: <CAOd_LFxPVW1Sx-4H4jhbu=40HB6_uZe6CvUOCPQe_xKTd-NsLQ@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
	<20121117000555.GK7631@edge>
	<CAOd_LFwO7qx6HFrQOuGCJCYQ7vCMVikkZ80XX=3Hd=t8qDkOQA@mail.gmail.com>
	<CAOd_LFxd=_sjk3Vd-cnjLnrP=bT-fkya7sbqcCZCnmMjAcU=7w@mail.gmail.com>
	<CA+2YH7v8JzAnc=BgQ1h4n4ZJ+niVXL00+g-s+CtTnkjbV1x0gg@mail.gmail.com>
	<CAOd_LFxPVW1Sx-4H4jhbu=40HB6_uZe6CvUOCPQe_xKTd-NsLQ@mail.gmail.com>
Date: Mon, 19 Nov 2012 14:21:35 -0500
Message-ID: <CAOd_LFwQKyo4Fggo=+WmokUFQPX=HSjuGhA66WpbL3YJrnLAPw@mail.gmail.com>
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
X-List-Received-Date: Mon, 19 Nov 2012 19:21:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 19, 2012 at 11:42 AM, Cliff Brake <cliff.brake@gmail.com> wrote:
> On Sun, Nov 18, 2012 at 7:06 AM, Enrico <ebutera@users.sourceforge.net> wrote:
>
>> From the boot log you attached it seems that the kernel hanged far
>> before the login prompt.
>>
>> I can send you an uImage i'm using with a similar setup to test, the
>> only difference i can see is that i have a pandabord ES.
>
> Yes, I'd be interested in trying your kernel.
>
> I tried the validation image from pandaboard.org, and that seems to boot fine.

mainline linux kernel + a few config tweaks now boots my systemd image
just fine.

I have a non-ES rev EA1 board, so not sure if there is anything
different about it ...

Now, trying to sort the kernel params required to get the display working ...

Thanks,
Cliff

-- 
=================
http://bec-systems.com

