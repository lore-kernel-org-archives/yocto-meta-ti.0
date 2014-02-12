Return-Path: <richard.rojfors@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B4D5E007B1
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 02:46:30 -0800 (PST)
Received: by mail-ee0-f50.google.com with SMTP id d17so4213900eek.23
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 02:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Dc0HcRk1VwQb2bA8LobkDRo/74Zjzv6chsicu90liBA=;
	b=fX4cdy8qFrL4QJDHblvzYhXOjOB4+Kbbch0es20VhMv8SJSNB/dKgKKCX7iyybCFZf
	Cb2mg6E3li/3lCOfhEgxemDBDJF8/txYf4eAzGMZz1s5s04GnEh8ScAT6GAgyXz4r1Nz
	7Y/dfQ19kZ0Dh9wOWQASO/db+18ryIE2RgUvOQOM8wmU3VnLcdkhBqBewQY3GKQMLU6X
	aOu/Te5KZfkEzXaDMy21CRQHjuMrnWguKpqTt8BPZjo6XmE2g9wh+kZRG2HJRysCEuBK
	XL0FidE3ILJprJdglTAsU0ff78M60Eue+wvD3D1tDJB+J0SJdrDWefUXZWec6dFaasqK
	FS3A==
MIME-Version: 1.0
X-Received: by 10.15.63.73 with SMTP id l49mr80191eex.113.1392201988961; Wed,
	12 Feb 2014 02:46:28 -0800 (PST)
Received: by 10.14.178.196 with HTTP; Wed, 12 Feb 2014 02:46:28 -0800 (PST)
In-Reply-To: <20131119060652.GN19813@edge>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
Date: Wed, 12 Feb 2014 11:46:28 +0100
Message-ID: <CAHB-PjkUvfgpsqU8SgmM_+aPYHZbbWUFnrPAsijL7MDaDYs9ug@mail.gmail.com>
From: =?UTF-8?Q?Richard_R=C3=B6jfors?= <richard.rojfors@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: pandaboard/omap4 support
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
X-List-Received-Date: Wed, 12 Feb 2014 10:46:33 -0000
Content-Type: multipart/alternative; boundary=001a1132f08c01fb1e04f23349f6

--001a1132f08c01fb1e04f23349f6
Content-Type: text/plain; charset=UTF-8

Hi,

On Tue, Nov 19, 2013 at 7:06 AM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> No graphics for omap4+ (yet) in meta-ti. There are recipes being worked out
> though.
>

Any updates on this?

Now when oe-core is on gcc 4.8 (and there is some binary incompatibilities
between gcc 4.7 and 4.8) I think it's getting important to get those binary
blobs out compiled with gcc 4.8.

--Richard

--001a1132f08c01fb1e04f23349f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div class=3D"gmail_extra"><div class=3D=
"gmail_quote">On Tue, Nov 19, 2013 at 7:06 AM, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com=
</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D""><br>
</div>No graphics for omap4+ (yet) in meta-ti. There are recipes being work=
ed out<br>
though.<br></blockquote><div><br></div><div>Any updates on this?</div><div>=
<br></div><div>Now when oe-core is on gcc 4.8 (and there is some binary inc=
ompatibilities between gcc 4.7 and 4.8) I think it&#39;s getting important =
to get those binary blobs out compiled with gcc 4.8.</div>
<div><br></div><div>--Richard</div></div></div></div>

--001a1132f08c01fb1e04f23349f6--
