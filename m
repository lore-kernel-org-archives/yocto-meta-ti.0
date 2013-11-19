Return-Path: <richard.rojfors@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 298A1E004E5
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 01:32:30 -0800 (PST)
Received: by mail-ee0-f42.google.com with SMTP id e52so3129084eek.29
	for <meta-ti@yoctoproject.org>; Tue, 19 Nov 2013 01:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YhIZK/AEmoP981VWuFhTsJGgkwcmCjpcVs0mrDR9Lps=;
	b=qjqejNuLUbVeOdd99nBJkkPdfTHjW2jEcryhfBoiGZsaQoIXdE9RvMO6/ENWrCLfL2
	FaIRR8NwRGezowlHi1xAkXPUPova+JkiHNo0B1VuRUUdg1IUkqYNBbEVBuJAlukD0pno
	nYaE6JE5aMs1Rw7MYVkCVmaa3OPsBEfw4CmzqARu5Sd4bXmFGFUxFiEwfWcW08kCqoU0
	ZgOAc9pPTnOQGr7Lr8llDxESIXlgKUNSpIXcj7HVEhPkwsqfXQ34du7sHC45rILfYNJf
	bDQScJqWpVlGW7M1uKUwuttN9TNIIkmGvHgP0hx0z8e8KzYUoVcHtERyu0OUq5j963eX
	zxLA==
MIME-Version: 1.0
X-Received: by 10.14.88.132 with SMTP id a4mr1620254eef.60.1384853549194; Tue,
	19 Nov 2013 01:32:29 -0800 (PST)
Received: by 10.15.101.1 with HTTP; Tue, 19 Nov 2013 01:32:29 -0800 (PST)
In-Reply-To: <20131119060652.GN19813@edge>
References: <245245F712CBF74D865D90E99497849F0642BFF8@mail-3.tvm.nestgroup.net>
	<20131119060652.GN19813@edge>
Date: Tue, 19 Nov 2013 10:32:29 +0100
Message-ID: <CAHB-PjneUhnw6=GNUaJiFkr7LzCPMBsY8gmTJHTPhpEV=XG7Lw@mail.gmail.com>
From: =?ISO-8859-1?Q?Richard_R=F6jfors?= <richard.rojfors@gmail.com>
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
X-List-Received-Date: Tue, 19 Nov 2013 09:32:31 -0000
Content-Type: multipart/alternative; boundary=001a11c1ba04dda44f04eb845787

--001a11c1ba04dda44f04eb845787
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 19, 2013 at 7:06 AM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> No graphics for omap4+ (yet) in meta-ti. There are recipes being worked out
> though.
>

Good news, finally!

I hope this will be something like what was last released in the Ubuntu
PPA? Meaning it does not need X.

Will you link the userspace against a more recent wayland than in the
Ubuntu ppa?

Will this work with recent kernels, like 3.12? (This would mean forward
porting the userspace connector stuff to the non-staging omapdrm)

When will this happen?

I have done this myself but since the TI community effort disappeared for
OMAP4 I had to use a 3.4 kernel from the Ubuntu PPA.

--Richard

--001a11c1ba04dda44f04eb845787
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, Nov 19, 2013 at 7:06 AM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
</div>No graphics for omap4+ (yet) in meta-ti. There are recipes being work=
ed out<br>
though.<br></blockquote><div><br></div><div>Good news, finally!</div><div><=
br></div><div>I hope this will be something like what was last released in =
the Ubuntu PPA? Meaning it does not need X.</div><div><br></div><div>Will y=
ou link the userspace against a more recent wayland than in the Ubuntu ppa?=
</div>
<div><br></div><div>Will this work with recent kernels, like 3.12? (This wo=
uld mean forward porting the userspace connector stuff to the non-staging o=
mapdrm)</div><div><br></div><div>When will this happen?</div><div><br></div=
>
<div>I have done this myself but since the TI community effort disappeared =
for OMAP4 I had to use a 3.4 kernel from the Ubuntu PPA.</div><div><br></di=
v><div>--Richard</div></div></div></div>

--001a11c1ba04dda44f04eb845787--
