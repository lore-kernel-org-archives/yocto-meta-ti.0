Return-Path: <sidebranch.openembedded@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4F71E01423
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 05:09:25 -0800 (PST)
Received: by mail-wi0-f182.google.com with SMTP id cb5so1567640wib.11
	for <meta-ti@yoctoproject.org>; Wed, 21 Nov 2012 05:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GB2J7wN82RnxoVUju8zrSRA32Iyicqjsb0n7pazqlTY=;
	b=dsQOgkP08JsN6qlPe/5i68tFELP+hV6zZdzse5uTA/1HtpN3/eiBd/76oSqBs8N39+
	RfiYi5LxB0cjZkdgqautASiq7HE/DVEBP7Mt4XIE1yyFklUrB/TMgJgt0ARMcbQJIQyt
	2hVmUYLkuuYPcuuFCcHLCBFrAvi8qB+8U/kTaKqol5noQmLzIR5UKwRkCEYMMtw51sgW
	jYL8CRY6IhyqygJUk+PZ1NDNp2MizpKW3Ku8H38MmNpB72hSDwgdwq3C8LUgBToG1Lxc
	Qe4EqBrCokbLEp1Pr0NvE9WlxhBWpIinYNzTjXs4U/1qLCQaZ4XAZ0kn/reFpllSDcbk
	9zLw==
MIME-Version: 1.0
Received: by 10.180.92.71 with SMTP id ck7mr19694749wib.20.1353503364668; Wed,
	21 Nov 2012 05:09:24 -0800 (PST)
Received: by 10.194.22.34 with HTTP; Wed, 21 Nov 2012 05:09:24 -0800 (PST)
In-Reply-To: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
References: <CAOd_LFxJGZ=MW6ni9Sr3PzUQruNNgf=Wzuw+nJYjO1bTxDQUZA@mail.gmail.com>
Date: Wed, 21 Nov 2012 14:09:24 +0100
Message-ID: <CAMvUbCxkwWxBO_LqYgkjL0Kdq0QAuO4yLmmFv_SumrpMnegohw@mail.gmail.com>
From: Leon Woestenberg <sidebranch.openembedded@gmail.com>
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
X-List-Received-Date: Wed, 21 Nov 2012 13:09:26 -0000
Content-Type: multipart/alternative; boundary=f46d043c807040db6f04cf010f60

--f46d043c807040db6f04cf010f60
Content-Type: text/plain; charset=ISO-8859-1

Hello Cliff, all,

On Fri, Nov 16, 2012 at 10:56 PM, Cliff Brake <cliff.brake@gmail.com> wrote:

>
> Uncompressing Linux... done, booting the kernel.
>
> (nothing more)
>
>
> I have tried to read through the whole thread and understand if there was
convergence on what the probable cause could be, but as I could not find
one.
Without intending to capture this thread:

I just experience the same on my TI AM 3730 board when I moved the
poky-denzil layer to the poky-danny layer and moved meta-ti to latest
(HEAD). I redid the whole build from scratch, and experienced the same
problem.
My kernel recipe is outside of meta-ti, so either I am picking up a faulty
toolchain for ARM, or I am including something from meta-ti that changed.

Might be unrelated to your problem.

Regards,

Leon.

--f46d043c807040db6f04cf010f60
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Cliff, all,<br><br><div class=3D"gmail_quote">On Fri, Nov 16, 2012 at=
 10:56 PM, Cliff Brake <span dir=3D"ltr">&lt;<a href=3D"mailto:cliff.brake@=
gmail.com" target=3D"_blank">cliff.brake@gmail.com</a>&gt;</span> wrote:<br=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">
<div><div><br></div><div>Uncompressing Linux... done, booting the kernel.</=
div><div><br>
</div><div>(nothing more)</div><div><br></div><br></div></blockquote></div>=
I have tried to read through the whole thread and understand if there was c=
onvergence on what the probable cause could be, but as I could not find one=
.<br>
Without intending to capture this thread:<br><br>I just experience the same=
 on my TI AM 3730 board when I moved the poky-denzil layer to the poky-dann=
y layer and moved meta-ti to latest (HEAD). I redid the whole build from sc=
ratch, and experienced the same problem.<br>
My kernel recipe is outside of meta-ti, so either I am picking up a faulty =
toolchain for ARM, or I am including something from meta-ti that changed.<b=
r><br>Might be unrelated to your problem.<br><br>Regards,<br><br>Leon.<br>

--f46d043c807040db6f04cf010f60--
